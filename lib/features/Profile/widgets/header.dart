import 'package:flutter/material.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/styles/images.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(),
          Image.asset(AppImages.logo,
              width: MediaQueryHelper.sizeFromWidth(context, 2)),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Directionality(
                  textDirection: TextDirection.ltr,
                  child: Icon(
                    Icons.arrow_back,
                    size: 25,
                  )))
        ],
      ),
    );
  }
}
