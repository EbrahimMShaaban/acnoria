import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../shared/styles/images.dart';
import '../cart/view.dart';
import '../search/widgets/search_bar.dart';

class CategoriesScrren extends StatelessWidget {
  const CategoriesScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            AppImages.basket,height: 33,
            color: AppColors.primarycolor,
          ),
          onPressed: () {
            navigateTo(context, CartScreen());
          },
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
      ),
      body: Padding(
        padding: appPadding(),
        child: ListView(children: [
          Text(
            "التصنيفات",
            style: AppTextStyles.boldtitles.apply(
              fontSizeDelta: 10,
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Container(
              height: MediaQueryHelper.sizeFromHeight(context, 8),
              //  color: Colors.red,
              child: SearchBar()),SizedBox(
            height: 30,
          ),
          ContinerCategories_backgroundimage(context),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ContinerCategories(
                context,
              );
            },
            itemCount: 20,
          )
        ]),
      ),
    );
  }
}

Widget ContinerCategories(
  context,
) {
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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "المكملات الغذائية",
          style: AppTextStyles.boldtitles
              .apply(color: AppColors.blueDark, fontSizeDelta: 3),
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
  );
}

Widget ContinerCategories_backgroundimage(
  context,
) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "المكملات الغذائية",
              style: AppTextStyles.boldtitles
                  .apply(color: AppColors.blueDark, fontSizeDelta: 3),
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
      ],
    ),
  );
}
