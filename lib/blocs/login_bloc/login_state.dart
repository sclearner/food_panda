part of 'login_bloc.dart';

enum LoginExceptionCause { username, password, network }

class LoginException implements Exception {
  final LoginExceptionCause cause;
  final String message;

  const LoginException(this.cause, this.message);
}

enum LoginStatus {
  initial,
  editing,
  verified,
  waiting,
  error,
  success;
}

class LoginState extends Equatable {
  final LoginStatus status;
  final String username;
  final String password;
  final List<LoginException> exceptions;

  const LoginState._(
      {this.status = LoginStatus.initial,
      this.username = "",
      this.password = "",
      this.exceptions = const []});

  const LoginState() : this._();

  LoginState copyWith(
      {LoginStatus? status,
      String? username,
      String? password,
      List<LoginException>? exceptions}) {
    return LoginState._(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password,
        exceptions: exceptions ?? this.exceptions);
  }

  LoginState addExceptions(LoginException exception) {
    return copyWith(exceptions: [...exceptions, exception]);
  }

  LoginState removeAllExceptions() {
    return copyWith(exceptions: []);
  }

  LoginState removeExceptionOf(LoginExceptionCause cause) {
    return copyWith(
        exceptions: exceptions.where((e) => e.cause != cause).toList());
  }

  @override
  List<Object?> get props => [status, username, password];
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