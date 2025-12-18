import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/sign_in_controller.dart';
import '../../../../core/widgets/ibl_logo_widget.dart';
import '../../../../core/widgets/custom_text_field_widget.dart';
import '../../../../core/widgets/blue_purple_gradient_button_widget.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFF3C3C3C),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  // Logo and Together
                  const IblLogoWidget(),
                  const SizedBox(height: 16),
                  Text(
                    'together'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 60),
                  // User Login Title
                  Text(
                    'user_login'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Instruction text
                  Text(
                    'login_instruction'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  // Email or Telephone field
                  CustomTextFieldWidget(
                    label: 'email_or_telephone'.tr,
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  // Password field
                  CustomTextFieldWidget(
                    label: 'password'.tr,
                    controller: controller.passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 40),
                  // Sign In Button
                  BluePurpleGradientButtonWidget(
                    text: 'sign_in'.tr,
                    onPressed: controller.signIn,
                    isLoading: controller.isLoading,
                  ),
                  const SizedBox(height: 60),
                  // Copyright
                  Text(
                    'copyright'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

