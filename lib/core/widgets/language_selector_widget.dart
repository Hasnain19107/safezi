import 'package:flutter/material.dart';
import 'flag_button_widget.dart';
import 'flag_widgets.dart';

class LanguageSelectorWidget extends StatelessWidget {
  final Locale currentLocale;
  final Future<void> Function(Locale) onLanguageChanged;

  const LanguageSelectorWidget({
    super.key,
    required this.currentLocale,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlagButtonWidget(
          onTap: () => onLanguageChanged(const Locale('en', 'US')),
          isSelected: currentLocale.languageCode == 'en',
          child: const UKFlagWidget(),
        ),
        const SizedBox(width: 20),
        FlagButtonWidget(
          onTap: () => onLanguageChanged(const Locale('fr', 'FR')),
          isSelected: currentLocale.languageCode == 'fr',
          child: const FrenchFlagWidget(),
        ),
        const SizedBox(width: 20),
        FlagButtonWidget(
          onTap: () => onLanguageChanged(const Locale('mru', 'MU')),
          isSelected: currentLocale.languageCode == 'mru',
          child: const MauritiusFlagWidget(),
        ),
      ],
    );
  }
}

