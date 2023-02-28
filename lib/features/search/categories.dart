import 'package:acnoria/features/search/widgets/appbar.dart';
import 'package:acnoria/features/search/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';
import '../../shared/components/navigator.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/images.dart';
import '../../shared/styles/styles.dart';
import '../Home/widgets/product_item.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppSearchBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQueryHelper.sizeFromHeight(context, 10),
                //  color: Colors.red,
                child: SearchBar()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('العطور',
                      style: AppTextStyles.smTitles
                          .copyWith(color: AppColors.primarycolor)),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text('الانسان',
                        style: AppTextStyles.smTitles
                            .copyWith(color: AppColors.primarycolor))),
                TextButton(
                    onPressed: () {},
                    child: Text('عدسات',
                        style: AppTextStyles.smTitles
                            .copyWith(color: AppColors.primarycolor))),
                TextButton(
                    onPressed: () {},
                    child: Text('مكملات غذائية',
                        style: AppTextStyles.smTitles
                            .copyWith(color: AppColors.primarycolor))),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
