part of 'products_bloc.dart';

sealed class ProductsEvent {}

final class GetProductsEvent extends ProductsEvent {}

final class AddProductsEvent extends ProductsEvent {
  final ProductsModel productsModel;
  AddProductsEvent({required this.productsModel});
}

final class EditProductsEvent extends ProductsEvent {
  final ProductsModel productsModel;
  EditProductsEvent({required this.productsModel});
}

final class DeleteProductsEvent extends ProductsEvent {
  final String id;
  DeleteProductsEvent({required this.id});
}
