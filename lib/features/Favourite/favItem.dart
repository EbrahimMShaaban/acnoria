import 'package:acnoria/models/allFavorites_model.dart';
import 'package:flutter/material.dart';

import '../../models/fav_model/test.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';

class ContinerMyFavorite extends StatelessWidget {
  ContinerMyFavorite(
      {required this.onPressed,
      required this.allFavouritesModel,
      required this.index,
      Key? key})
      : super(key: key);
  Function onPressed;
  AllFavouritesModel? allFavouritesModel;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      height: 100,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.09),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ]),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 60,
            width: 60,
            // color: Colors.amber
            child: Image.network(
              "${allFavouritesModel?.data![index].product?.baseImage?.originalImageUrl}",


              errorBuilder: (context ,obj,tracer){
                return const Text('لا توجد صورة لعرضها');
              },
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQueryHelper.sizeFromWidth(context, 4),

                child: Text(
                  "${allFavouritesModel?.data![index].product?.name}",
                  maxLines: 1,
                  style: AppTextStyles.boldtitles
                      .apply(color: AppColors.blue, fontSizeDelta: 0),
                ),
              ),
              Text(
                "${allFavouritesModel?.data![index].product?.id}ml",
                style: AppTextStyles.smTitles.apply(
                    color: AppColors.greyDark,
                    fontSizeDelta: -5,
                    fontWeightDelta: 100),
              ),
            ],
          ),
          // Spacer(),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQueryHelper.sizeFromWidth(context, 9),
            ),
            // alignment: Alignment.center,
            child: Text(
              "${allFavouritesModel?.data![index].product?.price}",
              style: AppTextStyles.boldtitles
                  .apply(color: AppColors.green, fontSizeDelta: 0),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    onPressed();
                  },
                  icon: Icon(Icons.clear_outlined)))
        ],
      ),
    );
  }
}
