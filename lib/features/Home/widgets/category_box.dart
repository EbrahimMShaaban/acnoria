import 'package:flutter/material.dart';

import '../../../shared/components/constants.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox({required this.color, required this.imgPath,required this.txt, Key? key})
      : super(key: key);
  Color color;
  String imgPath;
  String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQueryHelper.sizeFromWidth(context, 5),
          width: MediaQueryHelper.sizeFromWidth(context, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Center(
            child: Image.asset(
              imgPath,
              width: MediaQueryHelper.sizeFromWidth(context, 10),
            ),
          ),
        ),
        Text(txt)
      ],
    );
  }
}
