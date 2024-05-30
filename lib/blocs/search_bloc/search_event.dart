part of 'search_bloc.dart';

sealed class SearchEvent {
  const SearchEvent();
}

final class SearchEditingKeyword extends SearchEvent {
  final String keyword;

  const SearchEditingKeyword(this.keyword);
}

final class SearchSubmitted extends SearchEvent {
  final String keyword;

  const SearchSubmitted(this.keyword);
}

final class SearchRequestMore extends SearchEvent {
  const SearchRequestMore();
}