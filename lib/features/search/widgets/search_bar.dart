import 'package:acnoria/features/search/filteration.dart';
import 'package:acnoria/shared/components/navigator.dart';
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
     // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: MediaQueryHelper.sizeFromWidth(context, 1.5),

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextFieldTemplate(
                hintText: 'بحث',
                controller: searchcontroller,
                Icon: Icon(Icons.search,color: AppColors.primarycolor,size: 20),

              ),
            )),
        SizedBox(width: 10,),
        InkWell(
          onTap: (){
            navigateTo(context, FilterAtion());
          },
          child: Container(
            height: MediaQueryHelper.sizeFromWidth(context, 9),

            width: MediaQueryHelper.sizeFromWidth(context, 9),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(AppImages.filter),
            ),
          ),
        )
      ],
    );
  }
}
