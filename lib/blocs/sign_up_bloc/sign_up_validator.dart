abstract class SignUpValidator {
  static RegExp username = RegExp(r'^\S{8,}$');
  static RegExp password = RegExp(r'.{8.}');
  static RegExp email = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
}