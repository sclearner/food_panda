import 'package:food_panda/models/user.dart';

class UserRepo {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    await Future.delayed(Duration(milliseconds: 300));
    _user = User(id: 'test');
    return Future.value(_user);
  }
}