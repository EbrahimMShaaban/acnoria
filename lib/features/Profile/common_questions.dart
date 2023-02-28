import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class CommonQuestions extends StatelessWidget {
  const CommonQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = [
      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا"
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Tile'),
      ),
      body: Padding(
        padding: appPadding(),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQueryHelper.sizeFromWidth(context, 1),
              decoration: BoxDecoration(
                  color: AppColors.white,

                  borderRadius: BorderRadius.circular(15)),
              child: ExpansionTile(
                backgroundColor: AppColors.white,
                textColor: AppColors.blue,
                iconColor: AppColors.primarycolor,


                title: Text(
                  'هذا النص هو مثال لنص يمكن أن يستبدل في ؟ ',
                  style: AppTextStyles.boldtitles
                      .apply(color: AppColors.blue, fontSizeDelta: -4),
                ),
                children: data.map((data) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8, bottom: 20),
                    child: ListTile(
                        title: Text(
                      data,
                      style: AppTextStyles.boldtitles
                          .apply(color: AppColors.blue, fontSizeDelta: -2),
                    )),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
