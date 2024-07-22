part of 'products_bloc.dart';

sealed class ProductsState {}

final class InitialProductsState extends ProductsState {}

final class LoadingProductsState extends ProductsState {}

final class LoadedProductsState extends ProductsState {
  final List<ProductsModel> products;

  LoadedProductsState(this.products);
}

final class ErrorProductsState extends ProductsState {
  final String msg;
  ErrorProductsState(this.msg);
}
