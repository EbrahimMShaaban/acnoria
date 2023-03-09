import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/styles/images.dart';

class NotifyItem extends StatelessWidget {
  NotifyItem({this.isclickable = false, Key? key}) : super(key: key);
  bool isclickable;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(' هذا النص هو مثال ة عدد الحروف التى يولدها التطبيق.',
          style: AppTextStyles.w600.copyWith(fontSize: 14.sp), maxLines: 2),

      subtitle: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Text("09:20am ",
            style: AppTextStyles.w600
                .copyWith(color: AppColors.Bluehint,fontSize: 14)),
      ),
      leading: CircleAvatar(
        backgroundColor: AppColors.grey,
        child: Image.asset(AppImages.pin, height: 22),
      ),
      trailing: isclickable
          ? ElevatedButton(

              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff84C044)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(10.0), // radius you want

                    )),),

                onPressed: () {},
              child: Text('تتبع الطلب'),
            )
          : SizedBox(),
    );
  }
}
