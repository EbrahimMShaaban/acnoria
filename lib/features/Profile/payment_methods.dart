import 'package:acnoria/features/cart/addNew_location.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class PaymentMethodsScreens extends StatefulWidget {
  const PaymentMethodsScreens({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsScreens> createState() => _PaymentMethodsScreensState();
}

class _PaymentMethodsScreensState extends State<PaymentMethodsScreens> {
  List<ContainerLocationModel>? ContaineList = [];

  @override
  void initState() {
    // TODO: implement initState

    ContaineList?.add(
      ContainerLocationModel(
          title: "اسم  صاحب البطاقة",
          location: " تاريخ الانتهاء : 2/2023",
          isSelected: false),
    );
       ContaineList?.add(
      ContainerLocationModel(
          title: "اسم  صاحب البطاقة",
          location: " تاريخ الانتهاء : 2/2023",
          isSelected: false),
    );


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5F5F5),
        leadingWidth: 300,
        leading: Padding(
          padding: const EdgeInsets.only(right: 36.0),
          child: Text("بطاقات الدفع المسجلة",
              style: AppTextStyles.boldtitles
                  .apply(color: AppColors.blueDark, fontSizeFactor:1.4)),
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
              SizedBox(
                height: 30,
              ),

              ListView.builder(
                shrinkWrap: true,
                physics:NeverScrollableScrollPhysics() ,
                itemCount: ContaineList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          ContaineList?.forEach(
                                  (gender) => gender.isSelected = false);
                          ContaineList![index].isSelected = true;
                        });
                      },
                      child: ContainerLocation(
                          containerLocationModel: ContaineList![index]));
                },
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonTemplate(
                  minwidth: MediaQueryHelper.sizeFromWidth(context, 1),
                  icon: Icons.add_circle_outline_rounded,
                  color: AppColors.primarycolor,
                  text1: "أضافة عنوان جديد",
                  onPressed: () {
                    navigateTo(context, AddNewLocation());
                  },),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerLocationModel {
  final String title;
  final String location;
  bool isSelected;

  ContainerLocationModel({
    required this.title,
    required this.location,
    required this.isSelected,
  });
}

class ContainerLocation extends StatelessWidget {
  const ContainerLocation({Key? key, required this.containerLocationModel})
      : super(key: key);
  final ContainerLocationModel containerLocationModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 100,
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
            color: containerLocationModel.isSelected
                ? AppColors.green
                : AppColors.grey,
            width: 1.0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Image.asset("assets/images/vise.png"),
            backgroundColor: AppColors.grey,
            radius: 25,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                containerLocationModel.title,
                style: AppTextStyles.boldtitles
                    .apply(color: AppColors.blueDark, fontSizeDelta: 3),
              ),
              Text(
                containerLocationModel.location,
                style: AppTextStyles.boldtitles
                    .apply(color: AppColors.greyDark, fontSizeDelta: -3),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
