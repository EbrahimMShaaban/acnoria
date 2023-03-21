import 'package:acnoria/features/cart/widget/ContainerMyOrder.dart';
import 'package:acnoria/features/cart/widget/Price.dart';
import 'package:acnoria/features/layout/view.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/cart_details_model.dart';
import '../../shared/components/navigator.dart';

class DoneShoppingScreen extends StatefulWidget {
  const DoneShoppingScreen({Key? key, required this.cartDetailsModel}) : super(key: key);
  final CartDetailsModel cartDetailsModel;

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
                        style: AppTextStyles.boldtitles.copyWith(fontSize: 18),
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
                        style: AppTextStyles.boldtitles.copyWith(fontSize: 20),
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
                                      fontSizeDelta: 0),
                                ),
                              ],
                            ),
                            Text(
                              "85 صاري, الخالدية 506 جدة, 23\n423 - 8949",
                              style: AppTextStyles.boldtitles.apply(
                                  color: AppColors.greyDark, fontSizeDelta: -5),
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
                                      fontSizeDelta: 0),
                                ),
                              ],
                            ),
                            Text(
                              "96655245+",
                              style: AppTextStyles.boldtitles.apply(
                                  color: AppColors.greyDark, fontSizeDelta: -5),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "المنتجات",
                        style: AppTextStyles.boldtitles.copyWith(fontSize: 20),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.cartDetailsModel.data!.items!.length,
                        itemBuilder: (context, index) {
                          return ContainerMyOrder(
                              cartDetailsModel: widget.cartDetailsModel,
                              index: index);
                        },
                      ),
                      Column(
                        children: [
                          Price(
                            allPrice:
                            "${widget.cartDetailsModel.data!.formatedBaseSubTotal}",
                            totalPrice:
                            "${widget.cartDetailsModel.data!.formatedBaseDiscountedSubTotal}",
                            priceRate:
                            "${widget.cartDetailsModel.data!.formatedBaseTaxTotal}",
                          ),
                          ButtonTemplate(
                            minwidth: MediaQueryHelper.sizeFromWidth(context, 1),
                            color: AppColors.primarycolor,
                            text1: "استمر فى الشراء",
                            onPressed: () {
                              navigateTo(context, AppLayout());
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
