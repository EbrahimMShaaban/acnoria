import 'package:flutter/material.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';
class TileItem extends StatelessWidget {
   TileItem({required this.data,Key? key}) : super(key: key);
  List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      // decoration: BoxDecoration(
      //     color: AppColors.white,
      //     borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        ),
        child: ExpansionTile(
          backgroundColor: AppColors.white,
          textColor: AppColors.blue,
          iconColor: AppColors.primarycolor,
          collapsedIconColor: AppColors.primarycolor,
          collapsedBackgroundColor: AppColors.white,
          title: Text(
            'هذا النص هو مثال لنص يمكن أن يستبدل في ؟ ',
            style: AppTextStyles.boldtitles
                .apply(color: AppColors.blue, fontSizeDelta: -4),
          ),
          children: data.map((data) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 8, bottom: 20),
              child: ListTile(
                  title: Text(
                    data,
                    style: AppTextStyles.boldtitles.apply(
                        color: AppColors.blue, fontSizeDelta: -3),
                  )),
            );
          }).toList(),
        ),
      ),
    );
  }
}
