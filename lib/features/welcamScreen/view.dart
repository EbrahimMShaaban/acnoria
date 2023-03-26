import 'package:acnoria/features/registration/login/view.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/network/local/shared_preferences.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/components/components.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/img_2.png',
      title: 'Plant Growing',
      body:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،  أن زيادة عدد الحروف التى يولدها التطبيق.",
    ),
    BoardingModel(
      image: 'assets/images/img_1.png',
      title: 'Plant Growing',
      body:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،  أن زيادة عدد الحروف التى يولدها التطبيق.",
    ),
    BoardingModel(
      image: 'assets/images/img.png',
      title: 'Plant Growing',
      body:
          "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،  أن زيادة عدد الحروف التى يولدها التطبيق.",
    ),
  ];

  bool isLast = false;
  IconData nextIcon = Icons.arrow_forward;
  var boardController = PageController();

  void finishOnBoarding() {
    // navigateAndFinished(context, LoginScreen());
    CacheHelper.saveData(key: 'OnBoarding', value: true).then((value) {
      navigateAndFinished(context, LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.white,
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (int index) {
                      if (index == 2) {
                        setState(() {
                          isLast = true;
                          nextIcon = Icons.done;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                          nextIcon = Icons.arrow_forward;
                        });
                      }
                    },
                    controller: boardController,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTemplate(
                        color: AppColors.primarycolor,
                        text1: "التالى",
                        // minwidth: MediaQueryHelper.sizeFromWidth(context, 1.2),
                        onPressed: () {
                          if (isLast) {
                            finishOnBoarding();
                          } else {
                            boardController.nextPage(
                                duration: Duration(
                                  milliseconds: 750,
                                ),
                                curve: Curves.fastOutSlowIn);
                          }
                        },
                      ),
                      isLast
                          ? SizedBox(
                              height: 50.h,
                            )
                          : TextButton(
                              onPressed: () {
                                finishOnBoarding();
                              },
                              child: Text("تخطي",

                                  style: AppTextStyles.boldtitles.copyWith(
                                      color: AppColors.green,
                                      decoration: TextDecoration.underline)),
                            ),
                    ]),
              ],
            ),
          )),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              width: MediaQueryHelper.sizeFromWidth(context, 1.3),
              image: AssetImage(
                '${model.image}',
              ),
            ),
          ),
          Text(
            '${model.body}',
            textAlign: TextAlign.center,

            style:
            AppTextStyles.boldtitles.apply(
                color: AppColors.primarycolor, fontSizeDelta:-3.sp),
          ),
          SizedBox(
            height: 14.0,
          ),
        ],
      );
}
