import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';

class AddNewLocation extends StatelessWidget {
  AddNewLocation({Key? key}) : super(key: key);
  @override
  TextEditingController? controller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5F5F5),
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(right: 36.0),
          child: Text("اضافة عنوان جديد",
              style: AppTextStyles.boldtitles
                  .apply(color: AppColors.blueDark, fontSizeFactor: 1.5)),
        ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: appPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "اختر العنوان",
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: 2),
              ),
              SizedBox(
                height: 20,
              ),
              Addlocation(
                controller: controller,
                hintText: "المنطقة",
                text: "المنطقة",
              ),
              Addlocation(
                controller: controller,
                hintText: "سارع صلاح الدين",
                text: "اسم الشارع",
              ),
              Addlocation(
                controller: controller,
                hintText: "مكتب",
                text: "نوع البناية",
              ),
              Addlocation(
                controller: controller,
                hintText: "اسم البناية او الرقم",
                text: "اسم البناية او الرقم",
              ),
              Addlocation(
                controller: controller,
                hintText: "رقم الطابق",
                text: "رقم الطابق",
              ),
              Addlocation(
                controller: controller,
                hintText: "علاقمة مميزه للمنزل او المكتب",
                text: "علاقمة مميزه للمنزل او المكتب",
              ),
              Addlocation(
                controller: controller,
                hintText: "رقم الهاتف",
                text: "رقم الهاتف",
              ),
              ButtonTemplate(
                  color: AppColors.primarycolor,
                  text1: "حفظ العنوان",
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class Addlocation extends StatelessWidget {
  Addlocation({Key? key, this.controller, this.text, this.hintText})
      : super(key: key);
  final TextEditingController? controller;
  final String? text;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text!,
            style: AppTextStyles.lrTitles
                .apply(fontSizeDelta: -5, color: AppColors.blue),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              controller: controller,
              style: AppTextStyles.boldtitles.apply(
                color: AppColors.blueDark,
              ),
              // validator: (value) => validator!(value),
              decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: AppColors.white,

                  hintStyle: AppTextStyles.boldtitles.apply(
                    color: AppColors.blue,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(15))))),
        ],
      ),
    );
  }
}
