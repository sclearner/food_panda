import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import 'auth_api.dart';

final dio = Dio(BaseOptions(
    baseUrl: dotenv.env['API_ENDPOINT'] ?? '',
    connectTimeout: const Duration(seconds: 5),
    sendTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 20),
    contentType: 'application/json'));

final _refreshTokenInterceptor = InterceptorsWrapper(
    onRequest: (options, handler) async {
            if (options.path.contains('auth')) return handler.next(options);
      String? accessToken = prefs.getString('accessToken');
      String? refreshToken = prefs.getString('refreshToken');
      if (refreshToken == null) {
        return handler.reject(DioException(
            requestOptions: options, type: DioExceptionType.cancel));
      }
      try {
        JWT.verify(accessToken!, SecretKey(dotenv.env['ACCESS_TOKEN_KEY']!));
        options.headers['Authorization'] = "Bearer $accessToken";
        return handler.next(options);
      } on Exception {
        try {
          final data =
              await AuthApi.getAccessToken(refreshToken: refreshToken!);
          if (data?["accessToken"] != null) {
            options.headers['Authorization'] = "Bearer ${data!["accessToken"]}";
            await prefs.setString('accessToken', data["accessToken"]);
          } else {
            AuthApi.logout(refreshToken: refreshToken);
          }
          return handler.next(options);
        } on DioException catch (error) {
          AuthApi.logout(refreshToken: refreshToken!);
          return handler.reject(error, true);
        }
      }
    },
    onError: (error, handler) => handler.next(error),
    onResponse: (response, handler) => handler.next(response));

Future<void> startDio() async {
  await dotenv.load(fileName: ".env");
  prefs = await SharedPreferences.getInstance();
  dio.interceptors.add(_refreshTokenInterceptor);
}

late final SharedPreferences prefs;
