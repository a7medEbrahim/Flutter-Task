import 'package:bloc/bloc.dart';
import 'package:fluttertask/product_model.dart';
import 'package:fluttertask/product_state.dart';
import 'package:fluttertask/service/dio_helper.dart';
import 'package:fluttertask/service/endpoints.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductsInitialState());
  final dio = DioHelper.dio;
  List<ProductModel> allProducts = [];

  Future<void> getAllProduct() async {
    try {
      emit(ProductLoadingState());
      final apiResponse = await dio.get(EndPoints.product);
      allProducts = ProductModel.fromJsonList(apiResponse.data['products']);
      emit(ProductSuccessState());
    } on Exception catch (e) {
      Utility.myPrintX(e);
      emit(ProductErrorState());
    }
  }
}
