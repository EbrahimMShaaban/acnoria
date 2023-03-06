import 'package:acnoria/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  /// - weight: w200
  /// - family: cairo
  static TextStyle boldtitles =
  TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp, height: 1.7);

  static TextStyle boldtitlesButton =
  TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp,);

  /// - weight: w300
  /// - family: cairo
  static TextStyle w300 =
  TextStyle(fontWeight: FontWeight.w300, fontSize: 30.sp);

  /// - weight: w400
  /// - family: cairo
  static TextStyle hittext = TextStyle(
      color: AppColors.Bluehint, fontWeight:FontWeight.w600);

  /// - weight: w500
  /// - family: cairo
  static TextStyle smTitles =
  TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp);

  /// - weight: w600
  /// - family: cairo
  static TextStyle w600 = TextStyle(fontWeight: FontWeight.w600);

  /// - weight: w700
  /// - family: cairo
  static TextStyle lrTitles =
  TextStyle(fontWeight: FontWeight.w700, fontSize: 22.sp);

  /// - weight: w800
  /// - family: cairo
  static TextStyle w800 = TextStyle(fontWeight: FontWeight.w800);

  /// - weight: w900
  /// - family: cairo
  static TextStyle textsmbold =
  TextStyle(fontWeight: FontWeight.w800, fontSize: 16.sp, height: 2.5);
}
