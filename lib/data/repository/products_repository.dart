import 'package:dio/dio.dart';
import 'package:dio_package/data/models/products_model.dart';

import '../services/dio_products_service.dart';

class ProductsRepository {
  final DioProductsService _dioProductsService;

  ProductsRepository({required DioProductsService dioProductsService})
      : _dioProductsService = dioProductsService;

  Future<List<ProductsModel>> getProducts() async {
    return await _dioProductsService.getProducts();
  }

  Future<ProductsModel> addProduct(ProductsModel product) async {
    return _dioProductsService.addProduct(product);
  }

  Future<ProductsModel> updateProduct(ProductsModel product) async {
    return _dioProductsService.updateProduct(product);
  }

  Future<Response> deleteProduct(String id) async {
    return _dioProductsService.deleteProduct(id);
  }
}
