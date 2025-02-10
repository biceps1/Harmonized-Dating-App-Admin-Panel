import 'package:flutter/material.dart';

class Themetext {
  Themetext._();

  static const double smallSize = 12.0;
  static const double mediumSize = 14.0;
  static const double largeSize = 18.0;
  static const double extraLargeSize = 24.0;

  static const TextTheme textTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: extraLargeSize,
      fontWeight: FontWeight.w600,
      color: Color(0xFF272B3B),
    ),
    bodyMedium: TextStyle(
      fontSize: mediumSize,
      fontWeight: FontWeight.w500,
      color: Color(0xFF03008B),
    ),
    bodySmall: TextStyle(
      fontSize: mediumSize,
      fontWeight: FontWeight.w400,
      color: Color(0xFF03008B),
    ),
    displayMedium: TextStyle(
      fontSize: mediumSize,
      fontWeight: FontWeight.w500,
      color: Color(0x0ffca4ab),
    ),
  );

  static const TextStyle titleTextStyle = TextStyle(
    fontSize: largeSize,
    fontWeight: FontWeight.w600,
    color: Color(0xFFFFFFFF),
  );
}
