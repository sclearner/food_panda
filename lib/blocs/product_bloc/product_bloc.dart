import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/models/menu.dart';
import 'package:food_panda/repositories/product_repo.dart';

part 'product_state.dart';

part 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo _productRepo;
  final String productId;

  ProductBloc({required this.productId, required ProductRepo productRepo, Menu? initialData})
      : _productRepo = productRepo,
        super(ProductState(menu: initialData, status: ProductStatus.partial)) {
    on<ProductGetData>(_onProductGetData);
  }

  Future<void> _onProductGetData(ProductGetData event, Emitter<ProductState> emit) async {
    try {
      if (state.status == ProductStatus.none) {
        emit(state.copyWith(status: ProductStatus.loading));
        Menu menu = await _productRepo.getMenuById(productId);
        emit(state.copyWith(status: ProductStatus.full, menu: menu));
      }
      else if (state.status == ProductStatus.partial) {
        emit(state.copyWith(status: ProductStatus.loading));
        Menu menu = await _productRepo.getMoreInfo(state.menu!);
        emit(state.copyWith(status: ProductStatus.full, menu: menu));
      }
    }
    catch (e) {
      emit(state.copyWith(status: ProductStatus.error));
    }
  }

  @override
  void onChange(Change<ProductState> change) {
    super.onChange(change);
    print(change.currentState);
    print(change.nextState);
  }
}
