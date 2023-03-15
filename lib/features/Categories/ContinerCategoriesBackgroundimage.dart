import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
class ContinerCategoriesBackgroundImage extends StatelessWidget {
  const ContinerCategoriesBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      height: 120,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.09),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ]),
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      child: Stack(
        children: [
          Image.asset("assets/images/img_3.png", fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "المكملات الغذائية",
                style: AppTextStyles.boldtitles
                    .apply(color: AppColors.blueDark, fontSizeDelta: -3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
