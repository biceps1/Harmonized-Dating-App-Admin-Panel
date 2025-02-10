import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/core/config/theme/state.dart';
import 'package:harmonized_admin/src/features/analytics&resports/analytics_controller.dart';
import 'package:harmonized_admin/src/features/splash_screen.dart';


class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Harmonized Admin Workspace',
        theme: themeController.themeData,
            initialBinding: AnalyticsBinding(),

        home: const SplashScreen(),
      ),
    );
  }
} 
