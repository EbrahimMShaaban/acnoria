import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/components/navigator.dart';

class DoneShoppingScreen extends StatefulWidget {
  const DoneShoppingScreen({Key? key}) : super(key: key);

  @override
  State<DoneShoppingScreen> createState() => _DoneShoppingScreenState();
}

class _DoneShoppingScreenState extends State<DoneShoppingScreen> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        leading: SizedBox(),
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
      body: SizedBox(
        height: MediaQueryHelper.sizeFromHeight(context, 1),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  // color: Colors.yellowAccent,

                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/done_shopping.png",
                        alignment: Alignment.center,
                        width: 250,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        "تم اتمام العملية بنجاح  سيتم توصيل طلبك خلال\n 24 دقيقه",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.boldtitles,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0))),
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 4),
                margin: EdgeInsets.only(
                  top: MediaQueryHelper.sizeFromHeight(context, 2.5),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "اسم العميل",
                        style: AppTextStyles.boldtitles.apply(fontSizeDelta: 3),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(10),
                        height: 200,
                        width: MediaQueryHelper.sizeFromWidth(context, 1),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(  crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.add_location_rounded,
                                  size: 33,
                                  color: AppColors.primarycolor,
                                ),
                                Text(
                                  "العنوان",
                                  style: AppTextStyles.boldtitles.apply(
                                      color: AppColors.primarycolor,
                                      fontSizeDelta: 5),
                                ),
                              ],
                            ),
                            Text(
                              "85 صاري, الخالدية 506 جدة, 23\n423 - 8949",
                              style: AppTextStyles.boldtitles.apply(
                                  color: AppColors.greyDark, fontSizeDelta: -3),
                            ),
                            Row(  crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.add_location_rounded,
                                  size: 33,
                                  color: AppColors.primarycolor,
                                ),
                                Text(
                                  "رقم التواصل",
                                  style: AppTextStyles.boldtitles.apply(
                                      color: AppColors.primarycolor,
                                      fontSizeDelta: 5),
                                ),
                              ],
                            ),
                            Text(
                              "96655245+",
                              style: AppTextStyles.boldtitles.apply(
                                  color: AppColors.greyDark, fontSizeDelta: -3),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "المنتجات",
                        style: AppTextStyles.boldtitles.apply(fontSizeDelta: 3),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10, top: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                        height: 120,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: MediaQueryHelper.sizeFromWidth(context, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                "assets/images/item.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "أوه ماي تنت",
                                  style: AppTextStyles.boldtitles.apply(
                                      color: AppColors.blue, fontSizeDelta: 2),
                                ),
                                RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: "السعر :  ",
                                        style: AppTextStyles.boldtitles.apply(
                                            color: AppColors.primarycolor),
                                      ),
                                      TextSpan(
                                        text: "55 ر.س ",
                                        style: AppTextStyles.smTitles
                                            .apply(color: AppColors.green),
                                      ),
                                    ])),
                                RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: "الكمية :  ",
                                        style: AppTextStyles.boldtitles.apply(
                                            color: AppColors.primarycolor),
                                      ),
                                      TextSpan(
                                        text: "2",
                                        style: AppTextStyles.smTitles
                                            .apply(color: AppColors.green),
                                      ),
                                    ])),
                              ],
                            ),


                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "مبلغ اجمالى",
                                  style:
                                  AppTextStyles.boldtitles.apply(fontSizeDelta: 3),
                                ),
                                Text(
                                  "110 ر.س",
                                  style: AppTextStyles.boldtitles
                                      .apply(color: AppColors.blue, fontSizeDelta: 3),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: AppColors.greyDark,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "الشحن",
                                  style: AppTextStyles.boldtitles
                                      .apply(color: AppColors.green, fontSizeDelta: 3),
                                ),
                                Text(
                                  "110 ر.س",
                                  style: AppTextStyles.boldtitles
                                      .apply(color: AppColors.green, fontSizeDelta: 3),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: AppColors.greyDark,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "اجمالى المبلغ",
                                  style:
                                  AppTextStyles.boldtitles.apply(fontSizeDelta: 3),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "(4 عناصر)",
                                  style: AppTextStyles.boldtitles
                                      .apply(color: AppColors.blue, fontSizeDelta: -5),
                                ),
                                Spacer(),
                                Text(
                                  "110 ر.س",
                                  style: AppTextStyles.boldtitles
                                      .apply(color: AppColors.blue, fontSizeDelta: 3),
                                ),
                              ],
                            ),
                          ),
                          ButtonTemplate(
                            minwidth: MediaQueryHelper.sizeFromWidth(context, 1),
                            color: AppColors.primarycolor,
                            text1: "استمر فى الشراء",
                            onPressed: () {
                              navigateTo(context, DoneShoppingScreen());
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ]),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
