import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/images.dart';

class NotifyItem extends StatelessWidget {
  NotifyItem({this.isclickable = false, Key? key}) : super(key: key);
  bool isclickable;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(' هذا النص هو مثال ة عدد الحروف التى يولدها التطبيق.',
          style: AppTextStyles.w600.copyWith(
            fontSize: 16
          ), maxLines: 2),
      subtitle: Text("09:20am ",
          style: AppTextStyles.boldtitles.apply(
              color: AppColors.Bluehint, fontSizeDelta:-4)),
      leading: CircleAvatar(
        backgroundColor: AppColors.grey,
        child: Image.asset(AppImages.pin,height: 22),
      ),
      trailing: isclickable
          ? ElevatedButton(
        onPressed: () {},
        child: Text('تتبع الطلب'),
      )
          : SizedBox(),
    );
  }
}
