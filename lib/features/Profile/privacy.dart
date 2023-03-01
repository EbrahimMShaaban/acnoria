import 'package:acnoria/features/Profile/widgets/header.dart';
import 'package:acnoria/features/Profile/widgets/tileItem.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';
import '../../shared/styles/styles.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String data =
      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن'
    ;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              Padding(
                padding: appPadding(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'سياسة الخصوصية',
                          style: AppTextStyles.lrTitles,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.white,
                      ),
                      child: Text(data ,
                          style: AppTextStyles.smTitles),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'الشروط و الاحكام',
                          style: AppTextStyles.lrTitles,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.white,
                      ),
                      child: Text(data,
                          style: AppTextStyles.smTitles),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
