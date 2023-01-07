import 'package:fake_store/bussiness_layer/home_screen_cubit/home_screen_cubit.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:fake_store/presentation_layer/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'bloc_observer.dart';
import 'data_layer/local/cache_helper.dart';
import 'domain_layer/remote/Dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeScreenCubit()..getHomeData()
        ),
      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
          return MaterialApp(
            title: 'Flutter Demo',
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
          );
        },

      ),
    );
  }
}
