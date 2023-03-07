import 'package:acnoria/features/cart/widget/profileappbar.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
import '../cart/addNew_location.dart';
class AccountDetails extends StatelessWidget {
   AccountDetails({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(context, txt: 'معلومات الحساب'),
      body: SingleChildScrollView(
        child: Padding(
          padding: appPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(
                height: 20,
              ),
              Addlocation(
                controller: controller,
                hintText:"امنية نهاد سعد" ,
                text: "الاسم بالكامل",
              ),
              Addlocation(
                controller: controller,
                hintText:  "+966 587 596",
                text:"رقم الهاتف",
              ),
              Addlocation(
                controller: controller,
                hintText: "omnia74@gmail.com",
                text: "البريد الالكتروني",
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ButtonTemplate(
                    color: AppColors.primarycolor,
                    text1: "تعديل الملف الشخصي",
                    onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
