import 'dart:async';

import 'package:acnoria/features/Home/view.dart';
import 'package:acnoria/features/layout/view.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../shared/components/navigator.dart';
import '../login/view.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  late StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: appPadding(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 100, bottom: 50),
                      child: Image.asset(
                        "assets/images/pin.png",
                        width: 200,
                        height: 200,
                      )),
                  Text(
                    "الرجاء ادخال رمز التحق",
                    style: AppTextStyles.boldtitles.apply(fontSizeDelta: 1.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "تم ارسال الرمز الى +966 4558 545",
                    style: AppTextStyles.w600.apply(color: AppColors.blue),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 4,

                            obscureText: false,
                            obscuringCharacter: '*',
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v!.length < 3) {
                                return "I'm from validator";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(20),

                              fieldHeight: 70,
                              fieldWidth: 70,
                              activeColor: AppColors.Bluehint,
                              disabledColor: AppColors.Bluehint,
                              borderWidth: 1,

                              selectedFillColor: AppColors.primarycolor,
                              selectedColor: AppColors.Bluehint,
                              inactiveColor: AppColors.Bluehint,
                              inactiveFillColor: Colors.white,
                              // activeFillColor:
                              //     hasError ? Colors.orange : Colors.white,
                              activeFillColor: Colors.white,
                            ),

                            cursorColor: Colors.white,

                            animationDuration: Duration(milliseconds: 300),
                            textStyle: TextStyle(
                              fontSize: 20,
                              height: 1.6,
                              color: Colors.grey,
                            ),
                            // backgroundColor: Colors.Bluehint.shade50,
                            enableActiveFill: true,
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            // boxShadows: [
                            //   BoxShadow(
                            //     offset: Offset(0, 1),
                            //     color: Colors.black12,
                            //     blurRadius: 10,
                            //   )
                            // ],
                            onCompleted: (v) {
                              print("Completed");
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      hasError ? "*Please fill up all the cells properly" : "",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  ButtonTemplate(
                      color: AppColors.primarycolor,
                      text1: "تأكيد رمز التحقق",
                      minwidth: double.infinity,
                      onPressed: () {
                        navigateAndFinished(context, AppLayout());
                        // formKey.currentState?.validate();
                        // conditions for validating
                        // if (currentText.length != 6 ||
                        //     currentText != "towtow") {
                        //   errorController.add(ErrorAnimationType
                        //       .shake); // Triggering error shake animation
                        //   setState(() {
                        //     hasError = true;
                        //   });
                        // } else {
                        //   setState(() {
                        //     hasError = false;
                        //     // scaffoldKey.currentState!.showSnackBa(SnackBar(
                        //     //   content: Text("Aye!!"),
                        //     //   duration: Duration(seconds: 2),
                        //     // ));
                        //   });
                        // }
                      }),
                  Padding(
                    padding: EdgeInsets.only(top: 36.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "لم يصلك الرمز؟",
                          style: AppTextStyles.boldtitles
                              .apply(fontSizeDelta: -3.5.sp),
                        ),
                        InkWell(
                          onTap: () {
                            // navigateTo(context, LoginScreen());
                          },
                          child: Text(
                            " اعادة الارسال",
                            style: AppTextStyles.smTitles.apply(
                                decoration: TextDecoration.underline,
                                fontSizeDelta: -3.sp,
                                color: AppColors.blue),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
