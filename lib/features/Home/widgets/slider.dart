import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
final pages = List.generate(
  4,
      (index) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
        flex: 5,
        child: Container(
          margin: EdgeInsets.only(left: 5),
          child: Center(
              child: Image.asset(
                AppImages.indicator,
                width: 300,
                height: 300,
              )),
        ),
      ),
      SizedBox(width: 8),
      Expanded(
        flex: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'اجدد العروض!',
              style: AppTextStyles.smTitles
                  .copyWith(color: AppColors.green, fontSize: 14.sp),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'ايسنس ماسكارا لاش',
                style: AppTextStyles.lrTitles.copyWith(
                    color: AppColors.primarycolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    backgroundColor: AppColors.primarycolor),
                onPressed: () {},
                child: Text(
                  'اشتري اآن',
                  style: AppTextStyles.lrTitles.copyWith(fontSize: 14.sp),
                ))
          ],
        ),
      )
    ],
  ),
);