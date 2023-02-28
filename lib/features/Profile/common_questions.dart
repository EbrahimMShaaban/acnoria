import 'package:acnoria/features/Profile/widgets/header.dart';
import 'package:acnoria/features/Profile/widgets/tileItem.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/images.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class CommonQuestions extends StatelessWidget {
  const CommonQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = [
      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا"
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header(),
            Padding(
              padding: appPadding(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'الأسألة الشائعة',
                        style: AppTextStyles.lrTitles,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TileItem(data: data),
                  TileItem(data: data),
                  TileItem(data: data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
