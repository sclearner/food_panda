import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAppbarCubit extends Cubit<bool> {
  SearchAppbarCubit([bool? initialState]) : super(initialState ?? false);

  bool get isEditing => state;

  void edit() => emit(true);
  void submit() => emit(false);
}