import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: appPadding(),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 20),
              child: Text(
                "المفضلة",
                style: AppTextStyles.lrTitles
                    .apply(fontSizeDelta: 5, fontWeightDelta: 200),
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics:NeverScrollableScrollPhysics() ,

                itemBuilder: (context, index) {
                  return ContinerMyFavorite(context, () {});
                },
                separatorBuilder: (context, index) => Divider(height: 20),
                itemCount: 10),
            Expanded(
              child: SizedBox(),
            ),
            ButtonTemplate(
                minwidth: double.infinity,
                icon: Icons.add_circle_outline_rounded,
                color: AppColors.primarycolor,
                text1: " اضف الى السلة",
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

Widget ContinerMyFavorite(context, onPressed) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.symmetric(horizontal:0, vertical: 5),
    height: 100,
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
        Container(
          height: 70,
          width: 70,
          // color: Colors.amber
          child: Image.asset(
            "assets/images/item.png",
            fit: BoxFit.fill,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "أوه ماي تنت",
              style: AppTextStyles.boldtitles
                  .apply(color: AppColors.blue, fontSizeDelta: 2),
            ),
            Text(
              "350ml",
              style: AppTextStyles.smTitles.apply(
                  color: AppColors.greyDark,
                  fontSizeDelta: -2,
                  fontWeightDelta: 100),
            ),
          ],
        ),
        // Spacer(),
        Padding(
          padding: EdgeInsets.only(
            right: MediaQueryHelper.sizeFromWidth(context, 8),
          ),
          // alignment: Alignment.center,
          child: Text(
            "55 ر.س",
            style: AppTextStyles.boldtitles
                .apply(color: AppColors.green, fontSizeDelta: 0),
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  onPressed();
                },
                icon: Icon(Icons.clear_outlined)))
      ],
    ),
  );
}
