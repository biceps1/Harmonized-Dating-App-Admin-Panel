// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mego_admin_panel/src/core/components/button.dart';
// import 'package:mego_admin_panel/src/core/extension/media_query.dart';
// import 'package:mego_admin_panel/src/features/auth/forget_password/forget_password_controller.dart';


// class ForgetPasswordScreen extends StatelessWidget {
//   ForgetPasswordScreen({super.key});

//   final ForgetPasswordController controller =
//       Get.put(ForgetPasswordController());

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           centerTitle: true,
//           title: Image.asset(
//             'assets/images/megoLogo.png',
//             height: context.heightPercentage(5),
//             width: context.widthPercentage(30),
//           ),
//         ),
//         body: Center(
//           child: Obx(() {
//             return Column(
//               children: [
//                 SizedBox(height: context.heightPercentage(4)),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: context.widthPercentage(5)),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.grey, width: 0.5)),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: TextFormField(
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         controller: controller.emailController,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           labelText: 'Email',
//                           labelStyle: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                               color: Color(0xff72777A)),
//                           hintText: 'email@gmail.com',
//                           hintStyle: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: context.heightPercentage(3)),
//                 SizedBox(height: context.heightPercentage(10)),
//                 controller.isLoading.value
//                     ? CircularProgressIndicator(
//                         color: Colors.white,
//                       )
//                     : FullSizeButtonWidget(
//                         buttonTitle: 'Reset Password',
//                         onTap: controller.resetPassword,
//                       ),
//                 SizedBox(height: context.heightPercentage(2)),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Don't have an account"),
//                     TextButton(
//                         onPressed: controller.navigateToSignUp,
//                         child: Text(
//                           'Sign Up',
//                           style: TextStyle(
//                               color: Colors.blue,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500),
//                         ))
//                   ],
//                 )
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
