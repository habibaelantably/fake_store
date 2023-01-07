import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/routers/app_routers.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PayNowButton extends StatelessWidget {
  const PayNowButton({
    Key? key,
    required this.totalValue,
  }) : super(key: key);
  final double totalValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRouterNames.checkoutScreen);
      },
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 1.h, right: 1.w, left: 1.w,top: 1.h),
            child: Container(
                height: 8.h,
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.w),
                  color: AppColor.appDefaultColor,
                ),
                child: Row(
                  children: [
                    const Expanded(
                        child: RegularText(
                          text: 'checkout',
                        )),
                    FittedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('total',
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.white)),
                          Text(totalValue.toString(),
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}
