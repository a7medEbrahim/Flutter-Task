import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio dio;

  RemoteDataSource({required this.dio});

  Future<Map<String, dynamic>> getAllProducts() async {
    final response = await dio.get('/products');
    return response.data;
  }
}
