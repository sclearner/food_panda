part of 'search_bloc.dart';

enum SearchResultStatus { none, partial, done }

class SearchState extends Equatable {
  final SearchResultStatus status;
  final List<Menu> menu;
  final String keyword;
  final bool isLoading;

  SearchState(
      {this.status = SearchResultStatus.none,
      List<Menu>? menu,
        this.isLoading = false,
      this.keyword = ""})
      : menu = menu ?? [];

  SearchState.initial() : this();

  SearchState.keyword({required String keyword}) : this(keyword: keyword);

  SearchState copyWith(
          {SearchResultStatus? status,
          String? keyword,
          List<Menu>? menu,
          bool? isLoading}) =>
      SearchState(
          status: status ?? this.status,
          keyword: keyword ?? this.keyword,
          menu: menu ?? this.menu,
          isLoading: isLoading ?? this.isLoading
      );

  SearchState clearSearchResult() {
    return copyWith(menu: [], status: SearchResultStatus.none);
  }

  SearchState addToMenu(List<Menu> menus, [SearchResultStatus? status]) {
    return copyWith(menu: [...menu, ...menus], status: status ?? SearchResultStatus.partial, isLoading: false);
  }

  bool get isEmpty => menu.isEmpty && status == SearchResultStatus.done;

  @override
  List<Object> get props => [status, menu.length, keyword, isLoading];
}
