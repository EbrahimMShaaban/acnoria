import 'package:acnoria/features/Notification/widgets/listtile_item.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/colors.dart';
import 'package:acnoria/shared/styles/images.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQueryHelper.sizeFromWidth(context, 1),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQueryHelper.sizeFromWidth(context, 20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الإشعارات',
                  style: AppTextStyles.boldtitles.apply(fontSizeDelta: 5),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('اليوم',
                          style: AppTextStyles.boldtitles
                              .copyWith(color: AppColors.Bluehint, fontSize: 17)),
                    ),
                    NotifyItem(),
                    NotifyItem(isclickable: true),
                    Divider(
                      thickness: 1,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'أمس',
                        style: AppTextStyles.boldtitles
                            .copyWith(color: AppColors.Bluehint,fontSize: 17),
                      ),
                    ),
                    NotifyItem(),
                    Divider(
                      thickness: 1,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('في هذا الأسبوع',
                          style: AppTextStyles.boldtitles
                              .copyWith(color: AppColors.Bluehint,fontSize: 17)),
                    ),
                    NotifyItem(),
                    NotifyItem(),
                    NotifyItem(),
                    Divider(
                      thickness: 1,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
