import 'package:acnoria/features/search/widgets/appbar.dart';
import 'package:acnoria/features/search/widgets/search_bar.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/images.dart';
import 'categories.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppSearchBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQueryHelper.sizeFromHeight(context, 10),
                  //  color: Colors.red,
                  child: SearchBar()),
              Text('الأبحاث الحديثة', style: AppTextStyles.lrTitles),
              Container(
                height: MediaQueryHelper.sizeFromHeight(context, 4),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    // itemExtent: 30,
                    cacheExtent: 100,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0,
                        leading: Icon(
                          Icons.access_time_outlined,
                          color: AppColors.primarycolor,
                        ),
                        title: Text('المكملات الغذائية'),
                      );
                    },
                    itemCount: 10),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text('الأكثر بحثا', style: AppTextStyles.lrTitles),
              ),
              Container(
                  height: MediaQueryHelper.sizeFromHeight(context, 7),
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
              GridView.builder(
                physics:NeverScrollableScrollPhysics() ,
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
                            child: Text('الرشاقة والصحة'),
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
    );
  }
}

/*
* GridView.extent(
                  shrinkWrap: true,

                  maxCrossAxisExtent:
                      MediaQueryHelper.sizeFromWidth(context, 1.6),
                  childAspectRatio: 4,

                //  physics: ScrollPhysics(),
                  primary: false,
                  //  padding: const EdgeInsets.all(16),
                  crossAxisSpacing: 100,
                  mainAxisSpacing: 0,

                  children: [
                    Container(
                      height: 20,
                      child: Text("aaaaaaaaaaaaaaaaaaaaaaaaaa", maxLines: 1),
                    ),
                    Container(
                      color: Colors.red,
                      width: 10,
                      height: 20,
                      child: Text("xxx"),
                    ),

                    Container(
                      height: 20,
                      child: Text("yyy"),
                    ),
                    Text("aaaaa"),
                    Text("aaaaa"),
                    Text("aaaaaaaaaaaaaaaaaaaaaaaaaa"),
                    Text("aaaaaaaaaaaaaaaaaaaaaaaaaa"),
                    Text("aaaaaaaaaaaaaaaaaaaaaaaaaa"),
                    Text("aaaaaaaaaaaaaaaaaaaaaaaaaa"),
                    Text("aaaaaaaaaaaaaaaaaaaaaaaaaa"),
                    Text("aaaaaaaaaaaaaaaaaaaaaaaaaa"),
                    Text("aaaaaaaaaaaaaaaaaaaaaaaaaa"),
                    Text("aaaaaaaaaaaaaaaaaaaaaaaaaa"),
                  ],
                )
* */
