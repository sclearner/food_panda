part of 'sign_up_page.dart';

///Biểu mẫu đăng nhập trong trang Đăng nhập [SignUpScreen]
class SignUpForm extends StatefulWidget with SignUpFormFunctions {
  ///Biểu mẫu đăng nhập trong trang Đăng nhập [SignUpScreen]
  SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm>
    with
        SignUpFormFunctions,
        UsernameStateBuilder,
        PasswordStateBuilder,
        NameStateBuilder,
        EmailStateBuilder,
        RetypePasswordStateBuilder,
        PrivacyStateBuilder
{
  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _retypePasswordController = TextEditingController();
    _usernameController.addListener(
      () {
        context
            .read<SignUpBloc>()
            .add(SignUpUsernameChanged(_usernameController.text));
      },
    );
    _passwordController.addListener(() {
      context
          .read<SignUpBloc>()
          .add(SignUpPasswordChanged(_passwordController.text));
    });
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _retypePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: _networkErrorListener,
      child: Form(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  BlocBuilder<SignUpBloc, SignUpState>(
                      buildWhen: _nameBuildWhen, builder: _nameBuilder),
                  BlocBuilder<SignUpBloc, SignUpState>(
                      buildWhen: _emailBuildWhen, builder: _emailBuilder),
                  BlocBuilder<SignUpBloc, SignUpState>(
                      buildWhen: _usernameBuildWhen, builder: _usernameBuilder),
                  BlocBuilder<SignUpBloc, SignUpState>(
                      buildWhen: _passwordBuildWhen, builder: _passwordBuilder),
                  BlocBuilder<SignUpBloc, SignUpState>(
                      buildWhen: _retypePasswordBuildWhen, builder: _retypePasswordBuilder),
                  BlocBuilder<SignUpBloc, SignUpState>(
                      buildWhen: _privacyBuildWhen, builder: _privacyBuilder
                  )
                ],
              ),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.status == AuthStatus.auth) {
                    HomeRoute().go(context);
                  }
                },
                child: BlocBuilder<SignUpBloc, SignUpState>(
                    buildWhen: (p, c) => p.status != c.status,
                    builder: (context, state) {
                      return FilledButton(
                        onPressed: (SignUpStatus.waiting != state.status)
                            ? () async {
                                context
                                    .read<SignUpBloc>()
                                    .add(const SignUpValidated());
                                context
                                    .read<SignUpBloc>()
                                    .add(const SignUpSubmitted());
                              }
                            : null,
                        style: FilledButton.styleFrom(
                            foregroundColor: context.colorScheme.onPrimary,
                            backgroundColor:
                                (state.status == SignUpStatus.success)
                                    ? Colors.lightGreen
                                    : null),
                        child: Builder(builder: (context) {
                          if (state.status == SignUpStatus.waiting) {
                            return FutureBuilder(
                                future: Future.delayed(5.seconds)
                                    .then((value) => 1),
                                builder: (context, snapshot) {
                                  List<Widget> longerThanUsual = (snapshot
                                          .hasData)
                                      ? [
                                          const SizedBox(height: 10, width: 10),
                                          const Text(
                                              "Sign up is longer than usual."),
                                        ]
                                      : [];
                                  return OverflowBar(
                                    children: [
                                      CircularProgressIndicator(
                                        color: context.colorScheme.onPrimary,
                                      ),
                                      ...longerThanUsual
                                    ],
                                  );
                                });
                          } else if (state.status == SignUpStatus.success)
                            return const Center(child: Icon(Icons.check));
                          else
                            return const Text("SIGN UP");
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

InputDecoration _decoration(ColorScheme colorScheme) => InputDecoration(
    labelStyle: const TextStyle(color: AppColors.white),
    suffixIconColor: colorScheme.onPrimary,
    border: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white)),
    enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white)),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colorScheme.primary, width: 3)));
