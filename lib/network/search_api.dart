import 'package:dio/dio.dart';
import 'package:food_panda/models/menu.dart';
import 'package:food_panda/network/base_api.dart';

class SearchApi {
  const SearchApi();

  Future<List<Menu>?> search(
      {required String keyword, int limit = 10, int offset = 0}) async {
    try {
      final response = await dio.get('/search', queryParameters: {
        "keyword": keyword,
        "limit": limit,
        "offset": offset,
      });
      if (response.statusCode == 200 || response.statusCode == 206) {
        List<Menu> menu = response.data.map<Menu>((e) => Menu.fromJson(e)).toList();
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
