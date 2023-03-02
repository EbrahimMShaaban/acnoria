import 'package:acnoria/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffF5F5F5),
    platform: TargetPlatform.iOS,
    fontFamily: 'Schyler',
    primaryColor: AppColors.primarycolor,
    primarySwatch: Colors.green,
    iconTheme: IconThemeData(color: AppColors.primarycolor),
    buttonTheme: ButtonThemeData(
      splashColor: AppColors.primarycolor,
      focusColor: AppColors.primarycolor,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: AppColors.blueDark,
      ),
      headline2: TextStyle(
        color: AppColors.blueDark,
      ),
      bodyText2: TextStyle(
        color: AppColors.blueDark,
      ),
      subtitle1: TextStyle(
        color: AppColors.blueDark,
      ),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        toolbarHeight: 60,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primarycolor, size: 30),
        titleTextStyle: TextStyle(
          color: AppColors.primarycolor,
          fontSize: 32,
          fontWeight: FontWeight.w500,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primarycolor,
            statusBarIconBrightness: Brightness.light)),
    sliderTheme: SliderThemeData(
        inactiveTrackColor: AppColors.materialGrey,
      //   inactiveTickMarkColor: Colors.orangeAccent,
      //   disabledActiveTickMarkColor: Colors.deepOrange,
      //   disabledActiveTrackColor: Colors.lightGreenAccent,
      //   disabledInactiveTickMarkColor: Colors.purpleAccent,
      // disabledThumbColor: Colors.black,
      // disabledSecondaryActiveTrackColor: Colors.brown,
      activeTrackColor: AppColors.primarycolor,
      activeTickMarkColor: AppColors.primarycolor,
      disabledInactiveTrackColor: Colors.blue,
      // overlappingShapeStrokeColor: Colors.yellowAccent,
      // overlayColor: Colors.orangeAccent
// secondaryActiveTrackColor: Colors.yellowAccent,
      thumbColor: AppColors.primarycolor,



    )
);
