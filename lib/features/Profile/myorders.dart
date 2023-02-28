import 'package:acnoria/features/cart/widget/profileappbar.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/images.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(context, txt: 'طلباتي'),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(5),
              height: MediaQueryHelper.sizeFromHeight(context, 4.5),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AppImages.rooge,
                    width: MediaQueryHelper.sizeFromWidth(context, 4),
                  ),
                  Container(
                    width: MediaQueryHelper.sizeFromWidth(context, 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'أوه ماي تنت',
                          style: AppTextStyles.lrTitles,
                        ),
                        RichText(
                            text: TextSpan(
                                style: AppTextStyles.smTitles
                                    .copyWith(color: AppColors.primarycolor),
                                text: 'السعر:  ',
                                children: [
                              TextSpan(
                                  text: '55',
                                  style: AppTextStyles.smTitles
                                      .copyWith(color: AppColors.black))
                            ])),
                        RichText(
                            text: TextSpan(
                                style: AppTextStyles.smTitles
                                    .copyWith(color: AppColors.primarycolor),
                                text: 'الكمية:  ',
                                children: [
                              TextSpan(
                                  text: '2',
                                  style: AppTextStyles.smTitles
                                      .copyWith(color: AppColors.black))
                            ])),
                        RichText(
                            text: TextSpan(
                                style: AppTextStyles.smTitles
                                    .copyWith(color: AppColors.primarycolor),
                                text: 'الحالة:  ',
                                children: [
                              TextSpan(
                                  text: 'يتم تجهيزه للتحويل',
                                  style: AppTextStyles.smTitles
                                      .copyWith(color: Colors.red))
                            ])),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        AppImages.loading,
                        width: MediaQueryHelper.sizeFromWidth(context, 12),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: 2),
    );
  }
}
