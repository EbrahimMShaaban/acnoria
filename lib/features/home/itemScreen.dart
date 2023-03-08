import 'package:acnoria/features/cart/view.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/images.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  int count = 1;
  bool favoriteIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            AppImages.basket,
            height: MediaQueryHelper.sizeFromHeight(context, 22),
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
      body: Column(
        children: [
          Expanded(

            flex: 1,            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // color: Colors.yellowAccent,
                    height: MediaQueryHelper.sizeFromHeight(context,3),
                    // width: MediaQueryHelper.sizeFromWidth(context, 2),
                    child: Image.asset(
                      "assets/images/item.png",
                      fit: BoxFit.fill,
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: MediaQueryHelper.sizeFromHeight(context,10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0))),
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 30),
              // margin: EdgeInsets.only(
              //   top: MediaQueryHelper.sizeFromHeight(context, 2.5),
              // ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "أوه ماي تنت مرطب شفاه وملمع ",
                          style: AppTextStyles.boldtitles,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              favoriteIcon = !favoriteIcon;
                            });
                          },
                          icon: favoriteIcon == true
                              ? Icon(
                            Icons.favorite,
                            size: 30,
                            color: AppColors.primarycolor,
                          )
                              : Icon(
                            Icons.favorite_border,
                            size: 30,
                            color: AppColors.primarycolor,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "– وردي – 4 غ",
                      style: AppTextStyles.boldtitles
                          .copyWith(color: AppColors.blueDark, fontSize: 15),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى ",
                      style: AppTextStyles.smTitles.apply(
                          color: AppColors.greyDark, fontSizeDelta: -5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "55 ر.س ",
                          style: AppTextStyles.boldtitles
                              .apply(color: AppColors.blue, fontSizeDelta: 5),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "75 ر.س ",
                          style: AppTextStyles.boldtitles.apply(
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.green,
                              fontSizeDelta: -2),
                        ),
                        Spacer(),
                        Container(
                          margin: const EdgeInsets.only(top: 30.0),
                          // padding: const EdgeInsets.all(10.0),
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: AppColors.blue, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0) //         <--- border radius here
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                icon: Icon(Icons.add),
                              ),
                              Text(
                                "${count}",
                                style: AppTextStyles.boldtitles,
                              ),
                              IconButton(
                                onPressed: () {
                                  if (count > 1)
                                    setState(() {
                                      count--;
                                    });
                                },
                                icon: Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ButtonTemplate(
                          icon: Icons.add_circle_outline_rounded,
                          color: AppColors.primarycolor,
                          text1: " اضف الى السلة",
                          onPressed: () {
                            navigateTo(context, CartScreen());
                          }),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

/*
import 'package:acnoria/features/cart/view.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/images.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  int count = 1;
  bool favoriteIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            AppImages.basket,
            height: MediaQueryHelper.sizeFromHeight(context, 22),
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
      body: Column(
        children: [
          SingleChildScrollView(
              child: Column(
                  children: [
                    Container(
                      height: MediaQueryHelper.sizeFromHeight(context, 2.9),
                      child: Image.asset(
                        "assets/images/item.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ])),
          Expanded(
            child: Container(
              height: MediaQueryHelper.sizeFromHeight(context, 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0))),
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 30),
              // margin: EdgeInsets.only(
              //   top: MediaQueryHelper.sizeFromHeight(context, 2.5),
              // ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "أوه ماي تنت مرطب شفاه وملمع ",
                          style: AppTextStyles.boldtitles,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              favoriteIcon = !favoriteIcon;
                            });
                          },
                          icon: favoriteIcon == true
                              ? Icon(
                            Icons.favorite,
                            size: 30,
                            color: AppColors.primarycolor,
                          )
                              : Icon(
                            Icons.favorite_border,
                            size: 30,
                            color: AppColors.primarycolor,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "– وردي – 4 غ",
                      style: AppTextStyles.boldtitles
                          .copyWith(color: AppColors.blueDark, fontSize: 15),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى ",
                      style: AppTextStyles.smTitles
                          .apply(color: AppColors.greyDark, fontSizeDelta: -5),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "55 ر.س ",
                            style: AppTextStyles.boldtitles
                                .apply(color: AppColors.blue, fontSizeDelta: 5),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "75 ر.س ",
                            style: AppTextStyles.boldtitles.apply(
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.green,
                                fontSizeDelta: -2),
                          ),
                          Spacer(),
                          Container(
                            margin: const EdgeInsets.only(top: 30.0),
                            // padding: const EdgeInsets.all(10.0),
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              border:
                              Border.all(color: AppColors.blue, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  10.0) //         <--- border radius here
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                ),
                                Text(
                                  "${count}",
                                  style: AppTextStyles.boldtitles,
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (count > 1)
                                      setState(() {
                                        count--;
                                      });
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: ButtonTemplate(
                                minwidth: double.infinity,
                                icon: Icons.add_circle_outline_rounded,
                                color: AppColors.primarycolor,
                                text1: " اضف الى السلة",
                                onPressed: () {
                                  navigateTo(context, CartScreen());
                                }),
                          ),
                        ]),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
*/