import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/widgets/home_widgets/drawer_header.dart';
import 'package:fake_store/presentation_layer/widgets/home_widgets/language_widget.dart';
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
        children: const [
          DrawerHeaderWidget(),
          LanguageItem(),

        ],
      ),
    );
  }
}
