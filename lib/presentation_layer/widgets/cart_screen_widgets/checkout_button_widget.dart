import 'package:fake_store/bussiness_layer/cart_cubit/cart_cubit.dart';
import 'package:fake_store/bussiness_layer/cart_cubit/cart_states.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/routers/app_routers.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class PayNowButton extends StatelessWidget {
  const PayNowButton({
    Key? key,
  }) : super(key: key);

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
                     Expanded(
                        child: RegularText(
                          text: AppLocalizations.of(context)!.checkout,
                        )),
                    FittedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!.total,
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.white)),
                          BlocBuilder<CartCubit,CartStates>(
                            builder: (BuildContext context, state) {
                              return Text('${CartCubit.get(context).calculateTotalPrice()} EGP',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.white));
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}
