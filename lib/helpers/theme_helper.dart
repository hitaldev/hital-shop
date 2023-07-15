import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeHelper extends GetxController {

  ThemeData defaultTheme = ThemeData(
    fontFamily: "YekanBakh",
    primaryColor: Color(0xFF14489E),
    primaryColorLight: Color(0xFFED723F),
    scaffoldBackgroundColor: Color(0xFFF8F8F8),
    dividerColor: Color(0xFFE1E1E1),
    hintColor: Color(0xFFB4B4B4),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF3A3A3A))
    )
  );

}