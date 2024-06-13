import 'package:isar/isar.dart';

part 'search_word.g.dart';

@collection
class SearchWord {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value, unique: true)
  final String word;

  DateTime lastSearch;

  SearchWord(this.word) : lastSearch = DateTime.now();
}