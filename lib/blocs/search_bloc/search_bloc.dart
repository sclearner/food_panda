import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/models/menu.dart';
import 'package:food_panda/repositories/search_repo.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepo _searchRepo;
  SearchBloc({required SearchRepo searchRepo}) : _searchRepo = searchRepo, super(SearchState.initial()) {
    on<SearchEditingKeyword>(_onSearchEditingKeyword);
    on<SearchSubmitted>(_onSearchSubmitted);
    on<SearchRequestMore>(_onSearchRequestMore);
  }

  FutureOr<void> _onSearchEditingKeyword(SearchEditingKeyword event, Emitter<SearchState> emit) {
    final keyword = event.keyword;
    emit(state.copyWith(status: SearchStatus.editing, keyword: keyword));
  }

  void _onSearchSubmitted(SearchSubmitted event, Emitter<SearchState> emit) async {
    final keyword = event.keyword;
    if (keyword == state.lastKeyword) {
      emit(state.copyWith(status: SearchStatus.found));
      return;
    }
    if (keyword.trim().isEmpty) {
      emit(state.copyWith(lastKeyword: ""));
      return;
    }
    try {
      emit(state.clearSearchResult().copyWith(status: SearchStatus.finding, lastKeyword: keyword, keyword: keyword));
      List<Menu>? menu = await _searchRepo.search(keyword, offset: state.menu.length);
      emit(state.copyWith(status: SearchStatus.found).addToMenu(menu!));
    }
    catch (error) {
      if (state.menu.isEmpty) {
        emit(state.copyWith(status: SearchStatus.notFound));
      } else {
        emit(state.copyWith(status: SearchStatus.found));
      }
    }
  }

  Future<void> _onSearchRequestMore(SearchRequestMore event, Emitter<SearchState> emit) async {
    try {
      emit(state.copyWith(status: SearchStatus.finding));
      List<Menu>? menu = await _searchRepo.search(state.keyword, offset: state.menu.length);
      emit(state.addToMenu(menu!));
    }
    catch (error) {
      print(error);
      if (state.menu.isEmpty) {
        emit(state.copyWith(status: SearchStatus.notFound));
      } else {
        emit(state.copyWith(status: SearchStatus.found));
      }
    }
  }

  @override
  void onChange(Change<SearchState> change) {
    super.onChange(change);
    print(change.currentState.status);
    print(
        "State: ${change.nextState.status}\n\tkeyword: ${change.nextState.keyword}\n\tlast_keyword: ${change.nextState.lastKeyword}\n\tmenu: ${change.nextState.menu}\n");
  }
}