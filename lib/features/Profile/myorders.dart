import 'package:acnoria/features/cart/widget/profileappbar.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/images.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(context, txt: 'طلباتي'),
      body: Padding(
          padding: appPadding(),
          child: Column(
            children: [
              ContinerMyorder(context, () {}, true),
              ContinerMyorder(context, () {}, false),
            ],
          )

          // ListView.builder(
          //     itemBuilder: (context, index) {
          //       return ContinerMyorder(context, (){},true);
          //
          //       //   Container(
          //       //   margin: EdgeInsets.only(bottom: 10),
          //       //   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          //       //   height: MediaQueryHelper.sizeFromHeight(context, 4.5),
          //       //   decoration: BoxDecoration(
          //       //       color: AppColors.white,
          //       //       borderRadius: BorderRadius.circular(20)),
          //       //   child: Row(
          //       //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       //     children: [
          //       //       Image.asset(
          //       //         AppImages.rooge,
          //       //         width: MediaQueryHelper.sizeFromWidth(context, 4),
          //       //       ),
          //       //       Container(
          //       //         width: MediaQueryHelper.sizeFromWidth(context, 2),
          //       //         child: Column(
          //       //           crossAxisAlignment: CrossAxisAlignment.start,
          //       //           children: [
          //       //             Text(
          //       //               'أوه ماي تنت',
          //       //               style: AppTextStyles.lrTitles,
          //       //             ),
          //       //           ],
          //       //         ),
          //       //       ),
          //       //       Column(
          //       //         children: [],
          //       //       )
          //       //     ],
          //       //   ),
          //       // );
          //     },
          //     itemCount: 2),
          ),
    );
  }
}

Widget ContinerMyorder(context, onPressed, done) {
  return Container(
    margin: EdgeInsets.only(bottom: 10, top: 20),
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
    height: 150,
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
          height: 90,
          width: 90,
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
            RichText(
                text: TextSpan(
                    style: AppTextStyles.boldtitles
                        .copyWith(color: AppColors.primarycolor, fontSize: 17),
                    text: 'السعر:  ',
                    children: [
                  TextSpan(
                    text: '55 ر.س',
                    style: AppTextStyles.boldtitles
                        .copyWith(color: AppColors.greyDark, fontSize: 17),
                  )
                ])),
            RichText(
                text: TextSpan(
                    style: AppTextStyles.boldtitles
                        .copyWith(color: AppColors.primarycolor, fontSize: 17),
                    text: 'الكمية:  ',
                    children: [
                  TextSpan(
                    text: '2',
                    style: AppTextStyles.boldtitles
                        .copyWith(color: AppColors.greyDark, fontSize: 17),
                  )
                ])),
            RichText(
                text: TextSpan(
                    style: AppTextStyles.boldtitles
                        .copyWith(color: AppColors.primarycolor, fontSize: 17),
                    text: 'الحالة:  ',
                    children: [
                  done
                      ? TextSpan(
                          text: 'تم الأستلام',
                          style: AppTextStyles.boldtitles
                              .copyWith(color: Colors.green , fontSize: 17),
                        )
                      : TextSpan(
                          text: 'يتم تجهيزه للتحويل',
                          style: AppTextStyles.boldtitles
                              .copyWith(color: Colors.red, fontSize: 17),
                        )
                ])),
          ],
        ),
        // Spacer(),

        Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  onPressed();
                },
                icon: Image.asset(
                  AppImages.loading,
                  width: MediaQueryHelper.sizeFromWidth(context, 20),
                )))
      ],
    ),
  );
}
