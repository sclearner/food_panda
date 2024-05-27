import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/repositories/auth_repo.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo _authRepo;

  LoginBloc({required AuthRepo authRepo})
      : _authRepo = authRepo,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginValidated>(_onValidated);
    on<LoginSubmitted>(_onSubmit);
  }

  void _onUsernameChanged(
      LoginUsernameChanged event, Emitter<LoginState> emit) {
    final username = event.username;
    emit(state
        .copyWith(username: username)
        .removeExceptionOf(LoginExceptionCause.username));
  }

  void _onPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = event.password;
    emit(state
        .copyWith(password: password)
        .removeExceptionOf(LoginExceptionCause.password));
  }

  void _onValidated(LoginValidated event, Emitter<LoginState> emit) {
    if (state.username.isEmpty) {
      emit(state.addExceptions(LoginExceptions.usernameEmpty));
    }
    if (state.password.isEmpty) {
      emit(state.addExceptions(LoginExceptions.passwordEmpty));
    }
  }

  void _onSubmit(LoginSubmitted event, Emitter<LoginState> emit) async {
    if (state.exceptions.isEmpty) {
      emit(state.copyWith(status: LoginStatus.verified));
      try {
        await _authRepo.login(
            username: state.username, password: state.password);
        emit(state.copyWith(status: LoginStatus.success));
        if (event.callback != null) event.callback!();
      } catch (e) {
        late LoginException exception;
        if (e is AuthException) {
          switch (e.runtimeType) {
            case UsernameAuthException:
              exception = LoginExceptions.noAccount;
              break;
            case PasswordAuthException:
              exception = LoginExceptions.wrongPassword;
              break;
            case NetworkAuthException:
              exception = LoginExceptions.timeOut;
              break;
          }
        }
        emit(state.copyWith(status: LoginStatus.error).addExceptions(exception));
      }
    }
  }
}
