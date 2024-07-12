import 'package:fluttertask/domain/entities/Product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
}
