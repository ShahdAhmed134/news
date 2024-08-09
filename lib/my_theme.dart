import 'package:flutter/material.dart';
import 'package:news/home/colors.dart';

class MyThemeDats {
  static ThemeData LightMode = ThemeData(
      primaryColor: AppColors.primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))));
}
