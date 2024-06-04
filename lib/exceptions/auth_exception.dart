enum AuthExceptionCause { username, password, network }

sealed class AuthException implements Exception {
  final AuthExceptionCause cause;
  final String message;

  const AuthException(this.cause, this.message);
}

final class UsernameAuthException extends AuthException {
  const UsernameAuthException(String message) : super(AuthExceptionCause.username, message);
}

final class PasswordAuthException extends AuthException {
  const PasswordAuthException(String message) : super(AuthExceptionCause.password, message);
}

final class NetworkAuthException extends AuthException {
  const NetworkAuthException(String message) : super(AuthExceptionCause.network, message);
}