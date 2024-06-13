import 'dart:async';

import 'package:food_panda/local/search_local_storage.dart';
import 'package:food_panda/models/menu.dart';
import 'package:food_panda/network/search_api.dart';

class SearchRepo {
  String? keyword;
  final SearchApi _api = const SearchApi();
  final SearchLocalStorage _localStorage = SearchLocalStorage();

  Future<List<Menu>?> search(String input, {int offset = 0, int limit = 10}) async {
    keyword = input;
    try {
      return await _api.search(keyword: input, offset: offset, limit: limit);
    } on Exception {
      rethrow;
    }
  }

  Future<List<String>> getSearchHistory([int limit=10]) async {
    try {
      return await _localStorage.readSearchHistory(limit);
    }
    catch (e) {
      return [];
    }
  }

  Future<void> addToHistory(String word) async {
    try {
      await _localStorage.addToHistory(word);
    }
    finally {

    }
  }
}