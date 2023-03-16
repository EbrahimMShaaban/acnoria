import 'package:acnoria/features/home/itemScreen.dart';
import 'package:acnoria/models/product_model.dart';
import 'package:acnoria/shared/components/navigator.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../../models/customproducts_model.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';

class ProductItem extends StatelessWidget {
  ProductItem({required this.model, required this.index, Key? key})
      : super(key: key);
  CustomProductsModel model;
  int index;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5, right: 2, left: 2),
        padding: EdgeInsets.all(7),
        width: MediaQueryHelper.sizeFromWidth(context, 2.6),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: AppColors.grey,
        ),
        child: InkWell(

          onTap: () => navigateTo(context, ItemScreen(id:index ,)),

   //       onTap: () => navigateTo(context, ItemScreen(product: model,index:  index,)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: model.data![index].isItemInCart!
                          ? Icon(Icons.favorite_border)
                          : Icon(Icons.favorite_border),
                      color: AppColors.primarycolor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${model.data![index].reviews?.averageRating}',
                          style: TextStyle(
                              color: AppColors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: AppColors.gold,
                      )
                    ],
                  )
                ],
              ),
              Container(
                height: MediaQueryHelper.sizeFromHeight(context, 8),
                child: Image.network(
                  '${model.data![index].baseImage?.originalImageUrl}',
                  errorBuilder: (context, object, stack) {
                    return Center(
                      child: Text('لا توجد صورة لعرضها'),
                    );

                  },
                  // height: MediaQueryHelper.sizeFromHeight(context, 10),
                ),
              ),
              Container(
                height: 45,
                child: Text('${model.data![index].shortDescription}',
                    maxLines: 2,
                    style: AppTextStyles.smTitles
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600)),
              ),
              Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${model.data![index].price} ر.س ',
                        style: AppTextStyles.smTitles.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blue)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle_outline),
                        iconSize: 20,
                        color: AppColors.primarycolor),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
