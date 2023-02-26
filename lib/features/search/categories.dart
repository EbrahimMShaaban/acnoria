import 'package:acnoria/features/search/widgets/appbar.dart';
import 'package:acnoria/features/search/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';
import '../../shared/styles/styles.dart';
class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppSearchBar(context),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQueryHelper.sizeFromHeight(context, 10),
                //  color: Colors.red,
                child: SearchBar()
            ),
            Row(
              children: [
               TextButton(onPressed: (){}, child: Text('العطور')),
               TextButton(onPressed: (){}, child: Text('الانسان')),
               TextButton(onPressed: (){}, child: Text('عدسات')),
               TextButton(onPressed: (){}, child: Text('مكملات غذائية')),
              ],
            )

          ],
        ),
      ) ,

    );
  }
}
