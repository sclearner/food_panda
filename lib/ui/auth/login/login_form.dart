part of 'login_page.dart';

///Biểu mẫu đăng nhập trong trang Đăng nhập [LoginScreen]
class LoginForm extends StatefulWidget with LoginFormFunctions {
  ///Biểu mẫu đăng nhập trong trang Đăng nhập [LoginScreen]
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with LoginFormFunctions, UsernameStateBuilder, PasswordStateBuilder {
  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController.addListener(
      () {
        context
            .read<LoginBloc>()
            .add(LoginUsernameChanged(_usernameController.text));
      },
    );
    _passwordController.addListener(() {
      context
          .read<LoginBloc>()
          .add(LoginPasswordChanged(_passwordController.text));
    });
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: _networkErrorListener,
      child: Form(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: _usernameBuildWhen, builder: _usernameBuilder),
                  BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: _passwordBuildWhen, builder: _passwordBuilder),
                ],
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.status == AuthStatus.auth) {
                    HomeRoute().go(context);
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (p, c) => p.status != c.status,
                    builder: (context, state) {
                      return FilledButton(
                        onPressed: (LoginStatus.waiting != state.status)
                            ? () async {
                                context
                                    .read<LoginBloc>()
                                    .add(const LoginValidated());
                                context
                                    .read<LoginBloc>()
                                    .add(const LoginSubmitted());
                              }
                            : null,
                        style: FilledButton.styleFrom(
                            foregroundColor: context.colorScheme.onPrimary,
                            backgroundColor:
                                (state.status == LoginStatus.success)
                                    ? Colors.lightGreen
                                    : null),
                        child: Builder(builder: (context) {
                          if (state.status == LoginStatus.waiting) {
                            return FutureBuilder(
                              future: Future.delayed(5.seconds).then((value) => 1),
                              builder: (context, snapshot) {
                                List<Widget> longerThanUsual = (snapshot.hasData) ? [
                                  const SizedBox(height: 10, width: 10),
                                  const Text("Login is longer than usual."),
                                ] : [];
                                return OverflowBar(
                                  children: [
                                    CircularProgressIndicator(
                                      color: context.colorScheme.onPrimary,
                                    ),
                                    ...longerThanUsual
                                  ],
                                );
                              }
                            );
                          } else if (state.status == LoginStatus.success)
                            return const Center(child: Icon(Icons.check));
                          else
                            return const Text("LOGIN");
                        }),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

mixin LoginFormFunctions {
  void _networkErrorListener(BuildContext context, LoginState state) {
    final networkException = state.exceptions
        .where((e) => e.cause == LoginExceptionCause.network)
        .firstOrNull;
    if (networkException != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss)
        ..showSnackBar(
          SnackBar(content: Text(networkException.message)),
        );
    }
  }
}

mixin class UsernameStateBuilder {
  late final TextEditingController _usernameController;
  final FocusNode _usernameNode = FocusNode();

  bool _usernameBuildWhen(LoginState previous, LoginState current) =>
      (current.status != LoginStatus.initial &&
          (previous.username != current.username ||
              !listEquals(previous.exceptions, current.exceptions))) ||
      (current.status == LoginStatus.waiting ||
          previous.status == LoginStatus.waiting);

  Widget _usernameBuilder(BuildContext context, LoginState state) {
    final usernameException = state.exceptions
        .where((element) => element.cause == LoginExceptionCause.username)
        .map((e) => e.message);
    return StatefulBuilder(builder: (context, _) {
      return TextFormField(
          enabled: state.status != LoginStatus.waiting,
          key: ValueKey("login_username_field"),
          controller: _usernameController,
          style: const TextStyle(color: AppColors.white),
          focusNode: _usernameNode,
          selectionHeightStyle: BoxHeightStyle.max,
          selectionWidthStyle: BoxWidthStyle.max,
          keyboardType: TextInputType.name,
          autofillHints: const [AutofillHints.username],
          onTapOutside: (_) {
            if (state.status != LoginStatus.waiting)
              context.read<LoginBloc>().add(const LoginValidated());
            _usernameNode.unfocus();
          },
          textInputAction: TextInputAction.next,
          decoration: _decoration(context.colorScheme).copyWith(
              labelText: "Username",
              errorText: usernameException.isNotEmpty
                  ? usernameException.join("\n")
                  : null));
    });
  }
}

mixin class PasswordStateBuilder {
  final FocusNode _passwordNode = FocusNode();
  late final TextEditingController _passwordController;
  bool _isShowPassword = false;

  bool _passwordBuildWhen(LoginState previous, LoginState current) =>
      current.status != LoginStatus.initial &&
          (previous.password != current.password ||
              !listEquals(previous.exceptions, current.exceptions)) ||
      (current.status == LoginStatus.waiting ||
          previous.status == LoginStatus.waiting);

  Widget _passwordBuilder(BuildContext context, LoginState state) {
    final passwordException = state.exceptions
        .where((element) => element.cause == LoginExceptionCause.password)
        .map((e) => e.message);
    return StatefulBuilder(builder: (context, setState) {
      return TextFormField(
          key: ValueKey("login_password_field"),
          controller: _passwordController,
          enabled: state.status != LoginStatus.waiting,
          style: const TextStyle(color: AppColors.white),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: !_isShowPassword,
          focusNode: _passwordNode,
          selectionHeightStyle: BoxHeightStyle.max,
          selectionWidthStyle: BoxWidthStyle.max,
          keyboardType: TextInputType.visiblePassword,
          autofillHints: const [AutofillHints.password],
          onTapOutside: (_) {
            if (state.status != LoginStatus.waiting)
              context.read<LoginBloc>().add(const LoginValidated());
            _passwordNode.unfocus();
          },
          onFieldSubmitted: (password) {
            context.read<LoginBloc>().add(const LoginValidated());
            _passwordNode.unfocus();
            context.read<LoginBloc>().add(const LoginSubmitted());
          },
          decoration: _decoration(context.colorScheme).copyWith(
              labelText: "Password",
              errorText: passwordException.isNotEmpty
                  ? passwordException.join("\n")
                  : null,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isShowPassword = !_isShowPassword;
                    });
                  },
                  icon: Icon(_isShowPassword
                      ? Icons.visibility_off
                      : Icons.visibility))));
    });
  }
}

InputDecoration _decoration(ColorScheme colorScheme) => InputDecoration(
    labelStyle: const TextStyle(color: AppColors.white),
    suffixIconColor: colorScheme.onPrimary,
    border: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white)),
    enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white)),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colorScheme.primary, width: 3)));
