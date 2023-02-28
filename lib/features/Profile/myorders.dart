import 'package:acnoria/features/cart/widget/profileappbar.dart';
import 'package:flutter/material.dart';
class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(context, txt: 'طلباتي'),

    );
  }
}
