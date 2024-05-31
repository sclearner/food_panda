part of 'product_bloc.dart';

sealed class ProductEvent {
  const ProductEvent();
}

final class ProductGetData extends ProductEvent {
  const ProductGetData();
}

