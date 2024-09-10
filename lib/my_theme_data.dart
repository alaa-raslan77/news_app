import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/app_colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      toolbarHeight: 70,
      backgroundColor: AppColors.PrimaryGreen,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50))),
    ),
  );
}
