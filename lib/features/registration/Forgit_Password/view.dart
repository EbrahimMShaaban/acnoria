import 'package:acnoria/features/registration/Forgit_Password/EditPassword.dart';
import 'package:acnoria/features/registration/pin/view.dart';
import 'package:acnoria/features/registration/sign%20up/view.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgitPasswordScreen extends StatelessWidget {
  ForgitPasswordScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: appPadding(),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100, bottom: 50),
                child: Image.asset(
                  "assets/images/forget.png",
                  width: 150,
                  height: 150,
                ),
              ),
              // SizedBox(height: 35,),
              Text(
                "ادخل رقم الهاتف لاستعادة كلمة المرور",
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: -2.sp),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: TextFieldTemplate(
                    hintText: "رقم الهاتف او البريد الالكتروني",
                    controller: emailController),
              ),

              ButtonTemplate(
                  color: AppColors.primarycolor,
                  text1: "التالى",
                  minwidth: double.infinity,
                  onPressed: () {
                    navigateTo(context, EditPasswordScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
