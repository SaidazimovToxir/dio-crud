import 'package:dio/dio.dart';

class DioClient {
  final _dio = Dio();
  DioClient._prive() {
    _dio.options
      ..connectTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 3)
      ..baseUrl = "https://api.escuelajs.co/api/v1";
  }

  static final _singletonConstructor = DioClient._prive();

  factory DioClient() {
    return _singletonConstructor;
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = _dio.get(
        url,
        queryParameters: queryParams,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> add({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(url, data: data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> update({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.patch(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.delete(url, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
