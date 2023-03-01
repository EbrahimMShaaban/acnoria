import 'package:acnoria/features/layout/view.dart';
import 'package:acnoria/features/registration/Forgit_Password/view.dart';
import 'package:acnoria/features/registration/pin/view.dart';
import 'package:acnoria/features/registration/sign%20up/view.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: appPadding(),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/logo.png",
                height: 65,
                width: 100,
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "سجل الدخول الان لتري ما\n هو جديد",
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: 3),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: TextFieldTemplate(
                    hintText: "رقم الهاتف او البريد الالكتروني",
                    controller: emailController),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: TextFieldTemplate(
                    isPassword: true,
                    hintText: "كلمة المرور",
                    controller: passwordController),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: () {
                    navigateTo(context, ForgitPasswordScreen());
                  },
                  child: Text(
                    "هل نسيت كلمة المرور؟",
                    style: AppTextStyles.boldtitles
                        .apply(fontSizeDelta: -5, color: AppColors.green),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ButtonTemplate(
                  color: AppColors.primarycolor,
                  text1: "تسجيل الدخول",
                  minwidth: double.infinity,
                  onPressed: () {
                    navigateTo(context, PinScreen());
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ليس لديك حساب؟",
                      style: AppTextStyles.boldtitles,
                    ),
                    InkWell(
                      onTap: () => navigateTo(context, SignUpScreen()),
                      child: Text(
                        " انشئ حساب الان",
                        style: AppTextStyles.smTitles.apply(
                          decoration: TextDecoration.underline,
                          fontSizeDelta: -2,
                        ),
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
