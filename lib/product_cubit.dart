import 'package:bloc/bloc.dart';
import 'package:fluttertask/product_state.dart';
import 'package:fluttertask/service/dio_helper.dart';
import 'package:fluttertask/service/endpoints.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitState());
  final dio = DioHelper.dio;

  Future<void> getAllProduct() async {
    try {
      emit(ProductLoadingState());
      await dio.get(EndPoints.product);
      emit(ProductSuccessState());
    } on Exception catch (e) {
      Utility.myPrintX(e);
      emit(ProductErrorState());
    }
  }
}
