import 'package:acnoria/features/Favourite/FavoriteScreen.dart';
import 'package:acnoria/features/Home/widgets/category_box.dart';
import 'package:acnoria/features/Profile/common_questions.dart';
import 'package:acnoria/features/Profile/myorders.dart';
import 'package:acnoria/features/Profile/payment_methods.dart';
import 'package:acnoria/features/Profile/privacy.dart';
import 'package:acnoria/features/Profile/us_information.dart';
import 'package:acnoria/features/cart/view.dart';
import 'package:acnoria/features/location/chandeLocation.dart';
import 'package:acnoria/features/registration/Forgit_Password/EditPassword.dart';
import 'package:acnoria/features/registration/login/view.dart';
import 'package:acnoria/shared/network/remote/end_points.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/registermodel.dart';
import '../../shared/components/constants.dart';
import '../../shared/components/navigator.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/images.dart';
import 'accoun_details.dart';
import 'cubit/profil_cubit.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  late bool switchbutton = true;

  Widget build(BuildContext context) {
    print(token);
    return BlocProvider(
      create: (context) => ProfilCubit()
        ..getProfil()
        ,
      child: BlocConsumer<ProfilCubit, ProfilState>(
        listener: (context, state) {
          // TODO: implement
          print(state);
        },
        builder: (context, state) {
          RegisterModrl? profilmodel = ProfilCubit.get(context).myProfil;
          return state is ProfilLoadingtState
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: appPadding(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "مرحبا" " " "${profilmodel!.data!.firstName}",
                                style: AppTextStyles.boldtitles
                                    .copyWith(fontSize: 22),
                              ),
                              IconButton(
                                onPressed: () {
                                  navigateTo(context, CartScreen());
                                },
                                icon: Image.asset(
                                  height: 25,
                                  AppImages.basket,
                                  color: AppColors.primarycolor,
                                ),
                              )
                            ],
                          ),
                          Text(
                            "${profilmodel!.data!.email}",
                            style: AppTextStyles.boldtitles.apply(
                                color: AppColors.blue, fontSizeDelta: -4),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => navigateTo(context, MyOrder()),
                                child: CategoryBox(
                                  color: Color(0xff0D4A90E2),
                                  imgPath: AppImages.booking,
                                  txt: 'طلباتي',
                                ),
                              ),
                              InkWell(
                                onTap: () => navigateTo(
                                    context, ChangeLocationScreens()),
                                child: CategoryBox(
                                  color: Color(0xff0D4A90E1),
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
                                  color: Color(0xffEEF7FE),
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
                            style: AppTextStyles.boldtitles
                                .apply(fontSizeDelta: 0),
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
                                  onTap: () => navigateTo(
                                      context,
                                      AccountDetails(
                                        profilmodel: profilmodel,
                                      )),
                                  child: Containedata(
                                      widget:
                                          Icon(Icons.arrow_back_ios, size: 19),
                                      text: "معلومات الحساب",
                                      icon: Icons.person_2_outlined),
                                ),
                                InkWell(
                                  onTap: () =>
                                      navigateTo(context, EditPasswordScreen()),
                                  child: Containedata(
                                      widget:
                                          Icon(Icons.arrow_back_ios, size: 19),
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
                            style: AppTextStyles.boldtitles
                                .apply(fontSizeDelta: 0),
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
                                      style: AppTextStyles.boldtitles.apply(
                                          fontSizeDelta: 0,
                                          color: AppColors.green),
                                    ),
                                    text: "اللغه",
                                    icon: Icons.language),
                                InkWell(
                                  onTap: () {
                                    navigateTo(context, UsInformation());
                                  },
                                  child: const Containedata(
                                      widget:
                                          Icon(Icons.arrow_back_ios, size: 19),
                                      text: "معلومات عنا",
                                      icon: Icons.info_outline),
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateTo(context, Privacy());
                                  },
                                  child: Containedata(
                                      widget:
                                          Icon(Icons.arrow_back_ios, size: 19),
                                      text: "سياسية الخصوصية",
                                      icon: Icons.info_outline),
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateTo(context, CommonQuestions());
                                  },
                                  child: Containedata(
                                      widget:
                                          Icon(Icons.arrow_back_ios, size: 19),
                                      text: "المساعده و الدعم",
                                      icon: Icons.question_mark_outlined),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () => signout(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "تسجيل الخروج",
                                  style: AppTextStyles.boldtitles.apply(
                                      color: Colors.red, fontSizeDelta: 5),
                                ),
                                Icon(
                                  Icons.exit_to_app,
                                  color: Colors.red,
                                  size: 25,
                                )
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
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 22,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: AppTextStyles.boldtitles
                    .apply(fontSizeDelta: -3, color: AppColors.blue),
              ),
            ],
          ),
          Directionality(textDirection: TextDirection.ltr, child: widget)
        ],
      ),
    );
  }
}
