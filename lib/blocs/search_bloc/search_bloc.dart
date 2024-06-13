import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/models/menu.dart';
import 'package:food_panda/repositories/search_repo.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  static const int _limit = 10;
  final SearchRepo _searchRepo;
  SearchState lastStateCommit = SearchState.initial();

  SearchBloc({required SearchRepo searchRepo}) : _searchRepo = searchRepo, super(SearchState.initial()) {
    on<SearchEditingKeyword>(_onSearchEditingKeyword);
    on<SearchRequest>(_onSearchRequest);
    on<SearchCancel>(_onSearchCancel);
    on<SearchRefresh>(_onSearchRefresh);
  }

  void _onSearchEditingKeyword(SearchEditingKeyword event, Emitter<SearchState> emit) {
     if (event.keyword != state.keyword) emit(SearchState.keyword(keyword: event.keyword));
  }

  Future<void> _onSearchRequest(SearchRequest event, Emitter<SearchState> emit) async {
    lastStateCommit = state.copyWith();
    try {
      emit(state.copyWith(isLoading: true));
      _searchRepo.addToHistory(state.keyword);
      final result = await _searchRepo.search(state.keyword, limit: _limit, offset: state.menu.length) ?? [];
      final searchStatus = result.length < _limit ? SearchResultStatus.done : SearchResultStatus.partial;
      emit(state.addToMenu(result, searchStatus));
      lastStateCommit = state.copyWith();
    }
    catch (err) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onSearchRefresh(SearchRefresh event, Emitter<SearchState> emit) async {
    emit(state.clearSearchResult());
    await _onSearchRequest(const SearchRequest(), emit);
  }

  void _onSearchCancel(SearchCancel event, Emitter<SearchState> emit) {
    emit(lastStateCommit);
  }
}