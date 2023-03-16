import 'package:acnoria/features/search/cubit/cubit.dart';
import 'package:acnoria/features/search/widgets/appbar.dart';
import 'package:acnoria/features/search/widgets/search_bar.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/images.dart';
import 'categories.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..getAllProducts(),
      child: Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppSearchBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: appPadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 90,
                    //  color: Colors.red,
                    child: SearchBar()),
                Text('الأبحاث الحديثة',
                    style: AppTextStyles.boldtitles.copyWith(fontSize: 18)),
                Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.access_time_outlined,
                        color: AppColors.primarycolor,
                      ),
                      title: Text('العطور'),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.access_time_outlined,
                        color: AppColors.primarycolor,
                      ),
                      title: Text('المكملات الغذائية'),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.access_time_outlined,
                        color: AppColors.primarycolor,
                      ),
                      title: Text('العدسات'),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.access_time_outlined,
                        color: AppColors.primarycolor,
                      ),
                      title: Text('الرشاقة والصحة'),
                    ),
                  ],
                )
                // ListView.builder(
                //     physics:NeverScrollableScrollPhysics() ,
                //     shrinkWrap: true,
                //     padding: EdgeInsets.zero,
                //     // itemExtent: 30,
                //     cacheExtent: 100,
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //         contentPadding: EdgeInsets.zero,
                //         minLeadingWidth: 0,
                //         leading: Icon(
                //           Icons.access_time_outlined,
                //           color: AppColors.primarycolor,
                //         ),
                //         title: Text('المكملات الغذائية'),
                //       );
                //     },
                //     itemCount: 4),
                ,
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text('الأكثر بحثا',
                      style: AppTextStyles.boldtitles.copyWith(fontSize: 18)),
                ),
                Container(
                    height: MediaQueryHelper.sizeFromHeight(context, 7),
                    width: MediaQuery.of(context).size.width,
                    child: MultiSelectContainer(
                        highlightColor: AppColors.primarycolor,
                        itemsDecoration: MultiSelectDecorations(
                            selectedDecoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            decoration: BoxDecoration(
                                color: AppColors.greym,
                                borderRadius: BorderRadius.circular(10))),
                        textStyles: MultiSelectTextStyles(
                          textStyle: AppTextStyles.boldtitles.copyWith(
                              color: AppColors.blueDark,
                              fontFamily: 'Schyler',
                              fontSize: 19),
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
                        )
                        ,),
                        wrapSettings: WrapSettings(spacing: 10,runSpacing: 10,
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
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('الأقسام',
                      style: AppTextStyles.boldtitles.copyWith(fontSize: 18)),
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Image.asset(AppImages.care),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: ElevatedButton(
                              onPressed: () {
                                navigateTo(context, Categories());
                              },
                              child: FittedBox(
                                child: Text(
                                  'الرشاقة والصحة',
                                  style: AppTextStyles.hittext
                                      .copyWith(color: AppColors.white),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primarycolor)),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
