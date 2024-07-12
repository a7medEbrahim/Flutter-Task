import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/dio_helper.dart';
import 'data/datasources/remote_data_source.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/Repositories/product_repository.dart';
import 'domain/usecases/get_all_products.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio
  DioHelper.init();
  sl.registerLazySingleton<Dio>(() => DioHelper.dio);

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSource(dio: sl()),
  );

  // Repositories
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllProducts(repository: sl()));
}
