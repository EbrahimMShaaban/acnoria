import 'package:acnoria/shared/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/constants.dart';

class BottomItem extends StatelessWidget {
  BottomItem(
      {required this.onclick,
      // required this.width,
      required this.path,
      required this.heigh,
      Key? key})
      : super(key: key);
  Function onclick;

  // double width;
  IconData path;
  double heigh;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 40,
        onPressed: () {
          onclick();
        },
        child: Column(
          children: [
            Expanded(
              child: Icon(
                path,
                color: AppColors.primarycolor,
              ),
              // Icon(
              //   Icons.home,
              //   size: cubit.currentTab == 0 ? 35 : 25,
              //   color: cubit.currentTab == 0
              //       ? AppColors.white
              //       : AppColors.grey,
              // ),
            ),
          ],
        ));
  }
}
