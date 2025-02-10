import 'package:flutter/material.dart';
import 'themetext.dart';
import 'themecolor.dart';

class Themedark {
  Themedark._();

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Themecolor.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Themecolor.primaryDark,
        titleTextStyle:
            Themetext.titleTextStyle.copyWith(color: Themecolor.white),
      ),
      textTheme: Themetext.textTheme.apply(bodyColor: Themecolor.white,fontFamily:"Bree Serif"),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Themecolor.black,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Themecolor.black,
        titleTextStyle:
            Themetext.titleTextStyle.copyWith(color: Themecolor.white),
        contentTextStyle:
            Themetext.textTheme.bodyMedium?.copyWith(color: Themecolor.white),
      ),
      useMaterial3: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Themecolor.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          minimumSize: const Size(327.0, 56.0),
        ),
      ),
      iconTheme: const IconThemeData(color: Themecolor.white));
}
