import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:harmonized_admin/src/core/config/theme/themecolor.dart';

class Utils {
  // Function to dismiss the keyboard
  static dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        webBgColor: "linear-gradient(to right, #0xFF2697FF, #96c93d)",
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          backgroundColor: Themecolor.flushbar,
          content: Text(
            message,
            style: const TextStyle(color: Themecolor.white),
          )));
  }
}

class GlobalLogger {
  static const String _errorSymbol = '❌❌❌'; // Red Cross Mark
  static const String _successSymbol = '✅'; // Check Mark
  static const String _warningSymbol = '⚠️'; // Warning Sign
  static const String _infoSymbol = 'ℹ️'; // Information Symbol
  static const String _debugSymbol = '🐞'; // Bug Symbol

  // Info
  static void info(String message) {
    _log(message, _infoSymbol, 'INFO');
  }

  // Success
  static void success(String message) {
    _log(message, _successSymbol, 'SUCCESS');
  }

  // Warning
  static void warning(String message) {
    _log(message, _warningSymbol, 'WARNING');
  }

  // Error
  static void error(String message) {
    _log(message, _errorSymbol, 'ERROR');
  }

  // Debug
  static void debug(String message) {
    _log(message, _debugSymbol, 'DEBUG');
  }

  // Private log method
  static void _log(String message, String symbol, String level) {
    if (kDebugMode) {
      final formattedMessage = '$symbol [$level] ::: $message';
      developer.log(formattedMessage, name: level);
    }
  }
}
