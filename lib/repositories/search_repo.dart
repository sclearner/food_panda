import 'dart:async';

import 'package:food_panda/models/menu.dart';

class SearchRepo {
  String? keyword;

  Future<List<Menu>> search(String input, {int offset = 0, int limit = 10}) async {
    await Future.delayed(const Duration(milliseconds: 5000));
    return List.generate(limit, (index) => Menu.test);
  }
}