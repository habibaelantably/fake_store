
import 'package:fake_store/bussiness_layer/home_screen_cubit/home_screen_cubit.dart';
import 'package:fake_store/bussiness_layer/home_screen_cubit/home_screen_states.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatelessWidget
{

  final int id;
  final String title;
  final String image;
  final double price;
  final String description;

   const ProductDetailsScreen({Key? key,
     required this.id,
     required this.title,
     required this.image,
     required this.price,
     required this.description
   }) : super(key: key);


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const RegularText(text: 'Product details',),),
      body:  Padding(
        padding:  EdgeInsets.only(right: 2.0.w,left: 2.0.w,top: 1.h),
        child: SingleChildScrollView(
          child: BlocBuilder<HomeScreenCubit,HomeScreenStates>(
            builder: (BuildContext context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: NetworkImage(image,),fit: BoxFit.fitWidth,),
                  SizedBox(height: 5.0.h,),
                  RegularText(text: title,color: AppColor.black,fontSize: 16.sp,),
                  SizedBox(height: 2.h,),
                  Row(
                    children:  [
                      RegularText(text:AppLocalizations.of(context)!.price,color: AppColor.black,fontSize: 14.sp),
                      RegularText(text: price.toString(),color: AppColor.grey,fontSize: 12.sp),
                    ],
                  ),

                  SizedBox(height: 4.h,),
                  RegularText(text:AppLocalizations.of(context)!.description,fontWeight: FontWeight.bold,color: AppColor.black,),
                  SizedBox(height: 1.h,),
                  RegularText(text:description,color: AppColor.black,),

                ],
              );
            },
          ),
        ),
      ),

    );
  }

}