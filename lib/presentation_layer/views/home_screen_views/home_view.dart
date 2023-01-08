
import 'package:fake_store/bussiness_layer/cart_cubit/cart_cubit.dart';
import 'package:fake_store/bussiness_layer/cart_cubit/cart_states.dart';
import 'package:fake_store/data_layer/model/product_model.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/routers/app_routers.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget
{
  final ProductDataModel productDataModel;
  const ProductCard({Key? key,
    required this.productDataModel,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,
            AppRouterNames.productDetailsScreen,
            arguments: {
          "productId":productDataModel.id,
          "productTitle": productDataModel.title,
          "productImage":productDataModel.image,
          "productPrice": productDataModel.price,
          "productDescription": productDataModel.description,
        });
      },
      child: Padding(
        padding:  EdgeInsets.all(2.0.sp),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0.w),
              ),
              elevation: 5.0,
              child: Row(
                children: [
                  Container(
                    height: 20.h,
                    width: 15.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0.w),
                          bottomLeft: Radius.circular(5.0.w),
                        ),
                        image:  DecorationImage(
                          image:  NetworkImage(productDataModel.image),
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(
                    width: 2.0.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText(text: productDataModel.title,color: AppColor.appDefaultColor,
                          fontSize: 12.sp,maxLines:1,overflow:TextOverflow.ellipsis,),
                        SizedBox(
                          height: 1.h,
                        ),
                        RegularText(text: productDataModel.price.toString(),color: AppColor.greyOfText,fontSize: 10.sp),
                        SizedBox(height: 6.0.h,),
                        Row(
                          children: [
                            SizedBox(width: 45.0.w,),
                            BlocBuilder<CartCubit,CartStates>(
                              builder: (BuildContext context, Object? state) {
                                return InkWell(
                                  onTap: (){
                                    CartCubit.get(context).addToCart(
                                        productId: productDataModel.id,
                                        productImage: productDataModel.image,
                                        productTitle: productDataModel.title,
                                        productPrice: productDataModel.price,
                                        context: context);
                                  },
                                  child: CircleAvatar(radius:2.h,backgroundColor:AppColor.appDefaultColor ,
                                      child: const Icon(Icons.shopping_cart_rounded,color: AppColor.white,)),
                                );
                              },

                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}