import 'package:equatable/equatable.dart';

enum LoginExceptionCause { username, password, network }

class LoginException extends Equatable implements Exception {
  final LoginExceptionCause cause;
  final String message;

  const LoginException(this.cause, this.message);

  @override
  List<Object?> get props => [cause, message];
}

abstract class LoginExceptions {
  static const passwordEmpty =
  LoginException(LoginExceptionCause.password, "Password's not empty");
  static const usernameEmpty =
  LoginException(LoginExceptionCause.username, "Username's not empty");
  static const wrongPassword =
  LoginException(LoginExceptionCause.password, "Password's wrong");
  static const noAccount = LoginException(
      LoginExceptionCause.username, "No account has this username.");
  static const timeOut = LoginException(
      LoginExceptionCause.network, "Please check your Internet connection!");
}