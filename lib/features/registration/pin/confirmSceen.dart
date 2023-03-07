
import 'dart:async';

import 'package:acnoria/controller/layout/state.dart';
import 'package:acnoria/features/layout/view.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/images.dart';
class ConfirmSceen extends StatefulWidget {
  const ConfirmSceen({Key? key}) : super(key: key);

  @override
  State<ConfirmSceen> createState() => _ConfirmSceenState();
}

class _ConfirmSceenState extends State<ConfirmSceen> {
  @override
  void initState() {
    // TODO: implement initState


    super.initState();
    Timer(Duration(seconds: 2), (){
      return navigateAndFinished(context, AppLayout());
    });

  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: AppColors.white,

      body: Container(
        height: MediaQuery.of(context).size.height ,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.confirmsceen,height: 200,),
              Text("تم التأكد من الرمز بنجاح ",style: AppTextStyles.boldtitles,)
            ],
          ),
        ),
      ),
    );
  }
}
