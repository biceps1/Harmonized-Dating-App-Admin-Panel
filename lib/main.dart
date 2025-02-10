import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/firebase_options.dart';
import 'package:harmonized_admin/src/core/components/loading%20.dart';
import 'package:harmonized_admin/src/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(LoadingController());
  runApp(MyApp());
}
