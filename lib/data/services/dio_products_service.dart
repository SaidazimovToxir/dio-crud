import 'package:dio/dio.dart';

import '../../core/network/dio_client.dart';
import '../models/products_model.dart';

class DioProductsService {
  final _dioClient = DioClient();

  Future<List<ProductsModel>> getProducts() async {
    try {
      final response = await _dioClient.get(url: "/products");

      List<ProductsModel> products = [];

      for (var i in response.data) {
        // print(i);
        products.add(ProductsModel.fromMap(i));
        print(products);
      }
      // print(products);
      return products;
    } on DioException catch (e) {
      print("Dio error: $e");
      rethrow;
    } catch (e) {
      print("Catch error: $e");
      rethrow;
    }
  }

  Future<ProductsModel> addProduct(ProductsModel product) async {
    try {
      final response =
          await _dioClient.add(url: "/products", data: product.toMap());

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to add product');
      }

      print("service response: $response");

      return ProductsModel.fromMap(response.data);
    } on DioException catch (e) {
      print("Dio service error: $e");
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductsModel> updateProduct(ProductsModel product) async {
    try {
      final response = await _dioClient.update(
          url: "/products/${product.id}", data: product.toMap());

      return ProductsModel.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteProduct(String id) async {
    try {
      final response = await _dioClient.delete(url: "/products/$id");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
