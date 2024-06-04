import 'package:dio/dio.dart';
import 'package:food_panda/models/user.dart';
import 'package:food_panda/network/base_api.dart';
import 'package:food_panda/network/user_api.dart';
import 'package:food_panda/repositories/auth_repo.dart';

class UserRepo {
  final _api = const UserApi();
  User? _user;

  Future<User?> getUser([int tries = 5]) async {
    if (_user != null) return _user;
    var accessToken = prefs.getString('accessToken');
    try {
      final user = await _api.getUserInfo(accessToken: accessToken!);
      if (user != null) _user = user;
    }
    on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        try {
          AuthRepo.getAccessToken();
          if (tries > 0) _user = await getUser(tries - 1);
        }
        catch (_) {
          _user = null;
        }
      }
    }
    catch (e) {
      _user = null;
    }
    return _user;
  }
}