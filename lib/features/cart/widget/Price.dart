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
                 AppTextStyles.boldtitles.apply(fontSizeDelta: 3),
               ),
               Text(
                 "110 ر.س",
                 style: AppTextStyles.boldtitles
                     .apply(color: AppColors.blue, fontSizeDelta: 3),
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
                 style: AppTextStyles.boldtitles
                     .apply(color: AppColors.green, fontSizeDelta: 3),
               ),
               Text(
                 "110 ر.س",
                 style: AppTextStyles.boldtitles
                     .apply(color: AppColors.green, fontSizeDelta: 3),
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
                 "اجمالى المبلغ",
                 style:
                 AppTextStyles.boldtitles.apply(fontSizeDelta: 3),
               ),
               SizedBox(
                 width: 10,
               ),
               Text(
                 "(4 عناصر)",
                 style: AppTextStyles.boldtitles
                     .apply(color: AppColors.blue, fontSizeDelta: -5),
               ),
               Spacer(),
               Text(
                 "110 ر.س",
                 style: AppTextStyles.boldtitles
                     .apply(color: AppColors.blue, fontSizeDelta: 3),
               ),
             ],
           ),
         ),


       ],
     );
   }
 }
 