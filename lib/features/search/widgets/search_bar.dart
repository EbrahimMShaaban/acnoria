import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
class SearchBar extends StatelessWidget {
   SearchBar({Key? key}) : super(key: key);
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: MediaQueryHelper.sizeFromWidth(context, 1.5),

            child: TextFieldTemplate(
              hintText: 'بحث',
              controller: searchcontroller,
            )),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white),
          child: Image.asset(AppImages.filter),
        )
      ],
    );
  }
}
