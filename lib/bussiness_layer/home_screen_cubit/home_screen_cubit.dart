import 'package:fake_store/bussiness_layer/home_screen_cubit/home_screen_states.dart';
import 'package:fake_store/data_layer/model/product_model.dart';
import 'package:fake_store/domain_layer/end_points.dart';
import 'package:fake_store/domain_layer/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(InitialHomeScreenState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  List<ProductDataModel> productsList = [];

  List<ProductDataModel>? searchedList;


  void getHomeData() {
    emit(GetHomeDataLoadingState());

    DioHelper.getData(
      url: getHomeProductsEndPoint,
      query: {},
    ).then((value) {
      // Map<String,dynamic> formattedJson = {
      //   "data" : value.data
      // };
      // ProductDataModel productDataModel = ProductDataModel.fromJson(formattedJson);

      //this forEach loop because the API was list not in form of key and value so I used foreach
      //also I think it`s better to make it like the above code by making to my self akey and value
      value.data.forEach((product) {
        ProductDataModel productDataModel = ProductDataModel.fromJson(product);
        productsList.add(productDataModel);
      });
      emit(GetHomeDataSuccessState());
    }).catchError((e) {
      print(e.toString());
        emit(GetHomeDataErrorState(e.toString()));
    });
  }
}

