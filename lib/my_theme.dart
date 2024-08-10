import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/colors.dart';

class MyThemeDats {
  static ThemeData LightMode = ThemeData(
      primaryColor: AppColors.primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)))),
    textTheme: TextTheme(
        titleLarge: GoogleFonts.exo(
      color: AppColors.whiteColor,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    )),
  );
}
