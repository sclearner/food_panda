import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dio = Dio(BaseOptions(
  baseUrl: dotenv.env['API_ENDPOINT'] ?? '',
  connectTimeout: const Duration(seconds: 5),
  sendTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 20),
  contentType: 'application/json'
));

late final SharedPreferences prefs;