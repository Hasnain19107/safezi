import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'core/app_routes/app_routes.dart';
import 'core/utilities/theme_util.dart';
import 'core/translations/app_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await ThemeUtil.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Map GetX locale to MaterialLocalizations locale
  Locale _getMaterialLocale(Locale? locale) {
    if (locale == null) return const Locale('en', 'US');
    
    // If locale is 'mru', use 'en' for MaterialLocalizations
    // but GetX translations will still use 'mru_MU'
    if (locale.languageCode == 'mru') {
      return const Locale('en', 'US');
    }
    
    return locale;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safezi - v1',
      theme: ThemeUtil.lightTheme,
      darkTheme: ThemeUtil.darkTheme,
      themeMode: ThemeUtil.themeMode,
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      // Use a builder to map GetX locale to MaterialLocalizations locale
      builder: (context, child) {
        final locale = Get.locale;
        return Localizations.override(
          context: context,
          locale: _getMaterialLocale(locale),
          child: child ?? const SizedBox(),
        );
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
        Locale('mru', 'MU'),
      ],
    );
  }
}
