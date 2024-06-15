part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

final class SignUpUsernameChanged extends SignUpEvent {
  const SignUpUsernameChanged(this.username);

  final String username;

  @override
  List<Object?> get props => [username];
}

final class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

final class SignUpNameChanged extends SignUpEvent {
  const SignUpNameChanged(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}

final class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

final class SignUpRetypePasswordChanged extends SignUpEvent {
  const SignUpRetypePasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

final class SignUpToggleConfirmPrivacy extends SignUpEvent {
  const SignUpToggleConfirmPrivacy();
}

final class SignUpValidated extends SignUpEvent {
  const SignUpValidated();
}

final class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}