// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mego_admin_panel/src/features/auth/login/login_screen.dart';

// import 'package:mego_admin_panel/src/features/auth/sign_up/sign_up_screen.dart';


// class ForgetPasswordController extends GetxController {
//   var emailController = TextEditingController();
//   var isLoading = false.obs;

//   @override
//   void onClose() {
//     emailController.dispose();
//     super.onClose();
//   }

//   void resetPassword() async {
//     String email = emailController.text.trim();

//     if (email.isEmpty) {
//       Get.snackbar('Error', 'Email cannot be empty',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
//       return;
//     }

//     if (!GetUtils.isEmail(email)) {
//       Get.snackbar('Error', 'Please enter a valid email',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
//       return;
//     }

//     try {
//       isLoading.value = true;
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//       isLoading.value = false;

//       Get.snackbar('Success', 'Password reset email sent',
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
//       Get.off(() => LoginScreen());
//     } catch (e) {
//       isLoading.value = false;
//       Get.snackbar('Error', e.toString(),
//           snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
//     }
//   }

//   void navigateToSignUp() {
//     Get.off(() => SignUpScreen()); // Use named route if you have it defined
//   }
// }
