import 'package:fluttertask/domain/Repositories/product_repository.dart';
import 'package:fluttertask/domain/entities/Product.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts({required this.repository});

  Future<List<Product>> call() async {
    return await repository.getAllProducts();
  }
}
