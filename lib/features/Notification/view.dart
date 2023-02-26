import 'package:acnoria/features/Notification/widgets/listtile_item.dart';
import 'package:acnoria/shared/components/constants.dart';
import 'package:acnoria/shared/styles/images.dart';
import 'package:acnoria/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              SizedBox(height: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('اليوم'),
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
                  Text('أمس'),
                  NotifyItem(),
                  Divider(
                    thickness: 1,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('في هذا الأسبوع'),
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
    );
  }
}
