import 'package:acnoria/shared/components/components.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
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
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQueryHelper.sizeFromWidth(context, 20)),
              width: MediaQueryHelper.sizeFromWidth(context, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel_outlined)),
                    ],
                  ),
                  Text(
                    'التصنيفات',
                    style: AppTextStyles.lrTitles,
                  ),
                  Text(
                    'مرتبة حسب',
                    style: AppTextStyles.smTitles,
                  ),
                  Container(
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
                              child: Text(
                            'موصى بها',
                            style: AppTextStyles.boldtitles
                                .copyWith(color: AppColors.primarycolor),
                          ))
                        ],
                        onChanged: (x) {}),
                  ),
                  Text(
                    'الأقسام',
                    style: AppTextStyles.lrTitles,
                  ),
                  Container(
                      height: MediaQueryHelper.sizeFromHeight(context, 7),
                      child: MultiSelectContainer(
                          highlightColor: AppColors.primarycolor,
                          textStyles: MultiSelectTextStyles(
                            textStyle: AppTextStyles.boldtitles
                                .copyWith(color: AppColors.primarycolor),

                          ),
                          prefix: MultiSelectPrefix(
                              // selectedPrefix: Padding(
                              //   padding: EdgeInsets.only(right: 5),
                              //   child: Icon(
                              //     Icons.check,
                              //     color: Colors.white,
                              //     size: 14,
                              //   ),
                              // ),
                              disabledPrefix: const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.do_disturb_alt_sharp,
                              size: 14,
                            ),
                          )),
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
                  Text(
                    'نطاق السعر',
                    style: AppTextStyles.lrTitles,
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