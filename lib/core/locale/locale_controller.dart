import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localeControllerProvider =
    NotifierProvider<LocaleController, Locale?>(LocaleController.new);

class LocaleController extends Notifier<Locale?> {
  static const _localeKey = 'locale_code';

  @override
  Locale? build() {
    _loadLocale();
    return null; // null = usar idioma do sistema
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString(_localeKey);

    state = switch (savedLocale) {
      'en' => const Locale('en'),
      'pt' => const Locale('pt'),
      _ => null,
    };
  }

  Future<void> setLocale(Locale? locale) async {
    state = locale;

    final prefs = await SharedPreferences.getInstance();

    if (locale == null) {
      await prefs.remove(_localeKey);
      return;
    }

    await prefs.setString(_localeKey, locale.languageCode);
  }
}