import 'package:acnoria/features/home/itemScreen.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5,bottom: 5,right: 2,left: 2),
      padding: EdgeInsets.all(5),
      width: MediaQueryHelper.sizeFromWidth(context, 2.6),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(0,0), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: AppColors.grey,
      ),
      child: InkWell(
        onTap: () => navigateTo(context, ItemScreen()),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                    color: AppColors.primarycolor),
                Row(
                  children: const [
                    Text('4.8',style: TextStyle(color: AppColors.green)),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: AppColors.gold,
                    )
                  ],
                )
              ],
            ),
            Image.asset(
              "assets/images/gym.png",
              width: MediaQueryHelper.sizeFromWidth(context, 3),
              height: MediaQueryHelper.sizeFromHeight(context, 12),
            ),
            Text('اوه ماي تنت مرطب شفاه وملمع – وردي – 4 غ ', maxLines: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('12 ر.س'),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_circle_outline),
                    iconSize: 15,
                    color: AppColors.primarycolor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
