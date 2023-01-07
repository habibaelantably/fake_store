
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/routers/app_routers.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget
{
  final String? productName;
  final String? productPrice;
  final String? productImage;
  const ProductCard({Key? key,
    required this.productName,
    required this.productImage,
    required this.productPrice}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRouterNames.productDetailsScreen);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                    width: 20.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0.w),
                          bottomLeft: Radius.circular(5.0.w),
                        ),
                        image:  DecorationImage(
                          image:  AssetImage(productImage!),
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(
                    width: 2.0.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegularText(text: productName!,color: AppColor.black,fontSize: 15.sp,),
                      SizedBox(
                        height: 1.h,
                      ),
                      RegularText(text: productPrice!,color: AppColor.greyOfText,fontSize: 10.sp,),
                      SizedBox(height: 6.0.h,),
                      Row(
                        children: [
                          SizedBox(width: 35.0.w,),
                          CircleAvatar(radius:2.h,backgroundColor:AppColor.appDefaultColor ,
                              child: const Icon(Icons.shopping_cart_rounded,color: AppColor.white,)),
                        ],
                      )
                    ],
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