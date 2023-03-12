import 'package:acnoria/controller/SignUp_cubit/States.dart';
import 'package:acnoria/controller/SignUp_cubit/cubit.dart';
import 'package:acnoria/features/registration/login/view.dart';
import 'package:acnoria/features/registration/pin/view.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController firstnameControlle = TextEditingController();
  TextEditingController lastnameControlle = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phonController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          print(state);

          if (state is RegisterSuccessState) {
            navigateTo(context, PinScreen());
          }

          // TODO: implement listener
        },
        builder: (context, state) {
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
                      height: 35.h,
                    ),
                    Text(
                      "انشئ حسابك الان فى اكنوريا\n لمتابعه ما هو جديد",
                      style:
                          AppTextStyles.boldtitles.apply(fontSizeDelta: -1.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: TextFieldTemplate(
                          hintText: "الاسم", controller: nameController!),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextFieldTemplate(
                          hintText: "البريد الالكتروني",
                          controller: emailController!),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 15),
                    //   child: TextFieldTemplate(
                    //       hintText: "رقم الهاتف", controller: phonController!),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextFieldTemplate(
                          isPassword: true,
                          hintText: "كلمة المرور",
                          controller: passwordController!),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextFieldTemplate(
                          isPassword: true,
                          hintText: "تأكيد كلمة المرور",
                          controller: password2Controller!),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    state is! RegisterLoadingtState?ButtonTemplate(
                color: AppColors.primarycolor,
                text1: "تسجيل الدخول",
                minwidth: double.infinity,
                onPressed: () {
                  RegisterCubit.get(context)?.userRegister(
                      first_name: nameController.text,
                      last_name: nameController.text,
                      // first_name: firstnameControlle.text,
                      // last_name: lastnameControlle.text,
                      email: emailController.text,
                      password_confirmation: password2Controller.text,
                      password: passwordController.text);
                },
              ):Center(
                      child: CircularProgressIndicator(),
                    ),
                    // ConditionalBuilder(
                    //   condition: ,
                    //   builder: (context) =>
                    //   fallback: (context) => const
                    // ),
                    Padding(
                      padding: EdgeInsets.only(top: 36.0, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "بالفعل لديك حساب؟",
                            style: AppTextStyles.boldtitles
                                .apply(fontSizeDelta: -4.sp),
                          ),
                          InkWell(
                            onTap: () {
                              navigateTo(context, LoginScreen());
                            },
                            child: Text(
                              " تسجيل الان",
                              style: AppTextStyles.smTitles.apply(
                                  decoration: TextDecoration.underline,
                                  fontSizeDelta: -4.sp,
                                  color: AppColors.blue),
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
        },
      ),
    );
  }
}
