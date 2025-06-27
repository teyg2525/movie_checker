import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_checker/l10n/app_localizations.dart';
import 'package:movie_checker/l10n/language.dart';
import 'package:movie_checker/services/preferences/preferences_service.dart';

@LazySingleton()
class AppConfigProvider extends ChangeNotifier {
  final PreferencesService _preferencesService;

  AppConfigProvider(this._preferencesService)
    : brightness = _getBrightness(),
      language = _getLang();

  Brightness brightness;
  Language language;

  Future setLanguage(Language newLang) async {
    await _preferencesService.saveLanguage(newLang.value.languageCode);

    language = newLang;
    notifyListeners();
  }

  Future setBrightness(Brightness newBrightness) async {
    await _preferencesService.saveBrightness(brightness.toString());

    brightness = newBrightness;
    notifyListeners();
  }

  Future adjustCurrentBrightnessToSaved(Brightness currentBrightness) async {
    final saved = await _preferencesService.getBrightness();

    if (saved.isEmpty) {
      setBrightness(currentBrightness);
    } else if (saved != currentBrightness.toString()) {
      setBrightness(
        currentBrightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      );
    }
  }

  Future adjustCurrentLanguageToSaved() async {
    final saved = await _preferencesService.getLanguage();

    if (saved.isEmpty) {
      setLanguage(language);
    } else {
      final loc = Locale(saved);

      if (loc != language.value) {
        setLanguage(Language.fromLocale(loc));
      }
    }
  }

  static Language _getLang() => Language.fromLocale(getPrefferedLocale());

  static Brightness _getBrightness() =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  static Locale getPrefferedLocale() {
    final preferred = PlatformDispatcher.instance.locales.first;
    return preferred.languageCode == 'ru' || preferred.languageCode == 'uk'
        ? AppLocalizations.supportedLocales.firstWhere(
            (l) => l.languageCode == 'uk',
          )
        : AppLocalizations.supportedLocales.firstWhere(
            (l) => l.languageCode == 'en',
          );
  }
}
