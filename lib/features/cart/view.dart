import 'package:acnoria/features/cart/payment.dart';
import 'package:acnoria/features/cart/widget/ContinerMyCart.dart';
import 'package:acnoria/features/cart/widget/Price.dart';
import 'package:acnoria/features/cart/widget/profileappbar.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 1;
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(context, txt: 'السلة'),
      body: SingleChildScrollView(
        child: Padding(
          padding: appPadding(),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ContinerMyCart(context, add: () {
                    setState(() {
                      count++;
                    });
                  }, remove: () {
                    if (count > 1)
                      setState(() {
                        count--;
                      });
                  }, count: count);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 40),
                child: TextField(
                  style: AppTextStyles.lrTitles
                      .apply(color: AppColors.primarycolor),
                  decoration: InputDecoration(
                    hintText: "كود الخصم",
                    hintStyle: AppTextStyles.textsmbold
                        .copyWith(height: 0, fontWeight: FontWeight.w500),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primarycolor),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: Container(
                      margin: EdgeInsets.all(9),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 50),
                          primary: AppColors.primarycolor,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                        ),
                        child: Text(
                          "تطبيق",
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              Price(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ButtonTemplate(
                    minwidth: MediaQueryHelper.sizeFromWidth(context,2.6),
                    color: AppColors.primarycolor,
                    text1: "شراء الان",
                    onPressed: () {
                      navigateTo(context, paymentScreen());
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 36),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQueryHelper.sizeFromWidth(context, 2.8),
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blue, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10.0) //         <--- border radius here
                              ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text("اضافة منتجات",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.textsmbold.copyWith(
                                    height: 1,
                                    color: AppColors.blue,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
