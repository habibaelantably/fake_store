
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/views/checkout_screen_views/address_view.dart';
import 'package:fake_store/presentation_layer/views/checkout_screen_views/payment_methods_view.dart';
import 'package:fake_store/presentation_layer/widgets/shared/default_button.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CheckoutScreen extends StatelessWidget
{

   final formKey = GlobalKey<FormState>();

   CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formKey,
      appBar: AppBar(
        title:  RegularText(text:AppLocalizations.of(context)!.checkout,),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              RegularText(text: AppLocalizations.of(context)!.address,color: AppColor.greyOfText,fontSize: 16.sp,),
              AddressView(),
              SizedBox(height: 5.0.h,),
              RegularText(text: AppLocalizations.of(context)!.paymentMethod,color: AppColor.greyOfText,fontSize: 16.sp,),
              SizedBox(height: 2.0.h,),
              const PaymentMethodsView(),
              SizedBox(height: 10.0.h,),
              DefaultButton(
                width: MediaQuery.of(context).size.width,
                function: (){
                  if(formKey.currentState!.validate()){
                  }
                },
                isUpperCase: true,
                text: AppLocalizations.of(context)!.payment,
                background: AppColor.appDefaultColor,
                radius: 10.0,
              )

            ],

          ),
        ),
      ),
    );
  }

}