import 'dart:ui';

class Language {
  const Language(this.value, this.text);

  final Locale value;
  final String text;

  factory Language.fromLocale(Locale locale) => Language(locale, '');
}
