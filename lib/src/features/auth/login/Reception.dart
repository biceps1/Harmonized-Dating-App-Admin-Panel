import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/core/components/loading%20.dart';
import 'package:harmonized_admin/src/features/auth/login/login_screen.dart';
import 'package:harmonized_admin/src/features/main_screen.dart';

class Reception {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  userReception() async {
    Get.put(LoadingController(), permanent: true);

    log("::::::::: CURRENT USER IS ${FirebaseAuth.instance.currentUser != null}");

    if (FirebaseAuth.instance.currentUser != null) {
      Get.offAll(() => const MainScreen());
    } else {
      loading(false);
      Get.offAll(() => const LoginScreen());
    }
  }
}
