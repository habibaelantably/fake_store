
import 'package:fake_store/presentation_layer/constants/assets_manager.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatelessWidget
{
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const RegularText(text: 'Product details',),),
      body:  Padding(
        padding:  EdgeInsets.only(right: 2.0.w,left: 2.0.w,top: 1.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetsManager.testImage,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
              SizedBox(height: 5.0.h,),
              RegularText(text: 'Product Name',color: AppColor.black,fontSize: 16.sp,),
              SizedBox(height: 2.h,),
              Row(
                children:  [
                  RegularText(text: 'price:',color: AppColor.black,fontSize: 14.sp),
                  RegularText(text: '320',color: AppColor.grey,fontSize: 12.sp),
                ],
              ),

              SizedBox(height: 4.h,),
              const RegularText(text:'description :',fontWeight: FontWeight.bold,color: AppColor.black,),
              SizedBox(height: 1.h,),
              const RegularText(text:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum mollis neque, '
                  'sit amet vestibulum est pretium vitae. Proin non erat luctus, laoreet urna vitae, '
                  'sodales neque. Nulla blandit nec nunc nec eleifend. Donec odio orci, efficitur id venenatis quis,'
                  ' varius id ipsum. Vivamus cursus dui blandit sapien tincidunt, a commodo libero aliquam. Proin euismod '
                  'sagittis lectus ac luctus. Sed vestibulum arcu ante Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum mollis neque, '
                  'sit amet vestibulum est pretium vitae. Proin non erat luctus, laoreet urna vitae, '
                  'sodales neque. Nulla blandit nec nunc nec eleifend. Donec odio orci, efficitur id venenatis quis,'
                  ' varius id ipsum. Vivamus cursus dui blandit sapien tincidunt, a commodo libero aliquam. Proin euismod '
                  'sagittis lectus ac luctus. Sed vestibulum arcu ante',color: AppColor.black,),




            ],
          ),
        ),
      ),

    );
  }

}