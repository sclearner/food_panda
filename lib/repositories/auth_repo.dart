import 'dart:async';

enum AuthStatus {unknown, auth, unauth}

class AuthRepo {
  final _controller = StreamController<AuthStatus>();

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.auth;
    yield* _controller.stream;
  }

  Future<void> login({required String username, required String password}) async {
    print('$username try to login');
    await Future.delayed(const Duration(milliseconds: 500));
    _controller.add(AuthStatus.auth);
  }

  void logOut() {
    _controller.add(AuthStatus.unauth);
  }

  void dispose() => _controller.close();
}

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