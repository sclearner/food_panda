part of 'login_page.dart';

///Biểu mẫu đăng nhập trong trang Đăng nhập [LoginScreen]
class LoginForm extends StatelessWidget
    with LoginFormFunctions, UsernameStateBuilder, PasswordStateBuilder {
  ///Biểu mẫu đăng nhập trong trang Đăng nhập [LoginScreen]
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: _networkErrorListener,
      child: Form(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FocusScope(
                child: Column(
                  children: [
                    BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: _usernameBuildWhen, builder: _usernameBuilder),
                    BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: _passwordBuildWhen, builder: _passwordBuilder),
                  ],
                ),
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
                          onPressed: (LoginStatus.waiting != state.status)? () async {
                            context
                                .read<LoginBloc>()
                                .add(const LoginValidated());
                            context
                                .read<LoginBloc>()
                                .add(const LoginSubmitted());
                          }: null,
                          child: state.status == LoginStatus.waiting
                              ? CircularProgressIndicator(
                                  color: context.colorScheme.onPrimary,
                                )
                              : const Text("LOGIN"));
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
  final FocusNode _usernameNode = FocusNode();
  bool _usernameBuildWhen(LoginState previous, LoginState current) =>
      previous.username != current.username || !listEquals(previous.exceptions, current.exceptions);

  Widget _usernameBuilder(BuildContext context, LoginState state) {
    final usernameException = state.exceptions
        .where((element) => element.cause == LoginExceptionCause.username)
        .map((e) => e.message);
    return StatefulBuilder(
      builder: (context, _) {
        return TextFormField(
            key: ValueKey("login_username_field"),
            style: const TextStyle(color: AppColors.white),
            focusNode: _usernameNode,
            selectionHeightStyle: BoxHeightStyle.max,
            selectionWidthStyle: BoxWidthStyle.max,
            keyboardType: TextInputType.name,
            autofillHints: const [AutofillHints.username],
            onChanged: (username) =>
                context.read<LoginBloc>().add(LoginUsernameChanged(username)),
            onTapOutside: (_) {
              context.read<LoginBloc>().add(const LoginValidated());
              _usernameNode.unfocus();
            },
            textInputAction: TextInputAction.next,
            decoration: _decoration(context.colorScheme).copyWith(
                labelText: "Username",
                errorText: usernameException.isNotEmpty
                    ? usernameException.join("\n")
                    : null));
      }
    );
  }
}

mixin class PasswordStateBuilder {
  final FocusNode _passwordNode = FocusNode();
  bool _isShowPassword = false;

  bool _passwordBuildWhen(LoginState previous, LoginState current) =>
      previous.password != current.password || !listEquals(previous.exceptions, current.exceptions);

  Widget _passwordBuilder(BuildContext context, LoginState state) {
    final passwordException = state.exceptions
        .where((element) => element.cause == LoginExceptionCause.password)
        .map((e) => e.message);
    return StatefulBuilder(builder: (context, setState) {
      return TextFormField(
          key: ValueKey("login_password_field"),
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
            context.read<LoginBloc>().add(const LoginValidated());
            _passwordNode.unfocus();
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
    border: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white)),
    enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white)),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colorScheme.primary, width: 3)));
