import 'package:fake_store/bussiness_layer/cart_cubit/cart_cubit.dart';
import 'package:fake_store/bussiness_layer/change_language_cubit/language_states.dart';
import 'package:fake_store/bussiness_layer/home_screen_cubit/home_screen_cubit.dart';
import 'package:fake_store/bussiness_layer/search_cubit/search_cubit.dart';
import 'package:fake_store/domain_layer/remote/dio_helper.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc_observer.dart';
import 'bussiness_layer/change_language_cubit/language_cubit.dart';
import 'data_layer/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  bool? isArabic = CacheHelper.getDataFromSharedPreference(
    key: 'language',
  );
  Bloc.observer = MyBlocObserver();
  runApp(
    MyApp(
      appRouter: AppRouter(),
      isArabic: isArabic ?? false,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool isArabic;

  const MyApp({
    required this.appRouter,
    required this.isArabic,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeScreenCubit()..getHomeData()
        ),
        BlocProvider(
          create: (context) => CartCubit()..getCart(context: context)
        ),
        BlocProvider(
          create: (context) => SearchCubit()
        ),
        BlocProvider(
          create: (context) => ChangeLanguageCubit()..changeAppLanguage(appLanguageIsArabic: isArabic),
        ),

      ],
      child: BlocBuilder<ChangeLanguageCubit,ChangeLanguageStates>(
        builder: (BuildContext context, state) {
          return Sizer(
            builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
              return MaterialApp(
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    titleTextStyle: TextStyle(
                      color: AppColor.white,
                    ),
                    centerTitle: true,
                    elevation: 0.0,
                    iconTheme: IconThemeData(color: Colors.white),
                    actionsIconTheme: IconThemeData(color: Colors.white),
                    backgroundColor: AppColor.appDefaultColor,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.light,
                    ),

                  ),
                ),
                onGenerateRoute: appRouter.onGenerateRoute,
                localizationsDelegates:  const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                locale: ChangeLanguageCubit.get(context).appLanguageIsArabic ? const Locale('ar') : const Locale('en'),
              );
            },

          );
        },
      ),
    );
  }
}
