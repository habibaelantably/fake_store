
import 'package:fake_store/presentation_layer/constants/assets_manager.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartItem extends StatelessWidget
{
  final String? productName;
  final String? productPrice;
  final String? productImage;
  const CartItem({Key? key,required this.productImage,
    required this.productName,
    required this.productPrice}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.w),
      ),
      elevation: 5.0,

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(AssetsManager.testImage,fit: BoxFit.cover,),
          Container(
            height: 10.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.w),
              color: AppColor.appDefaultColor,
            ),

            child: Padding(
              padding:  EdgeInsets.all(3.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  RegularText(text: 'Product name'),
                  RegularText(text: 'Price'),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(right: 1.w,bottom: 1.h),
                  child: const Icon(Icons.delete_forever,color: AppColor.white,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}