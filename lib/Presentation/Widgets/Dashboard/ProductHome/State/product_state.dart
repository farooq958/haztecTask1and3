part of '../Controller/product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductSuccess extends ProductState {
  final List<ProductModel> productDto;
  ProductSuccess({required this.productDto});

}
class ProductError extends ProductState {

  final String error;
  ProductError({required this.error});

}