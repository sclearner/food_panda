import 'dart:async';

import 'package:food_panda/network/auth_api.dart';
import 'package:food_panda/network/base_api.dart';

enum AuthStatus {unknown, auth, unauth}

class AuthRepo {
  final _controller = StreamController<AuthStatus>();
  final AuthApi _api = const AuthApi();

  Stream<AuthStatus> get status async* {
    yield await getAccessToken();
    yield* _controller.stream;
  }

  Future<void> login({required String username, required String password}) async {
    try {
      final response = await _api.login(username: username, password: password);
      await prefs.setString('accessToken', response!['accessToken']);
      await prefs.setString('refreshToken', response['refreshToken']);
      _controller.add(AuthStatus.auth);
    }
    catch (e) {
      rethrow;
    }
  }

  static Future<AuthStatus> getAccessToken() async {
    try {
      if (!prefs.containsKey('refreshToken')) throw "";
      final refreshToken = prefs.getString('refreshToken')!;
      final response = await AuthApi.getAccessToken(refreshToken: refreshToken);
      prefs.setString('accessToken', response!['accessToken']);
      return AuthStatus.auth;
    }
    catch (e) {
      prefs.remove('refreshToken');
      prefs.remove('accessToken');
      return AuthStatus.unauth;
    }
  }

  void logOut() {
    _controller.add(AuthStatus.unauth);
  }

  void dispose() => _controller.close();
}