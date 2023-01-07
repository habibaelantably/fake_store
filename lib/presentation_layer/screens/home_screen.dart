
import 'package:fake_store/bussiness_layer/home_screen_cubit/home_screen_cubit.dart';
import 'package:fake_store/bussiness_layer/home_screen_cubit/home_screen_states.dart';
import 'package:fake_store/presentation_layer/constants/assets_manager.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/routers/app_routers.dart';
import 'package:fake_store/presentation_layer/views/drawer_menu.dart';
import 'package:fake_store/presentation_layer/views/home_screen_views/home_view.dart';
import 'package:fake_store/presentation_layer/widgets/home_widgets/search_bar.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                }, icon: const Icon(Icons.shopping_cart_rounded))
          ],
        ),
        drawer: const AppDrawer(),
        body: Column(
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
              child: const SearchBar(),
            ),
            SizedBox(
              height: 2.h,
            ),
            BlocBuilder<HomeScreenCubit,HomeScreenStates>(
              builder: (BuildContext context, state) {
                if (state is GetHomeDataLoadingState){
                  return const Center(child: CircularProgressIndicator());
                }
                  if (state is GetHomeDataSuccessState) {
                  return Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            ProductCard(
                             productImage:HomeScreenCubit.get(context).productsList.map((e) => e.image).toString(),
                             productName: HomeScreenCubit.get(context).productsList.map((e) => e.title).toString(),
                             productPrice:  HomeScreenCubit.get(context).productsList.map((e) => e.price).toString(),),
                        separatorBuilder: (context, index) => SizedBox(height: 0.h,),
                        itemCount: 10),
                  );
                }
                if (state is GetHomeDataErrorState){
                  return  Center(child: RegularText(text:'error',color: AppColor.black,));
                }
                return const SizedBox(height: 0.0,);
              },
            )
          ],
        ));
  }
}
