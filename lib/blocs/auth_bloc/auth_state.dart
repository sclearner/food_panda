part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState._({
    this.status = AuthStatus.unknown,
    this.user = User.guest
  });

  const AuthState.unknown() : this._(); // Initial State

  const AuthState.auth(User user) : this._(status: AuthStatus.auth, user: user);

  const AuthState.unauth() : this._(status: AuthStatus.unauth);

  final AuthStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}