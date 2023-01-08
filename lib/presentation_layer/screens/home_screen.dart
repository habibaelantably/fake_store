import 'package:fake_store/bussiness_layer/home_screen_cubit/home_screen_cubit.dart';
import 'package:fake_store/bussiness_layer/home_screen_cubit/home_screen_states.dart';
import 'package:fake_store/bussiness_layer/search_cubit/search_cubit.dart';
import 'package:fake_store/bussiness_layer/search_cubit/search_states.dart';
import 'package:fake_store/data_layer/model/product_model.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/routers/app_routers.dart';
import 'package:fake_store/presentation_layer/views/drawer_menu.dart';
import 'package:fake_store/presentation_layer/widgets/home_widgets/products_list.dart';
import 'package:fake_store/presentation_layer/widgets/home_widgets/search_bar.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const RegularText(
            text: 'Home',
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouterNames.cartScreen);
                },
                icon: const Icon(Icons.shopping_cart_rounded))
          ],
        ),
        drawer: const AppDrawer(),
        body: BlocBuilder<HomeScreenCubit,HomeScreenStates>(
          builder: (BuildContext context, state) {
            if(state is GetHomeDataLoadingState){
              return Center(child: const CircularProgressIndicator(color: AppColor.appDefaultColor,));
            }
            if(state is GetHomeDataSuccessState){
              return  Column(
                children: [
                  Container(
                    height: 7.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColor.appDefaultColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.w),
                          bottomLeft: Radius.circular(10.w)),
                    ),
                    child: SearchBar(
                        itemsList: HomeScreenCubit.get(context).productsList,
                        onChanged: (value, searchControllerText) {
                          if (value.isEmpty) {
                            SearchCubit.get(context)
                                .searchInItems(searchedList: null);
                          } else {
                            List<ProductDataModel> searchedProduct =
                            HomeScreenCubit.get(context)
                                .productsList
                                .where((element) {

                              return element.title.contains(searchControllerText);
                            }).toList();
                            SearchCubit.get(context)
                                .searchInItems(searchedList: searchedProduct);
                          }
                        }),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  BlocBuilder<SearchCubit,SearchStates>(
                    builder: (BuildContext context, state) {
                      return ProductsList(
                          homeScreenCubit: HomeScreenCubit.get(context));
                    },

                  )

                ],
              );
            }
            if(state is GetHomeDataErrorState){
              return RegularText(text: state.errorMessage.toString());
            }

            //builder require a return statement so we will but this but it will never happen
            // because it`s impossible to get any other state
            return const SizedBox(height: 0.0,);
          },
        ));
  }
}
