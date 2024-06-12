part of 'search_bloc.dart';

sealed class SearchEvent {
  const SearchEvent();
}

final class SearchEditingKeyword extends SearchEvent {
  final String keyword;
  const SearchEditingKeyword(this.keyword);
}

final class SearchCancel extends SearchEvent {
  const SearchCancel();
}

final class SearchRequest extends SearchEvent {
  const SearchRequest();
}

final class SearchRefresh extends SearchEvent {
  const SearchRefresh();
}