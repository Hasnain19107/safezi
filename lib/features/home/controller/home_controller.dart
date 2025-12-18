import 'package:get/get.dart';

class HomeController extends GetxController {
  String userName = 'Kevin';
  String? userAvatarUrl;

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
  }

  void _loadUserData() {
    // TODO: Load user data from storage/API
    // For now, using default values
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'good_morning'.tr;
    } else if (hour < 17) {
      return 'good_afternoon'.tr;
    } else {
      return 'good_evening'.tr;
    }
  }

  void onReportIssueTap() {
    // TODO: Navigate to report issue screen
    Get.snackbar(
      'Info',
      'Report an issue feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onEmergencyContactsTap() {
    // TODO: Navigate to emergency contacts screen
    Get.snackbar(
      'Info',
      'Emergency contacts feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onChecklistTap() {
    // TODO: Navigate to checklist screen
    Get.snackbar(
      'Info',
      'Checklist feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onMessagesTap() {
    // TODO: Navigate to messages screen
    Get.snackbar(
      'Info',
      'Messages feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onAvatarTap() {
    // TODO: Navigate to profile screen
    Get.snackbar(
      'Info',
      'Profile feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onLearnTap() {
    // TODO: Navigate to learn screen
    Get.snackbar(
      'Info',
      'Learn feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onPlayTap() {
    // TODO: Navigate to play screen
    Get.snackbar(
      'Info',
      'Play feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

