import 'package:acnoria/features/Categories/cubit/cubit.dart';
import 'package:acnoria/features/Home/cubit/cubit.dart';
import 'package:acnoria/features/layout/view.dart';

import 'package:acnoria/features/registration/login/view.dart';
import 'package:acnoria/shared/network/local/shared_preferences.dart';
import 'package:acnoria/shared/network/remote/dio_helper.dart';
import 'package:acnoria/shared/network/remote/end_points.dart';
import 'package:acnoria/shared/styles/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/Favourite/cubit/cubit.dart';
import 'features/search/cubit/cubit.dart';





void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();

  await DioHelper.init();
  await CacheHelper.init();
  final Widget startWidget;
  // await Future.delayed(Duration(seconds: 5));
  token = CacheHelper.getData(key: 'token');

  if (token != null) {
    if (token != null)
      startWidget = AppLayout();
    else
      startWidget = LoginScreen();
  } else {
    startWidget = LoginScreen();
  }
  runApp(MyApp(
    startwidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startwidget;

  const MyApp({Key? key, required this.startwidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {

        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) =>
              CategoriesCubit()..getAllCatefories(),

            ),
            BlocProvider(
              create: (context) => FavouritesCubit()..getAllfavourites(),


            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar'), // English
              // Locale('es'), // Spanish
            ],
            home: startwidget,
          ),
        );
      },
    );
  }
}
