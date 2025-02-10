import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:harmonized_admin/src/core/components/utils.dart';
import 'package:harmonized_admin/src/features/main_screen.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;
  var obsecurePassword = true.obs;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  String? validateEmail(String email) {
    if (!GetUtils.isEmail(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  togglePassword() {
    obsecurePassword.value = !obsecurePassword.value;
  }

  String? validatePassword(String password) {
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (validateEmail(email) != null || validatePassword(password) != null) {
      Utils.toastMessage('Please Enter valid Email and Password');
      return;
    }

    isLoading.value = true;

    try {
      // Step 1: Attempt to sign in the user
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Step 2: Check if the user is an admin by querying Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('adminSettings')
          .doc(
              userCredential.user?.uid) // Use the UID of the authenticated user
          .get();

      if (userDoc.exists) {
        // User exists in adminSettings
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

        if (userData['role'] == 'admin') {
          // User is an admin
          Utils.toastMessage('Login Successful. Welcome Admin!');
          Get.offAll(() => const MainScreen()); // Navigate to admin screen
        } else {
          // User is not an admin
          Utils.toastMessage(
              'Login Successful. But you dont have rights to access Admin Panel');
        }
      } else {
        // User not found in adminSettings
        Utils.toastMessage('Login Successful, but no admin record found.');
      }
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message ?? 'Login failed. Please try again later.';
      }

      Utils.toastMessage(message);
    } catch (e) {
      Utils.toastMessage(
          'An unexpected error occurred. Please try again later.');
    } finally {
      isLoading.value = false;
    }
  }

  // void login() async {
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();

  //   if (validateEmail(email) != null || validatePassword(password) != null) {
  //     Utils.toastMessage('Please Enter valid Email and Password');
  //     return;
  //   }

  //   isLoading.value = true;

  //   try {
  //     // Step 1: Attempt to sign in the user
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);

  //     // Step 4: If login is successful and not blocked, navigate to the home screen

  //     Get.put(AdController());
  //     Utils.toastMessage('Login Successful');

  //     Get.offAll(() => const MainScreen());
  //   } on FirebaseAuthException catch (e) {
  //     String message;
  //     if (e.code == 'user-not-found') {
  //       message = 'No user found for that email.';
  //     } else if (e.code == 'wrong-password') {
  //       message = 'Wrong password provided for that user.';
  //     } else {
  //       message = e.message ?? 'Login failed. Please try again later.';
  //     }

  //     Utils.toastMessage(message);
  //   } catch (e) {
  //     Utils.toastMessage(
  //         'An unexpected error occurred. Please try again later.');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // void signUp() async {
  //   isLoading.value = true;

  //   try {
  //     // Step 1: Create the user in Firebase Authentication
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: 'admin@gmail.com',
  //       password: '12341234',
  //     );

  //     // Step 2: Store user details in Firestore
  //     await FirebaseFirestore.instance
  //         .collection('adminSettings')
  //         .doc(userCredential.user?.uid)
  //         .set({
  //       'email': 'admin@gmail.com',
  //       'password': '12341234',
  //       'role': 'admin',
  //     });

  //     Utils.toastMessage('Sign-Up Successful. You can now log in.');

  //     // Optional: Automatically log the user in after sign-up
  //     Get.put(AdController());
  //     Get.offAll(() => const MainScreen());
  //   } on FirebaseAuthException catch (e) {
  //     String message;
  //     if (e.code == 'email-already-in-use') {
  //       message = 'The email is already in use by another account.';
  //     } else {
  //       message = e.message ?? 'Sign-Up failed. Please try again later.';
  //     }
  //     Utils.toastMessage(message);
  //   } catch (e) {
  //     Utils.toastMessage(
  //         'An unexpected error occurred. Please try again later.');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
