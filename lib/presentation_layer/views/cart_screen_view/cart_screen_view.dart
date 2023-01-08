
import 'package:fake_store/bussiness_layer/cart_cubit/cart_cubit.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartItem extends StatelessWidget
{
  final String productName;
  final String productPrice;
  final String productImage;
  final int index;
  const CartItem({Key? key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.index,
  }) :
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
          Image(image: NetworkImage(productImage,),fit: BoxFit.fill,),
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
                children:  [
                  RegularText(text: productName,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 1.h,),
                  RegularText(text: productPrice),
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
                  child: InkWell(
                      onTap:(){
                        CartCubit.get(context).removeCartItem(indexNumber: index, context: context);
                  },
                      child: const Icon(Icons.delete_forever,color: AppColor.white,)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}