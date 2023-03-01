import 'package:acnoria/features/Favourite/FavoriteScreen.dart';
import 'package:acnoria/features/Home/widgets/category_box.dart';
import 'package:acnoria/features/Profile/common_questions.dart';
import 'package:acnoria/features/Profile/myorders.dart';
import 'package:acnoria/features/Profile/payment_methods.dart';
import 'package:acnoria/features/Profile/privacy.dart';
import 'package:acnoria/features/Profile/us_information.dart';
import 'package:acnoria/features/cart/chandeLocation.dart';
import 'package:acnoria/features/registration/Forgit_Password/EditPassword.dart';
import 'package:acnoria/features/registration/login/view.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';
import '../../shared/components/navigator.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/images.dart';
import 'accoun_details.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  late bool switchbutton = true;

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: appPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "مرحبا امنية",
                    style: AppTextStyles.boldtitles.apply(fontSizeDelta: 10),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_basket_outlined,
                        size: 30,
                      ))
                ],
              ),
              Text(
                "omnia74@gmail.com",
                style: AppTextStyles.boldtitles
                    .apply(color: AppColors.blue, fontSizeDelta: -4),
              ),
              SizedBox(
                height: MediaQueryHelper.sizeFromHeight(context, 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => navigateTo(context, MyOrder()),
                    child: CategoryBox(
                      color: Color(0xffEEF7FE),
                      imgPath: AppImages.booking,
                      txt: 'طلباتي',
                    ),
                  ),
                  InkWell(
                    onTap: () => navigateTo(context, ChangeLocationScreens()),
                    child: CategoryBox(
                      color: Color(0xffEFF8ED),
                      imgPath: "assets/images/map.png",
                      txt: 'العناوين',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigateTo(context, PaymentMethodsScreens());
                    },
                    child: CategoryBox(
                      color: Color(0xffFCEEEA),
                      imgPath: "assets/images/pay.png",
                      txt: 'طرق الدفع',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigateTo(context, FavoriteScreen());
                    },
                    child: CategoryBox(
                      color: Color(0xff0D4A90E2),
                      imgPath: "assets/images/fovert.png",
                      txt: 'المفضلة',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "معلومات الحساب",
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: 5),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQueryHelper.sizeFromWidth(context, 1),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => navigateTo(context, AccountDetails()),
                      child: Containedata(
                          widget: Icon(Icons.arrow_back_ios),
                          text: "معلومات الحساب",
                          icon: Icons.person_2_outlined),
                    ),
                    InkWell(
                      onTap: () => navigateTo(context, EditPasswordScreen()),
                      child: Containedata(
                          widget: Icon(Icons.arrow_back_ios),
                          text: "تغير كلمة المرور",
                          icon: Icons.lock_open_rounded),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "الاعدادات",
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: 5),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQueryHelper.sizeFromWidth(context, 1),
                child: Column(
                  children: [
                    Containedata(
                        widget: Switch(
                          value: switchbutton,
                          onChanged: (value) {
                            setState(() {
                              switchbutton = !switchbutton;
                            });
                          },
                          activeColor: AppColors.primarycolor,
                        ),
                        text: "الاشعارات",
                        icon: Icons.notifications_active_outlined),
                    Containedata(
                        widget: Text(
                          "العربية",
                          style: AppTextStyles.boldtitles
                              .apply(fontSizeDelta: 1, color: AppColors.green),
                        ),
                        text: "اللغه",
                        icon: Icons.language),
                    InkWell(
                      onTap: (){
                        navigateTo(context, UsInformation());
                      },
                      child: const Containedata(
                          widget: Icon(Icons.arrow_back_ios),
                          text: "معلومات عنا",
                          icon: Icons.circle),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, Privacy());
                      },
                      child: Containedata(
                          widget: Icon(Icons.arrow_back_ios),
                          text: "سياسية الخصوصية",
                          icon: Icons.cloud_circle_sharp),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, CommonQuestions());
                      },
                      child: Containedata(
                          widget: Icon(Icons.arrow_back_ios),
                          text: "المساعده و الدعم",
                          icon: Icons.lock_open_rounded),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => navigateAndFinished(context, LoginScreen()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "تسجيل الخروج",
                      style: AppTextStyles.boldtitles
                          .apply(color: Colors.red, fontSizeDelta: 10),
                    ),
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                      size: 35,
                    )
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

class Containedata extends StatelessWidget {
  final Widget widget;
  final String text;
  final IconData icon;

  const Containedata(
      {Key? key, required this.widget, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: AppTextStyles.boldtitles
                    .apply(fontSizeDelta: 1, color: AppColors.blue),
              ),
            ],
          ),
          Directionality(textDirection: TextDirection.ltr, child: widget)
        ],
      ),
    );
  }
}
