import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/exceptions/auth_exception.dart';
import 'package:food_panda/exceptions/login_exception.dart';
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
        .copyWith(status: LoginStatus.editing, username: username)
        .removeExceptionOf(LoginExceptionCause.username));
  }

  void _onPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = event.password;
    emit(state
        .copyWith(status: LoginStatus.editing, password: password)
        .removeExceptionOf(LoginExceptionCause.password));
  }

  void _onValidated(LoginValidated event, Emitter<LoginState> emit) {
    if (state.status == LoginStatus.initial) return;
    emit(state.removeAllExceptions());
    if (state.username.isEmpty) {
      emit(state.copyWith(status: LoginStatus.error).addExceptions(LoginExceptions.usernameEmpty));
    }
    if (state.password.isEmpty) {
      emit(state.copyWith(status: LoginStatus.error).addExceptions(LoginExceptions.passwordEmpty));
    }
    if (state.exceptions.where((e) => e.cause != LoginExceptionCause.network).isEmpty) {
      emit(state.copyWith(status: LoginStatus.verified, exceptions: []));
    }
  }

  void _onSubmit(LoginSubmitted event, Emitter<LoginState> emit) async {
    if (state.status == LoginStatus.verified) {
      try {
        emit(state.copyWith(status: LoginStatus.waiting));
        await _authRepo.login(
            username: state.username, password: state.password);
        emit(state.copyWith(status: LoginStatus.success));
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
        else if (e is LoginException) {
          exception = e;
        }
        emit(
            state.copyWith(status: LoginStatus.error).addExceptions(exception));
      }
    }
  }

  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);
    if (kDebugMode) print(change);
  }
}
