import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/core/components/custom_animated_button.dart';
import 'package:harmonized_admin/src/core/components/responsive.dart';
import 'package:harmonized_admin/src/core/components/utils.dart';

import 'chnage_password_controller.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  // Focus nodes for text fields
  final _currentPasswordFocusNode = FocusNode();
  final _newPasswordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  final ChangePasswordController _controller =
      Get.put(ChangePasswordController());

  // State variables for password visibility
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _currentPasswordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  // Validate the new password
  String? _validateNewPassword(String password) {
    if (password.isEmpty) {
      return 'New Password cannot be empty';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'(?=.*[a-z])').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'(?=.*[0-9])').hasMatch(password)) {
      return 'Password must contain at least one digit';
    } else if (!RegExp(r'(?=.*[!@#\$%\^&\*])').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }
    return null; // Return null if valid
  }

  // Validate all fields
  bool _validateFields() {
    String? currentPassword = _currentPasswordController.text;
    String? newPassword = _newPasswordController.text;
    String? confirmPassword = _confirmPasswordController.text;

    // Check if current password is empty
    if (currentPassword.isEmpty) {
      Utils.toastMessage('Current Password cannot be empty');
      return false;
    }

    // Validate new password
    String? newPasswordError = _validateNewPassword(newPassword);
    if (newPasswordError != null) {
      Utils.toastMessage(newPasswordError);
      return false;
    }

    // Check if new password and confirm password match
    if (newPassword != confirmPassword) {
      Utils.toastMessage('New passwords do not match');
      return false;
    }

    return true; // All validations passed
  }

  void _submit() async {
    User? user = _auth.currentUser;

    // Validate fields before submitting
    if (_validateFields() && user != null) {
      _controller.changePassword(
        _currentPasswordController.text,
        _newPasswordController.text,
        _confirmPasswordController.text,
        user,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Change Password')),
      body: Center(
        child: Obx(() => Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.height / 2
                  : MediaQuery.of(context).size.height / 1.5,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextField(
                    controller: _currentPasswordController,
                    label: 'Current Password',
                    focusNode: _currentPasswordFocusNode,
                    isVisible: _isCurrentPasswordVisible,
                    onVisibilityToggle: () {
                      setState(() {
                        _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                      });
                    },
                    onFieldSubmitted: (value) {
                      // Move focus to the new password field
                      FocusScope.of(context)
                          .requestFocus(_newPasswordFocusNode);
                    },
                  ),
                  _buildTextField(
                    controller: _newPasswordController,
                    label: 'New Password',
                    focusNode: _newPasswordFocusNode,
                    isVisible: _isNewPasswordVisible,
                    onVisibilityToggle: () {
                      setState(() {
                        _isNewPasswordVisible = !_isNewPasswordVisible;
                      });
                    },
                    onFieldSubmitted: (value) {
                      // Move focus to the confirm password field
                      FocusScope.of(context)
                          .requestFocus(_confirmPasswordFocusNode);
                    },
                  ),
                  _buildTextField(
                    controller: _confirmPasswordController,
                    label: 'Confirm Password',
                    focusNode: _confirmPasswordFocusNode,
                    isVisible: _isConfirmPasswordVisible,
                    onVisibilityToggle: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                    onFieldSubmitted: (value) {
                      // Submit the form
                      _submit();
                    },
                  ),
                  const SizedBox(height: 20),
                  _controller.isLoading.value
                      ? const CircularProgressIndicator() // Show loading indicator

                      : CustomAnimatedButton(
                          text: 'Change Password', onTap: _submit)
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required FocusNode focusNode,
    required bool isVisible,
    required VoidCallback onVisibilityToggle,
    required void Function(String)? onFieldSubmitted,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff72777A),
          ),
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: onVisibilityToggle, // Toggle visibility
          ),
        ),
        obscureText: !isVisible, // Obscure text based on visibility
        onSubmitted: onFieldSubmitted, // Handle field submission
      ),
    );
  }
}
