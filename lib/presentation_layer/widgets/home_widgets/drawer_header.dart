



import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sizer/sizer.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: DrawerHeader(
          decoration: const BoxDecoration(color: AppColor.white),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.settings,
                  size: 75.sp,
                  color: AppColor.appDefaultColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                RegularText(text: AppLocalizations.of(context)!.settings,fontSize: 25.sp,color: AppColor.appDefaultColor,)
              ],
            )
          )),
    );
  }
}
