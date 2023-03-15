import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
class ContinerCategories extends StatelessWidget {
  ContinerCategories({required this.name, Key? key}) : super(key: key);

  // Data? model;
  String name;


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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: AppTextStyles.boldtitles
                  .apply(color: AppColors.blueDark, fontSizeDelta: -3),
            ),
            Container(
              height: 70,
              width: 70,
              // color: Colors.amber
              child: Image.asset(
                "assets/images/gym.png",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}