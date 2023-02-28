import 'package:acnoria/shared/components/constants.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';
PreferredSizeWidget ProfileAppBar  (BuildContext context , {required String txt}){




    return AppBar(
      backgroundColor: Color(0xffF5F5F5),
      leadingWidth: MediaQueryHelper.sizeFromWidth(context, 1.5),
      leading: Padding(
        padding: const EdgeInsets.only(right:36.0),
        child: Text(txt,
            style: AppTextStyles.boldtitles
                .apply(color: AppColors.blueDark, fontSizeFactor: 1.5)),
      ),
      actions: [
        Directionality(
            textDirection: TextDirection.ltr,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_backspace_sharp,
              ),
            ))
      ],
    );

}