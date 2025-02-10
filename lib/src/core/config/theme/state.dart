import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/core/config/theme/themedark.dart';
import 'package:harmonized_admin/src/core/config/theme/themelight.dart';

enum AppTheme { light, dark }

class ThemeController extends GetxController {
  var theme = AppTheme.light.obs;

  ThemeData get themeData => theme.value == AppTheme.light
      ? Themelight.lightTheme
      : Themedark.darkTheme;

  void toggleTheme() {
    theme.value =
        theme.value == AppTheme.light ? AppTheme.dark : AppTheme.light;
  }
}


//  IconButton(
//             icon: Icon(Icons.brightness_6),
//             onPressed: () {
//               final theme = ref.read(themeProvider.notifier);
//               theme.state = theme.state == AppTheme.light
//                   ? AppTheme.dark
//                   : AppTheme.light;
//             },
//           ),