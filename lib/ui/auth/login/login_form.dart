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
              Column(
                children: [
                  BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: _usernameBuildWhen, builder: _usernameBuilder),
                  BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: _passwordBuildWhen, builder: _passwordBuilder),
                ],
              ),
              BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (p, c) => p.status != c.status,
                  builder: (context, state) {
                    return FilledButton(
                        onPressed: () async {
                          context.read<LoginBloc>().add(const LoginValidated());
                          context.read<LoginBloc>().add(LoginSubmitted(() {
                            print("Login successfully");
                            HomeRoute().go(context);
                          }));
                        },
                        child: state.status == LoginStatus.verified
                            ? const CircularProgressIndicator()
                            : const Text("LOGIN"));
                  })
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
  bool _usernameBuildWhen(LoginState previous, LoginState current) =>
      previous.username != current.username;

  Widget _usernameBuilder(BuildContext context, LoginState state) {
    final usernameException = state.exceptions
        .where((element) => element.cause == LoginExceptionCause.username)
        .map((e) => e.message);
    return TextFormField(
        style: const TextStyle(color: AppColors.white),
        onChanged: (username) =>
            context.read<LoginBloc>().add(LoginUsernameChanged(username)),
        onTapOutside: (_) => context.read<LoginBloc>().add(const LoginValidated()),
        decoration: _decoration(context.colorScheme).copyWith(
            labelText: "Username", errorText: usernameException.join("\n")));
  }
}

mixin class PasswordStateBuilder {
  bool _isShowPassword = false;

  bool _passwordBuildWhen(LoginState previous, LoginState current) =>
      previous.password != current.password;

  Widget _passwordBuilder(BuildContext context, LoginState state) {
    final passwordException = state.exceptions
        .where((element) => element.cause == LoginExceptionCause.password)
        .map((e) => e.message);
    return StatefulBuilder(builder: (context, setState) {
      return TextFormField(
          style: const TextStyle(color: AppColors.white),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: !_isShowPassword,
          onTapOutside: (_) => context.read<LoginBloc>().add(const LoginValidated()),
          decoration: _decoration(context.colorScheme).copyWith(
              labelText: "Password",
              errorText: passwordException.join("\n"),
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
