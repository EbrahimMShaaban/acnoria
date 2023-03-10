import 'package:acnoria/features/registration/login/view.dart';
import 'package:acnoria/features/registration/pin/view.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController phonController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: appPadding(),
          child: ListView(
            children: [ SizedBox(height: 20,),
              Image.asset(
                "assets/images/logo.png",
                height: 65,
                width: 100,
              ),
              SizedBox(height: 35,),
              Text(
                "انشئ حسابك الان فى اكنوريا\n لمتابعه ما هو جديد",
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: 3),
              ),
              TextFieldTemplate(
                  hintText: "الاسم",
                  controller: nameController),
              TextFieldTemplate(
                  hintText: "رقم الهاتف او البريد الالكتروني",
                  controller: emailController),
              TextFieldTemplate(
                  hintText: "رقم الهاتف",
                  controller: phonController),
              TextFieldTemplate(
                  hintText: "كلمة المرور", controller: passwordController),    TextFieldTemplate(
                  hintText: "تأكيد كلمة المرور", controller: password2Controller),
              SizedBox(
                height: 20,
              ),

              ButtonTemplate(
                  color: AppColors.primarycolor,
                  text1: "تسجيل الدخول",
                  minwidth: double.infinity,
                  onPressed: () {
                    navigateTo(context, PinScreen());
                  }),
               Padding(
                padding: EdgeInsets.only(top: 36.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "بفعل لديك حساب؟",
                      style: AppTextStyles.boldtitles,
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, LoginScreen());
                      },
                      child: Text(
                        " تسجيل الان",
                        style: AppTextStyles.smTitles,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
