import 'dart:async';

import 'package:food_panda/models/menu.dart';
import 'package:food_panda/network/search_api.dart';
import 'package:uuid/uuid.dart';

class SearchRepo {
  String? keyword;
  final SearchApi _api = SearchApi();

  Future<List<Menu>?> search(String input, {int offset = 0, int limit = 10}) async {
    keyword = input;
    try {
      return await _api.search(keyword: input, offset: offset, limit: limit);
    } on Exception catch (e) {
      rethrow;
    }
  }
}