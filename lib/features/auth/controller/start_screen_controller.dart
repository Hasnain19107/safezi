import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreenController extends GetxController {
  final String _languageKey = 'selected_language';
  
  Locale _currentLocale = const Locale('en', 'US');

  Locale get currentLocale => _currentLocale;

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString(_languageKey);
    if (savedLang != null) {
      final parts = savedLang.split('_');
      if (parts.length == 2) {
        _currentLocale = Locale(parts[0], parts[1]);
        Get.updateLocale(_currentLocale);
      }
    }
  }

  Future<void> changeLanguage(Locale locale) async {
    _currentLocale = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, '${locale.languageCode}_${locale.countryCode}');
    
    // Update locale - this will trigger a rebuild of all widgets using translations
    Get.updateLocale(locale);
    
    // Force rebuild by updating the controller
    // This will refresh the page with new translations
    update();
  }

  void onStartPressed() {
    // Navigate to sign-in screen
    Get.toNamed('/sign-in');
  }
}

