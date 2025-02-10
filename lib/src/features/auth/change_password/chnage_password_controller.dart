import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/components/utils.dart';

class ChangePasswordController extends GetxController {
  var isLoading = false.obs; // Observable loading state

  void changePassword(String currentPassword, String newPassword,
      String confirmPassword, User user) async {
    if (isLoading.value) return; // Prevent multiple submissions
    isLoading.value = true; // Start loading

    try {
      // Re-authenticate the user
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );

      await user.reauthenticateWithCredential(credential);

      // Check if new password and confirm password match
      if (newPassword == confirmPassword) {
        await user.updatePassword(newPassword);
        Utils.toastMessage('Password changed successfully');
      } else {
        Utils.toastMessage('New passwords do not match');
      }
    } on FirebaseAuthException catch (e) {
      Utils.toastMessage(e.message ?? 'An unknown error occurred');
    } finally {
      isLoading.value = false; // End loading
    }
  }
}
