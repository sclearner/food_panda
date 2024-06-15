part of 'sign_up_page.dart';

mixin SignUpFormFunctions {
  void _networkErrorListener(BuildContext context, SignUpState state) {
    final networkException = state.exceptions
        .where((e) => e.cause == SignUpExceptionCause.network)
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

  bool _usernameBuildWhen(SignUpState previous, SignUpState current) =>
      (current.status != SignUpStatus.initial &&
          (previous.username != current.username ||
              !listEquals(previous.exceptions, current.exceptions))) ||
      (current.status == SignUpStatus.waiting ||
          previous.status == SignUpStatus.waiting);

  Widget _usernameBuilder(BuildContext context, SignUpState state) {
    final usernameException = state.exceptions
        .where((element) => element.cause == SignUpExceptionCause.username)
        .map((e) => e.message);
    return StatefulBuilder(builder: (context, _) {
      return TextFormField(
          enabled: state.status != SignUpStatus.waiting,
          key: ValueKey("login_username_field"),
          controller: _usernameController,
          style: const TextStyle(color: AppColors.white),
          focusNode: _usernameNode,
          selectionHeightStyle: BoxHeightStyle.max,
          selectionWidthStyle: BoxWidthStyle.max,
          keyboardType: TextInputType.name,
          autofillHints: const [AutofillHints.username],
          onTapOutside: (_) {
            if (state.status != SignUpStatus.waiting)
              context.read<SignUpBloc>().add(const SignUpValidated());
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

mixin class NameStateBuilder {
  late final TextEditingController _nameController;
  final FocusNode _nameNode = FocusNode();

  bool _nameBuildWhen(SignUpState previous, SignUpState current) =>
      (current.status != SignUpStatus.initial &&
          (previous.name != current.name ||
              !listEquals(previous.exceptions, current.exceptions))) ||
      (current.status == SignUpStatus.waiting ||
          previous.status == SignUpStatus.waiting);

  Widget _nameBuilder(BuildContext context, SignUpState state) {
    final nameException = state.exceptions
        .where((element) => element.cause == SignUpExceptionCause.name)
        .map((e) => e.message);
    return StatefulBuilder(builder: (context, _) {
      return TextFormField(
          enabled: state.status != SignUpStatus.waiting,
          key: ValueKey("login_name_field"),
          controller: _nameController,
          style: const TextStyle(color: AppColors.white),
          focusNode: _nameNode,
          selectionHeightStyle: BoxHeightStyle.max,
          selectionWidthStyle: BoxWidthStyle.max,
          keyboardType: TextInputType.name,
          autofillHints: const [AutofillHints.username],
          onTapOutside: (_) {
            if (state.status != SignUpStatus.waiting) {
              context.read<SignUpBloc>().add(const SignUpValidated());
            }
            _nameNode.unfocus();
          },
          textInputAction: TextInputAction.next,
          decoration: _decoration(context.colorScheme).copyWith(
              labelText: "Name",
              errorText:
                  nameException.isNotEmpty ? nameException.join("\n") : null));
    });
  }
}

mixin class EmailStateBuilder {
  late final TextEditingController _emailController;
  final FocusNode _emailNode = FocusNode();

  bool _emailBuildWhen(SignUpState previous, SignUpState current) =>
      (current.status != SignUpStatus.initial &&
          (previous.email != current.email ||
              !listEquals(previous.exceptions, current.exceptions))) ||
      (current.status == SignUpStatus.waiting ||
          previous.status == SignUpStatus.waiting);

  Widget _emailBuilder(BuildContext context, SignUpState state) {
    final emailException = state.exceptions
        .where((element) => element.cause == SignUpExceptionCause.email)
        .map((e) => e.message);
    return StatefulBuilder(builder: (context, _) {
      return TextFormField(
          enabled: state.status != SignUpStatus.waiting,
          key: ValueKey("login_email_field"),
          controller: _emailController,
          style: const TextStyle(color: AppColors.white),
          focusNode: _emailNode,
          selectionHeightStyle: BoxHeightStyle.max,
          selectionWidthStyle: BoxWidthStyle.max,
          keyboardType: TextInputType.name,
          autofillHints: const [AutofillHints.username],
          onTapOutside: (_) {
            if (state.status != SignUpStatus.waiting) {
              context.read<SignUpBloc>().add(const SignUpValidated());
            }
            _emailNode.unfocus();
          },
          textInputAction: TextInputAction.next,
          decoration: _decoration(context.colorScheme).copyWith(
              labelText: "Email",
              errorText: emailException.isNotEmpty
                  ? emailException.join("\n")
                  : null));
    });
  }
}

mixin class PasswordStateBuilder {
  final FocusNode _passwordNode = FocusNode();
  late final TextEditingController _passwordController;
  bool _isShowPassword = false;

  bool _passwordBuildWhen(SignUpState previous, SignUpState current) =>
      current.status != SignUpStatus.initial &&
          (previous.password != current.password ||
              !listEquals(previous.exceptions, current.exceptions)) ||
      (current.status == SignUpStatus.waiting ||
          previous.status == SignUpStatus.waiting);

  Widget _passwordBuilder(BuildContext context, SignUpState state) {
    final passwordException = state.exceptions
        .where((element) => element.cause == SignUpExceptionCause.password)
        .map((e) => e.message);
    return StatefulBuilder(builder: (context, setState) {
      return TextFormField(
          key: ValueKey("login_password_field"),
          controller: _passwordController,
          enabled: state.status != SignUpStatus.waiting,
          style: const TextStyle(color: AppColors.white),
          onChanged: (password) =>
              context.read<SignUpBloc>().add(SignUpPasswordChanged(password)),
          obscureText: !_isShowPassword,
          focusNode: _passwordNode,
          selectionHeightStyle: BoxHeightStyle.max,
          selectionWidthStyle: BoxWidthStyle.max,
          keyboardType: TextInputType.visiblePassword,
          autofillHints: const [AutofillHints.password],
          onTapOutside: (_) {
            if (state.status != SignUpStatus.waiting) {
              context.read<SignUpBloc>().add(const SignUpValidated());
            }
            _passwordNode.unfocus();
          },
          onFieldSubmitted: (password) {
            context.read<SignUpBloc>().add(const SignUpValidated());
          },
          textInputAction: TextInputAction.next,
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

mixin class RetypePasswordStateBuilder {
  final FocusNode _retypePasswordNode = FocusNode();
  late final TextEditingController _retypePasswordController;
  bool _isShowRetypePassword = false;

  bool _retypePasswordBuildWhen(SignUpState previous, SignUpState current) =>
      current.status != SignUpStatus.initial &&
          (previous.retypePassword != current.retypePassword ||
              !listEquals(previous.exceptions, current.exceptions)) ||
      (current.status == SignUpStatus.waiting ||
          previous.status == SignUpStatus.waiting);

  Widget _retypePasswordBuilder(BuildContext context, SignUpState state) {
    final passwordException = state.exceptions
        .where(
            (element) => element.cause == SignUpExceptionCause.retypePassword)
        .map((e) => e.message);
    return StatefulBuilder(builder: (context, setState) {
      return TextFormField(
          key: ValueKey("login_retype_password_field"),
          controller: _retypePasswordController,
          enabled: state.status != SignUpStatus.waiting,
          style: const TextStyle(color: AppColors.white),
          onChanged: (password) =>
              context.read<SignUpBloc>().add(SignUpPasswordChanged(password)),
          obscureText: !_isShowRetypePassword,
          focusNode: _retypePasswordNode,
          selectionHeightStyle: BoxHeightStyle.max,
          selectionWidthStyle: BoxWidthStyle.max,
          keyboardType: TextInputType.visiblePassword,
          autofillHints: const [AutofillHints.password],
          onTapOutside: (_) {
            if (state.status != SignUpStatus.waiting) {
              context.read<SignUpBloc>().add(const SignUpValidated());
            }
            _retypePasswordNode.unfocus();
          },
          onFieldSubmitted: (password) {
            context.read<SignUpBloc>().add(const SignUpValidated());
            _retypePasswordNode.unfocus();
          },
          decoration: _decoration(context.colorScheme).copyWith(
              labelText: "Retype password",
              errorText: passwordException.isNotEmpty
                  ? passwordException.join("\n")
                  : null,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isShowRetypePassword = !_isShowRetypePassword;
                    });
                  },
                  icon: Icon(_isShowRetypePassword
                      ? Icons.visibility_off
                      : Icons.visibility))));
    });
  }
}

mixin class PrivacyStateBuilder {
  bool _privacyBuildWhen(SignUpState previous, SignUpState current) =>
      current.status != SignUpStatus.initial &&
          (previous.password != current.password ||
              !listEquals(previous.exceptions, current.exceptions)) ||
      (current.status == SignUpStatus.waiting ||
          previous.status == SignUpStatus.waiting);

  Widget _privacyBuilder(BuildContext context, SignUpState state) {
    return Row(
      children: [
        Checkbox(
            value: state.isConfirmPrivacy,
            onChanged: (_) {
              context
                  .read<SignUpBloc>()
                  .add(const SignUpToggleConfirmPrivacy());
            }),
        Flexible(
          child: Text.rich(
            TextSpan(children: [
              const TextSpan(
                text: "I have read and confirmed to foodpanda's ",
              ),
              TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(color: context.colorScheme.primary)),
              const TextSpan(text: " and "),
              TextSpan(
                  text: "Condition Terms",
                  style: TextStyle(color: context.colorScheme.primary))
            ]),
            style: TextStyle(color: AppColors.white),
            softWrap: true,
          ),
        )
      ],
    );
  }
}
