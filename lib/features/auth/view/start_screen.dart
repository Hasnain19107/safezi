import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/start_screen_controller.dart';
import '../../../../core/widgets/ibl_logo_widget.dart';
import '../../../../core/widgets/gradient_button_widget.dart';
import '../../../../core/widgets/language_selector_widget.dart';

class StartScreen extends GetView<StartScreenController> {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartScreenController>(
      init: StartScreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFF3C3C3C),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top section - Logo and Together
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const IblLogoWidget(),
                      const SizedBox(height: 16),
                      // TOGETHER text
                      Text(
                        'together'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                // Middle section - Title, Subtitle, Start button
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App Title
                      Text(
                        'app_title'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      // Subtitle
                      Text(
                        'subtitle'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      // Start Button
                      GradientButtonWidget(
                        text: 'start'.tr,
                        onPressed: controller.onStartPressed,
                      ),
                    ],
                  ),
                ),
                // Language flags
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LanguageSelectorWidget(
                        currentLocale: controller.currentLocale,
                        onLanguageChanged: controller.changeLanguage,
                      ),
                      const SizedBox(height: 20),
                      // Powered by text
                      Text(
                        'powered_by'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom - Copyright
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'copyright'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
