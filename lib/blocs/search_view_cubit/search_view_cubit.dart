import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchViewMode {grid, list}

class SearchViewCubit extends Cubit<SearchViewMode> {
  SearchViewCubit() : super(SearchViewMode.grid);

  void changeTo(SearchViewMode mode) => emit(mode);
}