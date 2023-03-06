import 'package:acnoria/features/search/search_view.dart';
import 'package:acnoria/features/search/widgets/appbar.dart';
import 'package:acnoria/features/search/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/components/navigator.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/images.dart';
import '../../shared/styles/styles.dart';
import '../Home/widgets/product_item.dart';
import 'filteration.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppSearchBar(context),
      body: Padding(
        padding: appPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQueryHelper.sizeFromHeight(context, 8),
                //  color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        navigateTo(context, SearchView());
                      },
                      child: Container(
                          width: MediaQueryHelper.sizeFromWidth(context, 1.6),
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white
                          ),

                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Image.asset(
                                  AppImages.search,
                                  color: Colors.grey,
                                  height: 20,
                                ),
                              ),
                              Text('بحث',style: TextStyle( color: Colors.grey,),)
                            ],
                          )),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        navigateTo(context, FilterAtion());
                      },
                      child: Container(
                        height: MediaQueryHelper.sizeFromWidth(context, 9),

                        width: MediaQueryHelper.sizeFromWidth(context, 9),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(AppImages.filter),
                        ),
                      ),
                    )
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('العطور',
                      style: AppTextStyles.smTitles.copyWith(
                          color: AppColors.primarycolor,
                          fontSize: 18,
                          fontWeight: FontWeight.w900)),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text('الاسنان',
                        style: AppTextStyles.smTitles.copyWith(
                          color: AppColors.primarycolor,
                          fontSize: 18,
                        ))),
                TextButton(
                    onPressed: () {},
                    child: Text('عدسات',
                        style: AppTextStyles.smTitles.copyWith(
                          color: AppColors.primarycolor,
                          fontSize: 18,
                        ))),
                TextButton(
                    onPressed: () {},
                    child: Text('مكملات غذائية',
                        style: AppTextStyles.smTitles.copyWith(
                          color: AppColors.primarycolor,
                          fontSize: 18,
                        ))),
              ],
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,

                    // mainAxisExtent: 100,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 2),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(
                    colorPath: "assets/images/gym.png",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
