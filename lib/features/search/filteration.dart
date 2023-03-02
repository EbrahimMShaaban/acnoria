import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/images.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class FilterAtion extends StatelessWidget {
  FilterAtion({Key? key}) : super(key: key);
  List items = [
    'موصى بها',
    'الأقدم',
    'الأحدث',
  ];
  RangeValues _currentRangeValues = const RangeValues(40, 80);

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
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQueryHelper.sizeFromWidth(context, 20)),
              width: MediaQueryHelper.sizeFromWidth(context, 1),
              child: Padding(
                padding: appPadding(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'التصنيفات',
                      style: AppTextStyles.lrTitles,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'مرتبة حسب',
                      style: AppTextStyles.smTitles,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQueryHelper.sizeFromWidth(context, 1.2),
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

                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          items: [
                            DropdownMenuItem(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'موصى بها',
                                style: AppTextStyles.smTitles
                                    .copyWith(color: AppColors.primarycolor),
                              ),
                            ))
                          ],
                          onChanged: (x) {}),
                    ),
                    Text(
                      'الأقسام',
                      style: AppTextStyles.lrTitles,
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
                                  .copyWith(color: AppColors.primarycolor),
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
                            ],
                            onChange: (allSelectedItems, selectedItem) {})),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'نطاق السعر',
                      style: AppTextStyles.lrTitles,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RangeSlider(
                      values: _currentRangeValues,
                      onChanged: (x) {},
                      min: 1,
                      max: 100,
                      activeColor: AppColors.primarycolor,
                      inactiveColor: AppColors.primarycolor,
                    ),
                  ],
                ),
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
                  //     color: Colors.lightGreen,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: ButtonTemplate(
                          color: AppColors.primarycolor,
                          text1: 'تطبيق',
                          onPressed: () {})),
                  Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('إعادة تعيين',
                            style: AppTextStyles.smTitles
                                .copyWith(color: AppColors.primarycolor)),
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
