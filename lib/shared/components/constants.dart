import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



abstract class MediaQueryHelper {
  static double sizeFromHeight(BuildContext context, double fraction,
      {bool hasAppBar = true}) {
    final screenHeight = MediaQuery.of(context).size.height;
    fraction = (hasAppBar ? (screenHeight - AppBar().preferredSize.
    height -
        MediaQuery.of(context).padding.top)
        : screenHeight) /
        fraction;
    return fraction;
  }

  static double sizeFromWidth(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.width / fraction;
  }
}


appPadding(){
  return EdgeInsets.symmetric(horizontal: 30.h,vertical: 10.w);
}