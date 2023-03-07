import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';
 class Price extends StatelessWidget {
   const Price({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return     Column(
       children: [
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 20.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 "مبلغ اجمالى",
                 style:
                 AppTextStyles.textsmbold,
               ),
               Text(
                 "110 ر.س",
                 style:  AppTextStyles.textsmbold,
               ),
             ],
           ),
         ),
         Divider(
           height: 10,
           color: AppColors.greyDark,
         ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 20.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 "الشحن",
                 style:  AppTextStyles.textsmbold.copyWith(
                   color: AppColors.green
                 ),
               ),
               Text(
                 "20 ر.س",
                 style:  AppTextStyles.textsmbold.copyWith(
                     color: AppColors.green
                 ),
               ),
             ],
           ),
         ),
         Divider(
           height: 10,
           color: AppColors.greyDark,
         ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 20.0),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.end,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 "اجمالى المبلغ",
                 style:
                 AppTextStyles.textsmbold,
               ),
               SizedBox(
                 width: 12,
               ),
               Text(
                 "(4 عناصر)",
                 style: AppTextStyles.boldtitles
                     .apply(color: AppColors.blue, fontSizeDelta: -5),
               ),
               Spacer(),
               Text(
                 "124 ر.س",
                 style: AppTextStyles.textsmbold,
               ),
             ],
           ),
         ),


       ],
     );
   }
 }
 