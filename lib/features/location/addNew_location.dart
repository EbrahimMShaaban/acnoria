import 'package:acnoria/controller/Login_cubit/States.dart';
import 'package:acnoria/features/location/chandeLocation.dart';
import 'package:acnoria/features/location/cubit/Location_cubit.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';

class AddNewLocation extends StatelessWidget {
  AddNewLocation({Key? key}) : super(key: key);
  @override
  TextEditingController? cityController = TextEditingController();
  TextEditingController? Controller = TextEditingController();
  TextEditingController? countryController = TextEditingController();
  TextEditingController? country_nameController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? stateontroller = TextEditingController();

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: Scaffold(
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
            child: BlocConsumer<LocationCubit, LocationState>(
              listener: (context, state) {
                print(state);
                if (state is PostLocationSuccessState )navigateTo(context, ChangeLocationScreens());
                // TODO: implement listener
              },
              builder: (context, state) {
                return Column(
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
                    Image.asset("assets/images/img_4.png"),
                    SizedBox(
                      height: 20,
                    ),
                    Addlocation(
                      controller: cityController,
                      hintText: "المنطقة",
                      text: "المنطقة",
                    ),
                    Addlocation(
                      controller: stateontroller,
                      hintText: "سارع صلاح الدين",
                      text: "اسم الشارع",
                    ),
                    Addlocation(
                      controller: countryController,
                      hintText: "مكتب",
                      text: "نوع البناية",
                    ),
                    Addlocation(
                      controller: country_nameController,
                      hintText: "اسم البناية او الرقم",
                      text: "اسم البناية او الرقم",
                    ),
                    Addlocation(
                      controller: Controller,
                      hintText: "رقم الطابق",
                      text: "رقم الطابق",
                    ),
                    Addlocation(
                      controller: Controller,
                      hintText: "علاقمة مميزه للمنزل او المكتب",
                      text: "علاقمة مميزه للمنزل او المكتب",
                    ),
                    Addlocation(
                      controller: phoneController,
                      hintText: "رقم الهاتف",
                      text: "رقم الهاتف",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    state is PostLocationLoadingtState
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ButtonTemplate(
                            color: AppColors.primarycolor,
                            text1: "حفظ العنوان",
                            onPressed: () {
                              LocationCubit.get(context).PostLocation(
                                  city: cityController!.text,
                                  country: countryController!.text,
                                  country_name: country_nameController!.text,
                                  phone: phoneController?.text,
                                  state: stateontroller!.text);
                            })
                  ],
                );
              },
            ),
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
            style: AppTextStyles.boldtitles
                .apply(fontSizeDelta: -3, color: AppColors.Bluehint),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              controller: controller,
              style: AppTextStyles.boldtitles
                  .apply(color: AppColors.blueDark, fontSizeDelta: -5),
              // validator: (value) => validator!(value),
              decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: AppColors.white,
                  hintStyle: AppTextStyles.boldtitles
                      .apply(color: AppColors.blue, fontSizeDelta: -5),
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
