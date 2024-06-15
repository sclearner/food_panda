import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/sign_up_bloc/sign_up_validator.dart';
import 'package:food_panda/exceptions/sign_up_exception.dart';
import 'package:food_panda/repositories/auth_repo.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepo _authRepo;

  SignUpBloc({required AuthRepo authRepo})
      : _authRepo = authRepo,
        super(const SignUpState()) {
    on<SignUpUsernameChanged>(_onUsernameChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpNameChanged>(_onNameChanged);
    on<SignUpRetypePasswordChanged>(_onRetypePasswordChanged);
    on<SignUpToggleConfirmPrivacy>(_onSignUpToggleConfirmPrivacy);
    on<SignUpValidated>(_onValidated);
    on<SignUpSubmitted>(_onSubmit);
  }

  void _onUsernameChanged(
      SignUpUsernameChanged event, Emitter<SignUpState> emit) {
    final username = event.username;
    emit(state
        .copyWith(status: SignUpStatus.editing, username: username)
        .removeExceptionOf(SignUpExceptionCause.username));
  }

  void _onPasswordChanged(
      SignUpPasswordChanged event, Emitter<SignUpState> emit) {
    final password = event.password;
    emit(state
        .copyWith(status: SignUpStatus.editing, password: password)
        .removeExceptionOf(SignUpExceptionCause.password));
  }

  void _onValidated(SignUpValidated event, Emitter<SignUpState> emit) {
    if (state.status == SignUpStatus.initial) return;
    emit(state.removeAllExceptions());

    ///Username validator
    if (state.username.isEmpty) {
      emit(state.copyWith(status: SignUpStatus.error).addExceptions(SignUpExceptions.usernameEmpty));
    }
    else if (!SignUpValidator.username.hasMatch(state.username)) {
      emit(state.copyWith(status: SignUpStatus.error).addExceptions(SignUpExceptions.usernameIsNotValid));
    }

    ///Password validator
    if (state.password.isEmpty) {
      emit(state.copyWith(status: SignUpStatus.error).addExceptions(SignUpExceptions.passwordEmpty));
    }
    else if (!SignUpValidator.password.hasMatch(state.password)) {
      emit(state.copyWith(status: SignUpStatus.error).addExceptions(SignUpExceptions.passwordIsNotValid));
    }

    ///Name validator
    if (state.name.isEmpty) {
      emit(state.copyWith(status: SignUpStatus.error).addExceptions(SignUpExceptions.nameEmpty));
    }

    ///Email validator
    if (!SignUpValidator.email.hasMatch(state.email)) {
      emit(state.copyWith(status: SignUpStatus.error).addExceptions(SignUpExceptions.emailIsNotValid));
    }

    ///Retype Password validator
    if (state.retypePassword.isEmpty) {
      emit(state.copyWith(status: SignUpStatus.error).addExceptions(SignUpExceptions.retypeEmpty));
    }
    else if (state.retypePassword != state.password) {
      emit(state.copyWith(status: SignUpStatus.error).addExceptions(SignUpExceptions.retypeNotMatch));
    }

    ///Privacy validator
    if (!state.isConfirmPrivacy) {
      emit(state.copyWith(status: SignUpStatus.error).addExceptions(SignUpExceptions.notCheckedPolicy));
    }

    ///Final
    if (state.exceptions.where((e) => e.cause != SignUpExceptionCause.network).isEmpty) {
      emit(state.copyWith(status: SignUpStatus.verified, exceptions: []));
    }
  }

  void _onSubmit(SignUpSubmitted event, Emitter<SignUpState> emit) async {
    // if (state.status == SignUpStatus.verified) {
    //   try {
    //     emit(state.copyWith(status: SignUpStatus.waiting));
    //     await _authRepo.login(
    //         username: state.username, password: state.password);
    //     emit(state.copyWith(status: SignUpStatus.success));
    //   } catch (e) {
    //     late SignUpException exception;
    //     if (e is AuthException) {
    //       switch (e.runtimeType) {
    //         case UsernameAuthException:
    //           exception = SignUpExceptions.;
    //           break;
    //         case PasswordAuthException:
    //           exception = SignUpExceptions.wrongPassword;
    //           break;
    //         case NetworkAuthException:
    //           exception = SignUpExceptions.timeOut;
    //           break;
    //       }
    //     }
    //     else if (e is SignUpException) {
    //       exception = e;
    //     }
    //     emit(
    //         state.copyWith(status: SignUpStatus.error).addExceptions(exception));
    //   }
    // }
  }

  @override
  void onChange(Change<SignUpState> change) {
    super.onChange(change);
  }

  FutureOr<void> _onEmailChanged(SignUpEmailChanged event, Emitter<SignUpState> emit) {
    emit(state
        .copyWith(status: SignUpStatus.editing, email: event.email)
        .removeExceptionOf(SignUpExceptionCause.email));
  }

  FutureOr<void> _onNameChanged(SignUpNameChanged event, Emitter<SignUpState> emit) {
    emit(state
        .copyWith(status: SignUpStatus.editing, name: event.name)
        .removeExceptionOf(SignUpExceptionCause.name));

  }

  FutureOr<void> _onRetypePasswordChanged(SignUpRetypePasswordChanged event, Emitter<SignUpState> emit) {
    emit(state
        .copyWith(status: SignUpStatus.editing, retypePassword: event.password)
        .removeExceptionOf(SignUpExceptionCause.retypePassword));
  }

  FutureOr<void> _onSignUpToggleConfirmPrivacy(SignUpToggleConfirmPrivacy event, Emitter<SignUpState> emit) {
    emit(state
        .copyWith(status: SignUpStatus.editing, isConfirmPrivacy: !state.isConfirmPrivacy)
        .removeExceptionOf(SignUpExceptionCause.privacy));
  }
}
