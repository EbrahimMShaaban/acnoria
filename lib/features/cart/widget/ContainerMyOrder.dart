
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/cart_details_model.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';
class ContainerMyOrder extends StatelessWidget {
    ContainerMyOrder({Key? key, this.cartDetailsModel, required this.index}) : super(key: key);
  final CartDetailsModel? cartDetailsModel;
  final int index;
  @override


  Widget build(BuildContext context) {
    return      Container(
      margin: EdgeInsets.only(bottom: 10, top: 20),
      padding:
      EdgeInsets.symmetric(horizontal: 1, vertical: 5),
      height: 110.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            child: Image.network(
              "${cartDetailsModel!.data!.items![index].product!.baseImage!.smallImageUrl}",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/2,
                child: Text(
                  maxLines: 2,
                  "${cartDetailsModel!.data!.items![index].product!.name}",
                  style: AppTextStyles.boldtitles.copyWith(
                      color: AppColors.primarycolor, fontSize: 15,height: 0,),
                ),
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "السعر :  ",
                      style: AppTextStyles.w600.copyWith(
                          color: AppColors.primarycolor,
                          fontSize: 17),
                    ),
                    TextSpan(

                      text: "${cartDetailsModel!.data!.items![index].formatedBaseTotal}",
                      style: AppTextStyles.w600.copyWith(
                          color: AppColors.green,
                          fontSize: 17),
                    ),
                  ])),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "الكمية :  ",
                      style: AppTextStyles.w600.copyWith(
                          color: AppColors.primarycolor,
                          fontSize: 17),
                    ),
                    TextSpan(
                      text: "${cartDetailsModel!.data!.items![index].quantity}",
                      style: AppTextStyles.w600.copyWith(
                          color: AppColors.green,
                          fontSize: 17),
                    ),
                  ])),
            ],
          ),


        ],
      ),
    );
  }
}
