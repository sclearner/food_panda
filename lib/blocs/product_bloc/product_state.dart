part of 'product_bloc.dart';

enum ProductStatus { none, partial, loading, full, error }

class ProductState extends Equatable {
  final ProductStatus status;
  final Menu? menu;

  const ProductState({this.status = ProductStatus.none, this.menu});

  const ProductState.initial() : this();

  ProductState copyWith({ProductStatus? status, Menu? menu}) {
    return ProductState(status: status ?? this.status, menu: menu ?? this.menu);
  }

  @override
  List<Object?> get props => [
        status, menu
      ];
}
