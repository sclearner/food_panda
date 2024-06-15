part of 'sign_up_bloc.dart';

enum SignUpStatus {
  initial,
  editing,
  verified,
  waiting,
  error,
  success;
}

class SignUpState extends Equatable {
  final SignUpStatus status;
  final String username;
  final String email;
  final String name;
  final String password;
  final String retypePassword;
  final bool isConfirmPrivacy;
  final List<SignUpException> exceptions;

  const SignUpState._(
      {this.status = SignUpStatus.initial,
      this.username = "",
      this.password = "",
      this.email = "",
      this.name = "",
      this.retypePassword = "",
      this.isConfirmPrivacy = false,
      this.exceptions = const []});

  const SignUpState() : this._();

  SignUpState copyWith(
      {SignUpStatus? status,
      String? username,
      String? password,
      String? email,
      String? name,
      String? retypePassword,
      bool? isConfirmPrivacy,
      List<SignUpException>? exceptions}) {
    return SignUpState._(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        name: name ?? this.name,
        retypePassword: retypePassword ?? this.retypePassword,
        isConfirmPrivacy: isConfirmPrivacy ?? this.isConfirmPrivacy,
        exceptions: exceptions ?? this.exceptions,
    );
  }

  SignUpState addExceptions(SignUpException exception) {
    if (exceptions.any((e) => e == exception)) {
      return this;
    }
    return copyWith(exceptions: [...exceptions, exception]);
  }

  SignUpState removeAllExceptions() {
    return copyWith(exceptions: []);
  }

  SignUpState removeExceptionOf(SignUpExceptionCause cause) {
    return copyWith(
        exceptions: exceptions.where((e) => e.cause != cause).toList());
  }

  @override
  List<Object?> get props => [status, username, password, name, email, retypePassword, exceptions];
}
