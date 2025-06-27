import 'package:flutter/material.dart';
import 'package:movie_checker/style/colors.dart';

ColorScheme lightColorScheme = ColorScheme.light(
  brightness: Brightness.light,
  primary: AppColors.ctaDefaultLight,
  onPrimary: AppColors.onCtaLight,
  secondary: AppColors.ctaDefaultLight,
  onSecondary: AppColors.onCtaLight,
  surface: AppColors.backgroundLight,
);

ColorScheme darkColorScheme = ColorScheme.dark(
  brightness: Brightness.dark,
  primary: AppColors.ctaDefaultDark,
  onPrimary: AppColors.onCtaDark,
  secondary: AppColors.ctaDefaultDark,
  onSecondary: AppColors.onCtaDark,
  surface: AppColors.backgroundDark,
);

class CustomScheme {
  const CustomScheme({
    required this.ctaDefaultColor,
    required this.ctaPressedColor,
    required this.ctaDisabledColor,
    required this.ctaSecondaryColor,
    required this.onCtaColor,
    required this.mainTextColor,
    required this.secondaryTextColor,
    required this.iconColor,
    required this.lineColor,
    required this.backgroundColor,
    required this.cardBackgroundColor,
  });

  final Color ctaDefaultColor;
  final Color ctaPressedColor;
  final Color ctaDisabledColor;
  final Color ctaSecondaryColor;
  final Color onCtaColor;
  final Color mainTextColor;
  final Color secondaryTextColor;
  final Color iconColor;
  final Color lineColor;
  final Color backgroundColor;
  final Color cardBackgroundColor;

  factory CustomScheme.light() => CustomScheme(
    ctaDefaultColor: AppColors.ctaDefaultLight,
    ctaPressedColor: AppColors.ctaPressedLight,
    ctaDisabledColor: AppColors.ctaDisabledLight,
    ctaSecondaryColor: AppColors.ctaSecondaryLight,
    onCtaColor: AppColors.onCtaLight,
    mainTextColor: AppColors.mainTextLight,
    secondaryTextColor: AppColors.secondaryTextLight,
    iconColor: AppColors.iconLight,
    lineColor: AppColors.lineLight,
    backgroundColor: AppColors.backgroundLight,
    cardBackgroundColor: AppColors.cardBackgroundLight,
  );

  factory CustomScheme.dark() => CustomScheme(
    ctaDefaultColor: AppColors.ctaDefaultDark,
    ctaPressedColor: AppColors.ctaPressedDark,
    ctaDisabledColor: AppColors.ctaDisabledDark,
    ctaSecondaryColor: AppColors.ctaSecondaryDark,
    onCtaColor: AppColors.onCtaDark,
    mainTextColor: AppColors.mainTextDark,
    secondaryTextColor: AppColors.secondaryTextDark,
    iconColor: AppColors.iconDark,
    lineColor: AppColors.lineDark,
    backgroundColor: AppColors.backgroundDark,
    cardBackgroundColor: AppColors.cardBackgroundDark,
  );

  factory CustomScheme.of(BuildContext context) =>
      CustomScheme.fromTheme(Theme.of(context));

  factory CustomScheme.fromTheme(ThemeData theme) =>
      CustomScheme.fromBrightness(theme.brightness);

  factory CustomScheme.fromBrightness(Brightness brightness) =>
      switch (brightness) {
        Brightness.light => CustomScheme.light(),
        Brightness.dark => CustomScheme.dark(),
      };
}
