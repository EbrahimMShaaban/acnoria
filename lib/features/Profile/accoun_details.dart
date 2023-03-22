import 'package:acnoria/features/Profile/view.dart';
import 'package:acnoria/features/cart/widget/profileappbar.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/registermodel.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
import '../location/addNew_location.dart';
import 'cubit/profil_cubit.dart';

class AccountDetails extends StatefulWidget {
  final RegisterModrl? profilmodel;

  AccountDetails({Key? key, required this.profilmodel}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  TextEditingController firstnameControlle = TextEditingController();
  TextEditingController lastnameControlle = TextEditingController();

  TextEditingController phoencontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  @override
  void initState() {
    String? _firstnameControlle = widget.profilmodel?.data?.firstName;
    firstnameControlle = TextEditingController(text: _firstnameControlle);
    String? _lastnameControlle = widget.profilmodel?.data?.lastName;
    lastnameControlle = TextEditingController(text: _lastnameControlle);

    String? _emailcontroller = widget.profilmodel?.data?.email;
    String? _phoencontroller = widget.profilmodel?.data?.phone;
    phoencontroller = TextEditingController(text: _phoencontroller);
    emailcontroller = TextEditingController(text: _emailcontroller);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilCubit(),
      child: BlocConsumer<ProfilCubit, ProfilState>(
        listener: (context, state) {
          if (state is EditProfilSuccessState) {
            navigateTo(context, ProfileScreen());
          } // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: ProfileAppBar(context, txt: 'معلومات الحساب',navTo:  (){
              navigateTo(context, ProfileScreen());
            }),
            body: SingleChildScrollView(
              child: Padding(
                padding: appPadding(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (state is EditProfilLoadingtState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Addlocation(
                      controller: firstnameControlle,
                      // hintText:"امنية نهاد سعد" ,
                      text: "الاسم الأول",
                    ),   Addlocation(
                      controller: lastnameControlle,
                      // hintText:"امنية نهاد سعد" ,
                      text: "الاسم الثاني",
                    ),
                    // Addlocation(
                    //   controller: phoencontroller,
                    //   // hintText:  "+966 587 596",
                    //   text: "رقم الهاتف",
                    // ),
                    Addlocation(
                      controller: emailcontroller,
                      // hintText: "omnia74@gmail.com",
                      text: "البريد الالكتروني",
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ButtonTemplate(
                          color: AppColors.primarycolor,
                          text1: "تعديل الملف الشخصي",
                          onPressed: () {
                            ProfilCubit.get(context).EditProfil(
                                email: emailcontroller.text,
                                first_name: firstnameControlle.text,
                                last_name: lastnameControlle.text);
                          }),
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
