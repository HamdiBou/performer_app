import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return await _dio.post(path, data: data, queryParameters: queryParameters);
  }

  // Add more methods as needed (put, delete, etc.)
}
