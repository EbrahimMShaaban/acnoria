import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/images.dart';

PreferredSizeWidget AppSearchBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.materialGrey,
    leading: Padding(
      padding: const EdgeInsets.only(right: 15,top:10 ),
      child: Image.asset(
        AppImages.logo,
      ),
    ),
    leadingWidth: MediaQueryHelper.sizeFromWidth(context, 4),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_backspace_sharp,
              size: 25,
              textDirection: TextDirection.ltr,
            )),
      )
    ],
  );
}
