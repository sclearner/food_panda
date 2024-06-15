import 'package:equatable/equatable.dart';
import 'package:food_panda/blocs/sign_up_bloc/sign_up_bloc.dart';

enum SignUpExceptionCause { username, password, name, email, retypePassword, privacy, network }

class SignUpException extends Equatable implements Exception{
  final SignUpExceptionCause cause;
  final String message;

  const SignUpException(this.cause, this.message);

  @override
  List<Object?> get props => [cause, message];
}

abstract class SignUpExceptions {
  static const passwordEmpty =
  SignUpException(SignUpExceptionCause.password, "Password's not empty");
  static const usernameEmpty =
  SignUpException(SignUpExceptionCause.username, "Username's not empty");
  static const usernameIsNotValid =
  SignUpException(SignUpExceptionCause.username, "Username has to have 8 characters or more");
  static const passwordIsNotValid =
  SignUpException(SignUpExceptionCause.password, "Password has to have 8 characters or more, including 1 number and 1 symbol");
  static const nameEmpty = SignUpException(SignUpExceptionCause.name, "Name's not empty");
  static const emailIsNotValid =
  SignUpException(SignUpExceptionCause.email, "You must give a valid email");
  static const emailUsed = SignUpException(SignUpExceptionCause.email, "Email has already been used");
  static const retypeEmpty = SignUpException(SignUpExceptionCause.retypePassword, "You must confirm your password");
  static const retypeNotMatch = SignUpException(SignUpExceptionCause.retypePassword, "The password did not match");
  static const notCheckedPolicy = SignUpException(SignUpExceptionCause.privacy, "You must read and confirm Privacy Policy & Terms");
  static const accountIsExists = SignUpException(
      SignUpExceptionCause.username, "Account has been created.");
  static const timeOut = SignUpException(
      SignUpExceptionCause.network, "Please check your Internet connection!");
}