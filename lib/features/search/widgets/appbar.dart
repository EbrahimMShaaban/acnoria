import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/images.dart';

PreferredSizeWidget AppSearchBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.materialGrey,
    leading: Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Image.asset(
        AppImages.logo,
      ),
    ),
    leadingWidth: MediaQueryHelper.sizeFromWidth(context, 4),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            textDirection: TextDirection.ltr,
          ))
    ],
  );
}
