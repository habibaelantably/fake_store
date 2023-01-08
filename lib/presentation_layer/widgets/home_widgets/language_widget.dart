import 'package:fake_store/bussiness_layer/change_language_cubit/language_cubit.dart';
import 'package:fake_store/bussiness_layer/change_language_cubit/language_states.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LanguageItem extends StatelessWidget {
  const LanguageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String menuValue = ChangeLanguageCubit.get(context).languageMenuValue;
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageStates>(
      builder: (context, state) {
        return ListTile(
          contentPadding: const EdgeInsets.all(1.0),
          horizontalTitleGap: 2.w,
          leading: Icon(Icons.language, color: Colors.white, size: 20.sp),
          title: RegularText(text:AppLocalizations.of(context)!.language,fontSize: 13.sp,),
          trailing: DropdownButton<String>(
            dropdownColor: AppColor.appDefaultColor,
            style: TextStyle(fontSize: 13.sp, color: Colors.white),
            value: ChangeLanguageCubit.get(context).languageMenuValue,
            items: [
              DropdownMenuItem(
                value: 'العربية',
                onTap: () {
                  onSelectLanguage(
                    menuValue: menuValue,
                    language: 'العربية',
                    context: context,
                  );
                },
                child: Text(
                  'العربية',
                  style: TextStyle(fontSize: 13.sp),
                ),
              ),
              DropdownMenuItem(
                value: 'English',
                onTap: () {
                  onSelectLanguage(
                    menuValue: menuValue,
                    language: 'English',
                    context: context,
                  );
                },
                child: Text(
                  'English',
                  style: TextStyle(fontSize: 13.sp),
                ),
              ),
            ],
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  void onSelectLanguage({
    required String menuValue,
    required String language,
    required BuildContext context,
  }) {
    if (menuValue != language) {
      ChangeLanguageCubit.get(context).changeAppLanguage(appLanguageIsArabic: language == 'العربية' ? true : false, languageMenuValue: language);
    } else {
      //showToast(msg: AppLocalizations.of(context)!.changeLanguageFallbackToast, toastStatus: ToastStatus.error);
    }
    Navigator.pop(context);
  }
}