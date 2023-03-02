import 'package:acnoria/shared/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/constants.dart';

class BottomItem extends StatelessWidget {


  BottomItem(
      {required this.onclick,
       required this.color,
      required this.path,
      required this.heigh,
      Key? key})

      : super(key: key);
  Function onclick;

  // double width;
  IconData path;
  Color color;
  double heigh;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 40,
        onPressed: () {
          onclick();
        },
        child: Column(
          children: [
            Expanded(
              child: Icon(
                path,
                color: color,
                size: 28,



              ),

            ),
          ],
        ));
  }
}
