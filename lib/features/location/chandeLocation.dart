import 'package:acnoria/features/cart/widget/profileappbar.dart';
import 'package:acnoria/features/location/cubit/Location_cubit.dart';
import 'package:acnoria/models/LocationKodel.dart';
import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/network/remote/end_points.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';
import 'addNew_location.dart';

class ChangeLocationScreens extends StatefulWidget {
  const ChangeLocationScreens({Key? key}) : super(key: key);

  @override
  State<ChangeLocationScreens> createState() => _ChangeLocationScreensState();
}

class _ChangeLocationScreensState extends State<ChangeLocationScreens> {
  late int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit()..getLocation(),
      child: Scaffold(
        appBar: ProfileAppBar(context, txt: 'العنوان'),
        body: Padding(
          padding: appPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "اختر العنوان",
                style: AppTextStyles.boldtitles.apply(fontSizeDelta: 5),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 9,
                child: BlocConsumer<LocationCubit, LocationState>(
                  listener: (context, state) {
                    print(state);
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    LocationModel? locationModel =
                        LocationCubit.get(context).myLocation;
                    return state is GetLocationLoadingtState
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: locationModel!.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              print(locationModel.data!.length);
                              print(
                                  "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      idlocaton= locationModel.data![index].id;
                                    });
                                  },
                                  child: ContainerLocation(
                                    locationModel: locationModel.data![index],
                                    color: selectedIndex == index
                                        ? AppColors.green
                                        : AppColors.grey,
                                  ));
                            },
                          );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonTemplate(
                    minwidth: MediaQueryHelper.sizeFromWidth(context, 1),
                    icon: Icons.add_circle_outline_rounded,
                    color: AppColors.primarycolor,
                    text1: "أضافة عنوان جديد",
                    onPressed: () {
                      navigateTo(context, AddNewLocation());
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerLocation extends StatelessWidget {
  const ContainerLocation(
      {Key? key, required this.locationModel, required this.color})
      : super(key: key);

  // final ContainerLocationModel containerLocationModel;
  final Data locationModel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: color, width: 1.0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Image.asset("assets/images/location2.png", width: 25),
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
                "${locationModel.phone}",
                style: AppTextStyles.boldtitles
                    .apply(color: AppColors.blueDark, fontSizeDelta: -2),
              ),
              Text(
                "${locationModel.phone}",
                style: AppTextStyles.boldtitles
                    .apply(color: AppColors.greyDark, fontSizeDelta: -5),
              ),
              Text(
                "${locationModel.phone}",
                style: AppTextStyles.boldtitles
                    .apply(color: AppColors.greyDark, fontSizeDelta: -5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
