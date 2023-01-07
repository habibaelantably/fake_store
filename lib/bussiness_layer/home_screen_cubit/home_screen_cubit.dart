import 'package:dio/dio.dart';
import 'package:fake_store/bussiness_layer/home_screen_cubit/home_screen_states.dart';
import 'package:fake_store/data_layer/model/product_model.dart';
import 'package:fake_store/domain_layer/end_points.dart';
import 'package:fake_store/domain_layer/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(InitialHomeScreenState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  List<ProductDataModel> productsList = [];

  void getHomeData() {
    emit(GetHomeDataLoadingState());

    print('after Loading State');

    DioHelper.getData(
      url: getHomeProductsEndPoint,
      query: {},
    ).then((value) {

      print(value.data.toString());

      value.data.forEach((product) {
        ProductDataModel productDataModel = ProductDataModel.fromJson(product);
        productsList.add(productDataModel);
      });
      emit(GetHomeDataSuccessState());
      print('after Success State');
    }).catchError((e) {
      print(e.toString());
        emit(GetHomeDataErrorState(e.toString()));
    });
  }
}
