part of 'search_bloc.dart';

enum SearchStatus { editing, finding, found, notFound }

class SearchState extends Equatable {

  final SearchStatus status;
  List<Menu> menu;
  final String keyword;
  final String? lastKeyword;

  SearchState(
      {this.status = SearchStatus.editing,
        this.lastKeyword,
        List<Menu>? menu,
      this.keyword = ""}): menu = menu ?? [];

  SearchState.initial() : this();

  SearchState copyWith({SearchStatus? status, String? keyword, List<Menu>? menu, String? lastKeyword}) => SearchState(
      status: status ?? this.status,
      keyword: keyword ?? this.keyword,
      menu: menu ?? this.menu,
      lastKeyword: lastKeyword ?? this.lastKeyword
  );

  SearchState pushToHistory(String keyword) => copyWith(
    lastKeyword: this.keyword,
    keyword: keyword
  );

  SearchState clearSearchResult() {
    menu.clear();
    return copyWith();
  }

  SearchState addToMenu(List<Menu> menus) {
    return copyWith(menu: [...menu, ...menus], status: SearchStatus.found);
  }

  @override
  List<Object> get props => [status, menu.length, keyword];
}
