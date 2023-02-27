import 'package:acnoria/features/cart/addNew_location.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class ChangeLocationScreens extends StatefulWidget {
  const ChangeLocationScreens({Key? key}) : super(key: key);

  @override
  State<ChangeLocationScreens> createState() => _ChangeLocationScreensState();
}

class _ChangeLocationScreensState extends State<ChangeLocationScreens> {
  List<ContainerLocationModel>? ContaineList = [];

  @override
  void initState() {
    // TODO: implement initState

    ContaineList?.add(
      ContainerLocationModel(
          title: "المكتب",
          location: "85 صاري, الخالدية 506 جدة, 23 \n 423 - 8949",
          phone: "9665252365+",
          isSelected: false),
    );
    ContaineList?.add(
      ContainerLocationModel(
          title: "المنزل",
          location: "85 صاري, الخالدية 506 جدة, 23 \n 423 - 8949",
          phone: "96652523557+",
          isSelected: false),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5F5F5),
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(right: 36.0),
          child: Text("تغير العنوان",
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
              SizedBox(
                height: 30,
              ),
              Text(
                "عنوان الشحن",
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: 5),
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
  final String phone;
  bool isSelected;

  ContainerLocationModel({
    required this.title,
    required this.location,
    required this.phone,
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
      height: 160,
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
            child: Icon(
              Icons.location_on_rounded,
              size: 30,
              color: AppColors.white,
            ),
            backgroundColor: AppColors.grey,
            radius: 20,
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
              Text(
                containerLocationModel.phone,
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
