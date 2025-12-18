import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/action_card_widget.dart';


class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              // Blurred background image
              _buildBlurredBackground(),
              // Main content
              Column(
                  children: [
                    // Header
                    HomeHeaderWidget(
                      userName: controller.userName,
                      userAvatarUrl: controller.userAvatarUrl,
                      onAvatarTap: controller.onAvatarTap,
                    ),
                    const SizedBox(height: 40),
                    // Greeting
                    Text(
                      '${controller.getGreeting()} ${controller.userName}!',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Action Cards Grid
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 1.1,
                              children: [
                                // Top-Left: Report an issue (Blue to Purple)
                                ActionCardWidget(
                                  gradientColors: const [
                                    Color(0xFF4B39EF),
                                    Color(0xFF7C3AED),
                                    Color(0xFF9333EA),
                                  ],
                                  icon: Icons.description,
                                  text: 'report_an_issue'.tr,
                                  onTap: controller.onReportIssueTap,
                                ),
                                // Top-Right: Emergency contacts (Pink to Magenta)
                                ActionCardWidget(
                                  gradientColors: const [
                                    Color(0xFFEC4899),
                                    Color(0xFFDB2777),
                                    Color(0xFFBE185D),
                                  ],
                                  icon: Icons.phone,
                                  text: 'emergency_contacts'.tr,
                                  onTap: controller.onEmergencyContactsTap,
                                ),
                                // Bottom-Left: Checklist (Orange to Yellow)
                                ActionCardWidget(
                                  gradientColors: const [
                                    Color(0xFFF97316),
                                    Color(0xFFFB923C),
                                    Color(0xFFFBBF24),
                                  ],
                                  icon: Icons.check_box,
                                  text: 'checklist'.tr,
                                  onTap: controller.onChecklistTap,
                                ),
                                // Bottom-Right: Messages (Teal to Dark Blue)
                                ActionCardWidget(
                                  gradientColors: const [
                                    Color(0xFF14B8A6),
                                    Color(0xFF0D9488),
                                    Color(0xFF0F766E),
                                  ],
                                  icon: Icons.message,
                                  text: 'messages'.tr,
                                  onTap: controller.onMessagesTap,
                                ),
                                ActionCardWidget(
                                  gradientColors: const [
                                    Color(0xFF60A5FA),
                                    Color(0xFF3B82F6),
                                    Color(0xFF06B6D4),
                                  ],
                                  icon: Icons.play_arrow,
                                  text: 'learn'.tr,
                                  onTap: controller.onPlayTap,),
                                  ActionCardWidget(
                                    gradientColors: const [
                                      Color(0xFF10B981),
                                      Color(0xFF059669),
                                      Color(0xFF047857),
                                    ],
                                    icon: Icons.emoji_events,
                                    text: 'play'.tr,
                                    onTap: controller.onPlayTap,),
                              ],
                            ),
                            const SizedBox(height: 24),
                            // Learn and Play Buttons
                           
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              
            ],
          ),
        );
      },
    );
  }

  Widget _buildBlurredBackground() {
    return Stack(
      children: [
        // Background image
        Image.asset(
          'assets/images/warehouse_background.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to gradient if image not found
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1A1A1A),
                    Color(0xFF2D2D2D),
                    Color(0xFF1A1A1A),
                  ],
                ),
              ),
            );
          },
        ),
        // Dark overlay
        Container(
          color: Colors.black.withValues(alpha: 0.6),
        ),
        // Blur effect
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }

  Widget _buildLearnPlayButton({
    required List<Color> gradientColors,
    required Widget icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradientColors.first.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon,
                  const SizedBox(height: 8),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
