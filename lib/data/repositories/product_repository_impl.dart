import 'package:fluttertask/data/datasources/remote_data_source.dart';
import 'package:fluttertask/data/models/product_model.dart';
import 'package:fluttertask/domain/Repositories/product_repository.dart';
import 'package:fluttertask/domain/entities/Product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getAllProducts() async {
    final response = await remoteDataSource.getAllProducts();
    return ProductModel.fromJsonList(response['products']);
  }
}
