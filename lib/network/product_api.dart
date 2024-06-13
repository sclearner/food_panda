import 'package:dio/dio.dart';
import 'package:food_panda/models/menu.dart';
import 'package:food_panda/network/base_api.dart';

class ProductApi {
  const ProductApi();

  Future<Menu?> getMenuById(
      {required String id}) async {
    try {
      final response = await dio.getUri(Uri(pathSegments: ['', 'menu', id]));
      if (response.statusCode == 200 || response.statusCode == 206) {
        Menu menu = Menu.fromJson(response.data);
        return menu;
      }
      return null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
