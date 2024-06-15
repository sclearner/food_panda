// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:food_panda/exceptions/auth_exception.dart';
import 'package:food_panda/models/user.dart';
import 'package:food_panda/network/base_api.dart';

class UserApi {
  const UserApi();

  Future<User?> getUserInfo({required String accessToken}) async {
    try {
      final response = await dio.get('/user');
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
