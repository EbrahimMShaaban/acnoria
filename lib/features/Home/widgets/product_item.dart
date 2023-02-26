import 'package:flutter/material.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQueryHelper.sizeFromWidth(context, 2.6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.grey,

      ),
      child: Column(
        children: [
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                  color: AppColors.primarycolor),
              Row(
                children: const [Text('4.8'), Icon(Icons.star,size: 15,color: AppColors.gold,)],
              )
            ],
          ),
          Image.asset(
            AppImages.pin,
            width: MediaQueryHelper.sizeFromWidth(context, 3),
            height: MediaQueryHelper.sizeFromHeight(context, 12),
          ),
          Text('اوه ماي تنت مرطب شفاه وملمع – وردي – 4 غ ',maxLines: 2),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('12 ر.س'),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_circle_outline),
                  iconSize: 15,
                  color: AppColors.primarycolor),
            ],)
        ],
      ),
    );
  }
}
