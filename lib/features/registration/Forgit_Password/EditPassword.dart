import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPasswordScreen extends StatelessWidget {
  EditPasswordScreen({Key? key}) : super(key: key);
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

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
                "قم بأدخال كلمة المرور الجديده",
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: -2.sp),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 30.h),
                child: TextFieldTemplate(
                    hintText: "كلمة المرور",
                    isPassword: true,
                    controller: passwordController),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:0),
                child: TextFieldTemplate(
                    hintText: "تأكيد كلمة المرور",
                    isPassword: true,
                    controller: passwordController2),
              ),

              SizedBox(
                height: 30.h,
              ),

              ButtonTemplate(
                  color: AppColors.primarycolor,
                  text1: "اعاده كلمة المرور",
                  minwidth: double.infinity,
                  onPressed: () {
                    // navigateTo(context, EditPassword());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
