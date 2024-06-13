import 'package:food_panda/local/base_local_storage.dart';
import 'package:food_panda/models/search_word.dart';
import 'package:isar/isar.dart';

class SearchLocalStorage {
  Future<List<String>> readSearchHistory([int limit = 10]) async {
    final result =
        await baseLocalStorage.searchWords.where().sortByLastSearchDesc().limit(limit).findAll();
    return result.map((e) => e.word).toList();
  }

  Future<void> addToHistory(String word) async {
    await baseLocalStorage.writeTxn(() async {
      final exist = await baseLocalStorage.searchWords.filter().wordEqualTo(word).findFirst();
      if (exist == null) {
        await baseLocalStorage.searchWords.put(SearchWord(word));
      } else {
        exist.lastSearch = DateTime.now();
        baseLocalStorage.searchWords.put(exist);
      }
    });
    // bool isExist = await baseLocalStorage.searchWords.filter().wordEqualTo(word).isNotEmpty();
    // if (!isExist) {
    //   await baseLocalStorage.searchWords.put(object)
    // } else {
    //   await baseLocalStorage.update(SearchQueries.tableName,
    //       {SearchQueries.lastSearch: DateTime.now().millisecondsSinceEpoch},
    //       where: '${SearchQueries.word} = ?', whereArgs: [word]);
    // }
  }
}

abstract class SearchQueries {
  static const String tableName = "search_history";
  static const String word = "word";
  static const String lastSearch = "last_search";

  static String get orderBy => "ORDER BY ${SearchQueries.lastSearch} DESC";

  static String get createTable =>
      'CREATE TABLE ${SearchQueries.tableName}(${SearchQueries.word} TEXT PRIMARY KEY, ${SearchQueries.lastSearch} INTEGER)';
}
