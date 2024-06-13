import 'package:food_panda/models/search_word.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class BaseLocalStorage {
  static var instance;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    instance = await Isar.open([SearchWordSchema], directory: dir.path);
  }
}

Isar get baseLocalStorage => BaseLocalStorage.instance;
