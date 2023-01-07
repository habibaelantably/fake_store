import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.appDefaultColor,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // const LanguageItem(),
          // SizedBox(
          //   height: 18.h,
          // ),
          // const MyOrdersItem(),
          // SizedBox(
          //   height: 18.h,
          // )
        ],
      ),
    );
  }
}
