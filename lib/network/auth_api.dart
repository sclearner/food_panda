import 'package:dio/dio.dart';
import 'package:food_panda/exceptions/auth_exception.dart';
import 'package:food_panda/network/base_api.dart';

class AuthApi {
  const AuthApi();

  Future<Map<String, dynamic>?> login(
      {required String username, required String password}) async {
    try {
      final response = await dio.post('/auth/login', data: {
        "username": username,
        "password": password,
      });
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } on DioException catch (e) {
      String? message = e.response?.data["error"];
      /// Sai mật khẩu
      if (e.response?.statusCode == 401) {
        throw PasswordAuthException(message ?? "Wrong password");
      }

      /// Không có tài khoản
      else if (e.response?.statusCode == 404) {
        throw UsernameAuthException(message ?? "No account");
      } else {
        throw NetworkAuthException(message ?? "Service unavailable");
      }
    } catch (e) {
      throw const NetworkAuthException("Unknown error");
    }
  }

  static Future<Map<String, dynamic>?> getAccessToken(
      {required String refreshToken}) async {
    try {
      final response = await dio.post('/auth/refresh-token', data: {
        "refreshToken": refreshToken
      });
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
