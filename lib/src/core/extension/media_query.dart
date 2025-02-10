import 'package:flutter/widgets.dart';




extension ScreenSizeExtension on BuildContext {
  /// Returns the screen height based on the given percentage.
  double heightPercentage(double percentage) {
    return MediaQuery.of(this).size.height * (percentage / 100);
  }

  /// Returns the screen width based on the given percentage.
  double widthPercentage(double percentage) {
    return MediaQuery.of(this).size.width * (percentage / 100);
  }
}