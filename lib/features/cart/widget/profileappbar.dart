import 'package:acnoria/shared/components/constants.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';
PreferredSizeWidget ProfileAppBar  (BuildContext context , {required String txt}){




    return AppBar(

      backgroundColor: Color(0xffF5F5F5),
      leadingWidth: MediaQueryHelper.sizeFromWidth(context, 1.5),
      leading: Padding(
        padding: const EdgeInsets.only(right:36.0,top: 10),
        child: Text(txt,
            style: AppTextStyles.boldtitles
                .copyWith(color: AppColors.blueDark, height: 2.5,fontSize: 22)),
      ),
      actions: [
        Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_backspace_sharp,
                  size: 25,
                ),
              ),
            ))
      ],
    );

}
