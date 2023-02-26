

import 'package:flutter/material.dart';

import '../../../shared/styles/images.dart';

PreferredSizeWidget AppSearchBar(BuildContext context) {
  return AppBar(
    leading: Image.asset(AppImages.logo),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            textDirection: TextDirection.ltr,
          ))
    ],
  );
}
