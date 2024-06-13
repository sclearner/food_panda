import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_panda/models/user.dart';
import 'package:food_panda/repositories/auth_repo.dart';
import 'package:food_panda/repositories/user_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepo authRepo,
    required UserRepo userRepo,
}) : _authRepo = authRepo, _userRepo = userRepo, super(const AuthState.unknown()) {
    on<_AuthStatusChanged>(_onAuthStatusChanged);
    on<AuthLogoutRequest>(_onAuthLogoutRequested);
    _authStatusSubscription = _authRepo.status.listen(
        (status) => add(_AuthStatusChanged(status)),
    );
  }

  final AuthRepo _authRepo;
  final UserRepo _userRepo;
  late StreamSubscription<AuthStatus> _authStatusSubscription;

  @override
  Future<void> close() {
    _authStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthStatusChanged(
      _AuthStatusChanged event,
      Emitter<AuthState> emit,
      ) async {
    switch (event.status) {
      case AuthStatus.unauth:
        return emit(const AuthState.unauth());
      case AuthStatus.auth:
        final user = await _tryGetUser();
        return emit(
          user != null
              ? AuthState.auth(user)
              : const AuthState.unauth(),
        );
      case AuthStatus.unknown:
        return emit(const AuthState.unknown());
    }
  }

  void _onAuthLogoutRequested(
      AuthLogoutRequest event,
      Emitter<AuthState> emit,
      ) {
    _authRepo.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepo.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
  }
}