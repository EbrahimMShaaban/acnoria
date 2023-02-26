import 'package:flutter/material.dart';

import '../../../shared/styles/images.dart';

class NotifyItem extends StatelessWidget {
  NotifyItem({this.isclickable = false, Key? key}) : super(key: key);
  bool isclickable;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(' هذا النص هو مثال ة عدد الحروف التى يولدها التطبيق.',
          maxLines: 2),
      subtitle: Text("09:20am "),
      leading: CircleAvatar(
        child: Image.asset(AppImages.pin),
      ),
      trailing: isclickable
          ? ElevatedButton(onPressed: () {}, child: Text('تتبع الطلب'))
          : SizedBox(),
    );
  }
}
