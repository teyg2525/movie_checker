import 'dart:ui';

class AppColors {
  //Call to action colors
  static Color get ctaDefaultLight => Color(0xFF20333F);
  static const ctaPressedLight = Color(0xFF263E4E);
  static const ctaDisabledLight = Color(0xFFF1F1F1);
  static const ctaSecondaryLight = Color(0xFF7674E8);
  static Color get onCtaLight => const Color(0xFFFFFFFF);

  static Color get ctaDefaultDark => const Color(0xFFF9F9F9);
  static const ctaPressedDark = Color(0xFFFFFFFF);
  static const ctaDisabledDark = Color(0xFFF1F1F1);
  static const ctaSecondaryDark = Color(0xFF7674E8);
  static Color get onCtaDark => Color(0xFF20333F);

  //Text colors
  static const mainTextLight = Color(0xFF4C505A);
  static const secondaryTextLight = Color(0xFF7F828A);

  static const mainTextDark = Color(0xFFF5F5F5);
  static const secondaryTextDark = Color(0xFFC3C3C7);

  //Icon colors
  static const iconLight = Color(0xFF93949A);
  static const lineLight = Color(0xFFF1F1F1);

  static const iconDark = Color(0xFFE9E9E9);
  static const lineDark = Color(0xFF717171);

  //Complementary colors
  static const errorColor = Color(0xFFCF330B);
  static const successColor = Color(0xFF0BB559);
  static const inProgressColor = Color(0xFFDDAC00);
  static const infoColor = Color(0xFF4285F4);

  //Others color
  static const backgroundLight = Color(0xFFFFFFFF);
  static const cardBackgroundLight = Color(0xFFFFFFFF);

  static const backgroundDark = Color(0xFF161717);
  static const cardBackgroundDark = Color(0xFF2C2D33);
}
