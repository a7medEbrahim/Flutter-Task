import 'package:bloc/bloc.dart';
import 'package:fluttertask/core/utils/Utility..dart';
import 'package:fluttertask/data/datasources/dio_helper.dart';
import 'package:fluttertask/data/models/product_model.dart';
import 'package:fluttertask/presentation/bloc/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductsInitialState());
  final dio = DioHelper.dio;
  List<ProductModel> allProducts = [];

  Future<void> getAllProduct() async {
    try {
      emit(ProductLoadingState());
      final apiResponse = await dio.get('/products');
      allProducts = ProductModel.fromJsonList(apiResponse.data['products']);
      emit(ProductSuccessState());
    } on Exception catch (e) {
      Utility.myPrintX(e);
      emit(ProductErrorState());
    }
  }
}
