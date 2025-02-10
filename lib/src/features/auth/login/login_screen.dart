import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmonized_admin/src/core/components/button.dart';
import 'package:harmonized_admin/src/core/components/custom_animated_button.dart';
import 'package:harmonized_admin/src/core/components/responsive.dart';
import 'package:harmonized_admin/src/core/config/theme/themecolor.dart';
import 'package:harmonized_admin/src/core/extension/media_query.dart';
import 'package:harmonized_admin/src/features/auth/login/login_controller.dart';

import '../../../core/components/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SizedBox(
            width: context.width / 1,
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Responsive.isDesktop(context)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Center(
                                  child: Text(
                                "Harmonized",
                                style: TextStyle(
                                    fontFamily: "Lilita One",
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                    color: Themecolor.primaryColor),
                              )),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    'Log in to Harmonized',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: context.heightPercentage(4)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: context.widthPercentage(5)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.grey, width: 0.5)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextFormField(
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          controller:
                                              controller.emailController,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Email',
                                            labelStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff72777A)),
                                            hintText: 'email@gmail.com',
                                            hintStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          focusNode: controller.emailFocusNode,
                                          onFieldSubmitted: (valu) {
                                            Utils.fieldFocusChange(
                                                context,
                                                controller.emailFocusNode,
                                                controller.passwordFocusNode);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: context.heightPercentage(3)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: context.widthPercentage(5)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.grey, width: 0.5)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextFormField(
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          controller:
                                              controller.passwordController,
                                          obscureText:
                                              controller.obsecurePassword.value,
                                          focusNode:
                                              controller.passwordFocusNode,
                                          decoration: InputDecoration(
                                            suffixIcon: InkWell(
                                                onTap:
                                                    controller.togglePassword,
                                                child: Icon(controller
                                                        .obsecurePassword.value
                                                    ? Icons
                                                        .visibility_off_outlined
                                                    : Icons.visibility)),
                                            border: InputBorder.none,
                                            labelText: 'Password',
                                            labelStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff72777A)),
                                            hintStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          onFieldSubmitted: (value) {
                                            controller.login();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: context.heightPercentage(1)),
                                  controller.isLoading.value
                                      ? const CircularProgressIndicator(
                                          color: Color(0xff2874F0),
                                        )
                                      : Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  context.widthPercentage(5)),
                                          child: CustomAnimatedButton(
                                            text: 'Login',
                                            onTap: controller.login,
                                          )),
                                  SizedBox(height: context.heightPercentage(2)),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Image.asset(
                              'assets/images/megoLogo.png',
                              height: context.heightPercentage(9),
                            ),
                            SizedBox(height: context.heightPercentage(8)),
                            const Text('Log in to Mego'),
                            SizedBox(height: context.heightPercentage(4)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.widthPercentage(5)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    controller: controller.emailController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff72777A)),
                                      hintText: 'email@gmail.com',
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    focusNode: controller.emailFocusNode,
                                    onFieldSubmitted: (valu) {
                                      Utils.fieldFocusChange(
                                          context,
                                          controller.emailFocusNode,
                                          controller.passwordFocusNode);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: context.heightPercentage(3)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.widthPercentage(5)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    controller: controller.passwordController,
                                    obscureText:
                                        controller.obsecurePassword.value,
                                    focusNode: controller.passwordFocusNode,
                                    decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                          onTap: controller.togglePassword,
                                          child: Icon(controller
                                                  .obsecurePassword.value
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility)),
                                      border: InputBorder.none,
                                      labelText: 'Password',
                                      labelStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff72777A)),
                                      hintStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onFieldSubmitted: (value) {
                                      controller.login();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: context.heightPercentage(1)),
                            controller.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: Color(0xff2874F0),
                                  )
                                : Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: context.widthPercentage(5)),
                                    child: FullSizeButtonWidget(
                                      buttonTitle: 'Login',
                                      onTap: controller.login,
                                    ),
                                  ),
                            SizedBox(height: context.heightPercentage(2)),
                          ],
                        ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
