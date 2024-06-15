import 'package:food_panda/models/menu.dart';
import 'package:food_panda/network/product_api.dart';

class ProductRepo {
  ProductRepo();
  final _api = ProductApi();

  Future<Menu> getMenuById(String id) async {
    try {
      Menu? menu = await _api.getMenuById(id: id);
      return menu!;
    }
    catch (_) {
      rethrow;
    }
  }

  Future<Menu> getMoreInfo(Menu menu) async {
    return await getMenuById(menu.id);
  }
}