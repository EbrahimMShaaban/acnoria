import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/images.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterAtion extends StatefulWidget {
  FilterAtion({Key? key}) : super(key: key);

  @override
  State<FilterAtion> createState() => _FilterAtionState();
}

class _FilterAtionState extends State<FilterAtion> {
  List items = [
    'موصى بها',
    'الأقدم',
    'الأحدث',
  ];

  RangeValues _currentRangeValues = const RangeValues(100, 500);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      AppImages.x,
                      height: 20,
                    )),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: appPadding(),
              child: ListView(
                //    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'التصنيفات',
                    style: AppTextStyles.lrTitles.copyWith(fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'مرتبة حسب',
                      style: AppTextStyles.lrTitles.copyWith(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    //  width: MediaQueryHelper.sizeFromWidth(context, 1.1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.white),
                    child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        // style: AppTextStyles.lrTitles
                        //     .copyWith(color: AppColors.primarycolor),
                        elevation: 10,
                        // borderRadius: BorderRadius.circular(15),

                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColors.primarycolor,size: 30,
                        ),
                        items: [
                          DropdownMenuItem(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'موصى بها',
                              style: AppTextStyles.boldtitles.copyWith(
                                color: AppColors.primarycolor,
                                fontSize: 16,
                              ),
                            ),
                          ))
                        ],
                        onChanged: (x) {}),
                  ),
                  Text(
                    'الأقسام',
                    style: AppTextStyles.lrTitles.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: MediaQueryHelper.sizeFromHeight(context, 7),
                      child: MultiSelectContainer(

                          itemsDecoration: MultiSelectDecorations(
                              selectedDecoration: BoxDecoration(
                                  color: AppColors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              decoration: BoxDecoration(
                                  color: AppColors.greym,
                                  borderRadius: BorderRadius.circular(10))),
                          highlightColor: AppColors.primarycolor,
                          textStyles: MultiSelectTextStyles(
                            textStyle: AppTextStyles.boldtitles
                                .apply(color: AppColors.primarycolor),
                          ),
                          items: [
                            MultiSelectCard(
                              value: 'المكملات الغذائية',
                              label: 'المكملات الغذائية',
                            ),
                            MultiSelectCard(
                              value: 'العناية بالاسنان',
                              label: 'العناية بالاسنان',
                            ),
                            MultiSelectCard(
                              value: 'العطور',
                              label: 'العطور',
                            ),
                            MultiSelectCard(
                              value: 'مستلزمات كبار السن',
                              label: 'مستلزمات كبار السن',
                            ),
                            MultiSelectCard(
                              value: 'المكملات الغذائية',
                              label: 'المكملات الغذائية',
                            ),
                            MultiSelectCard(
                              value: 'العناية بالاسنان',
                              label: 'العناية بالاسنان',
                            ),
                            MultiSelectCard(
                              value: 'العطور',
                              label: 'العطور',
                            ),
                            MultiSelectCard(
                              value: 'مستلزمات كبار السن',
                              label: 'مستلزمات كبار السن',
                            ),
                          ],
                          onChange: (allSelectedItems, selectedItem) {})),
                  SizedBox(
                    height: 130.h,
                  ),
                  Text(
                    'نطاق السعر',
                    style: AppTextStyles.lrTitles.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  RangeSlider(
                    values: _currentRangeValues,
                    max: 2000,
                    divisions: 20,

                    // activeColor: AppColors.primarycolor,
                    // inactiveColor: AppColors.primarycolor,

                    labels: RangeLabels(
                      "${_currentRangeValues.start.round().toString()}ر.س",
                      "${_currentRangeValues.end.round().toString()}ر.س",
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQueryHelper.sizeFromHeight(context, 5),
              width: MediaQueryHelper.sizeFromWidth(context, 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: ButtonTemplate(
                            color: AppColors.primarycolor,
                            text1: 'تطبيق',
                            onPressed: () {}),
                      )),
                  Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('إعادة تعيين',
                            style: AppTextStyles.hittext
                                .copyWith(color: AppColors.primarycolor,




                            )),
                      ))
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
