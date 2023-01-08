import 'package:fake_store/bussiness_layer/home_screen_cubit/home_screen_cubit.dart';
import 'package:fake_store/bussiness_layer/search_cubit/search_cubit.dart';
import 'package:fake_store/data_layer/model/product_model.dart';
import 'package:fake_store/presentation_layer/views/home_screen_views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key, required this.homeScreenCubit}) : super(key: key);
  final HomeScreenCubit homeScreenCubit;
  @override
  Widget build(BuildContext context) {
    List<ProductDataModel> displayList = SearchCubit.get(context).searchedList == null ?
    homeScreenCubit.productsList:(SearchCubit.get(context).searchedList! as List<ProductDataModel>);
    return  Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => ProductCard(
            productDataModel:displayList[index],),
          separatorBuilder: (context, index) => SizedBox(height: 0.h,),
          itemCount: displayList.length),
    );
  }
}