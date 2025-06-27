import 'package:flutter/material.dart';
import 'package:movie_checker/style/colors.dart';

class TextStyles {
  static String _fontFamily = 'Roboto';
  static String get fontFamily => _fontFamily;
  static const comicSansMsFontFamily = 'ComicSansMS';
  static const boldFontWeigth = FontWeight.bold;
  static const mediumFontWeigth = FontWeight.w500;
  static const regularFontWeigth = FontWeight.w400;

  static setFontFamily(String style) => _fontFamily = style;

  TextStyles({
    required this.mainTextColor,
    required this.secondaryTextColor,
    required this.ctaDefaultColor,
    required this.onCtaColor,
    required this.ctaSecondaryColor,
    required this.ctaPressedColor,
    required this.ctaDisabledColor,
  });

  final Color mainTextColor;
  final Color secondaryTextColor;
  final Color ctaDefaultColor;
  final Color onCtaColor;
  final Color ctaSecondaryColor;
  final Color ctaPressedColor;
  final Color ctaDisabledColor;

  factory TextStyles.of(BuildContext context) =>
      TextStyles.fromTheme(Theme.of(context));

  factory TextStyles.fromTheme(ThemeData theme) =>
      TextStyles.fromBrightness(theme.brightness);

  factory TextStyles.fromBrightness(Brightness brightness) =>
      switch (brightness) {
        Brightness.light => TextStyles.light(),
        Brightness.dark => TextStyles.dark(),
      };

  factory TextStyles.light() => TextStyles(
    mainTextColor: AppColors.mainTextLight,
    secondaryTextColor: AppColors.secondaryTextLight,
    ctaDefaultColor: AppColors.ctaDefaultLight,
    onCtaColor: AppColors.onCtaLight,
    ctaSecondaryColor: AppColors.ctaSecondaryLight,
    ctaPressedColor: AppColors.ctaPressedLight,
    ctaDisabledColor: AppColors.ctaDisabledLight,
  );

  factory TextStyles.dark() => TextStyles(
    mainTextColor: AppColors.mainTextDark,
    secondaryTextColor: AppColors.secondaryTextDark,
    ctaDefaultColor: AppColors.ctaDefaultDark,
    onCtaColor: AppColors.onCtaDark,
    ctaSecondaryColor: AppColors.ctaSecondaryDark,
    ctaPressedColor: AppColors.ctaPressedDark,
    ctaDisabledColor: AppColors.ctaDisabledDark,
  );

  TextStyle get roboto32MediumMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: mediumFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto22BoldMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: boldFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto22MediumMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: mediumFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto18MediumMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: mediumFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto18RegularSecondary => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: regularFontWeigth,
    color: secondaryTextColor,
  );

  TextStyle get roboto18MediumSecondary => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: mediumFontWeigth,
    color: secondaryTextColor,
  );

  TextStyle get roboto18BoldMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: boldFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto16MediumSecondary => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: mediumFontWeigth,
    color: secondaryTextColor,
  );

  TextStyle get roboto16MediumSuccess => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: mediumFontWeigth,
    color: AppColors.successColor,
  );

  TextStyle get roboto16MediumMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: mediumFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto16MediumCtaSecondary => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: mediumFontWeigth,
    color: ctaSecondaryColor,
  );

  TextStyle get roboto16MediumCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: mediumFontWeigth,
    color: ctaDefaultColor,
  );

  TextStyle get roboto16MediumError => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: mediumFontWeigth,
    color: AppColors.errorColor,
  );

  TextStyle get roboto16MediumOnCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: mediumFontWeigth,
    color: onCtaColor,
  );

  TextStyle get roboto16RegularOnCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: regularFontWeigth,
    color: onCtaColor,
  );

  TextStyle get roboto16BoldMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: boldFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto16BoldOnCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: boldFontWeigth,
    color: onCtaColor,
  );

  TextStyle get roboto16RegularCtaSecondary => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: regularFontWeigth,
    color: ctaSecondaryColor,
  );

  TextStyle get roboto14MediumMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: mediumFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto14MediumSecondary => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: mediumFontWeigth,
    color: secondaryTextColor,
  );

  TextStyle get roboto14MediumCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: mediumFontWeigth,
    color: ctaDefaultColor,
  );

  TextStyle get roboto14MediumCtaPressed => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: mediumFontWeigth,
    color: ctaPressedColor,
  );

  TextStyle get roboto14RegularOnCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: regularFontWeigth,
    color: onCtaColor,
  );

  TextStyle get roboto14MediumOnCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: mediumFontWeigth,
    color: onCtaColor,
  );

  TextStyle get roboto14MediumError => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: mediumFontWeigth,
    color: AppColors.errorColor,
  );

  TextStyle get roboto14MediumInProgress => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: mediumFontWeigth,
    color: AppColors.inProgressColor,
  );

  TextStyle get roboto14MediumInfo => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: mediumFontWeigth,
    color: AppColors.infoColor,
  );

  TextStyle get roboto14MediumSuccess => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: mediumFontWeigth,
    color: AppColors.successColor,
  );

  TextStyle get roboto14BoldMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: boldFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto24Regular => TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: regularFontWeigth,
  );

  TextStyle get roboto22RegularMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: regularFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto22RegularCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: regularFontWeigth,
    color: ctaDefaultColor,
  );

  TextStyle get roboto20Regular => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: regularFontWeigth,
  );

  TextStyle get roboto20BoldMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: boldFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto20MediumMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: mediumFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto20BoldCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: boldFontWeigth,
    color: ctaDefaultColor,
  );

  TextStyle get roboto18RegularMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: regularFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto16RegularMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: regularFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto16RegularSecondary => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: regularFontWeigth,
    color: secondaryTextColor,
  );

  TextStyle get roboto16RegularCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: regularFontWeigth,
    color: ctaDefaultColor,
  );

  TextStyle get roboto16RegularError => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: regularFontWeigth,
    color: AppColors.errorColor,
  );

  TextStyle get roboto14RegularMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: regularFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto14RegularInfo => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: regularFontWeigth,
    color: AppColors.infoColor,
  );

  TextStyle get roboto14RegularCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: regularFontWeigth,
    color: ctaDefaultColor,
  );

  TextStyle get roboto14RegularSecondary => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: regularFontWeigth,
    color: secondaryTextColor,
  );

  TextStyle get roboto14RegularSuccess => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: regularFontWeigth,
    color: AppColors.successColor,
  );

  TextStyle get roboto14RegularError => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: regularFontWeigth,
    color: AppColors.errorColor,
  );

  TextStyle get roboto14RegularInProgress => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: regularFontWeigth,
    color: AppColors.inProgressColor,
  );

  TextStyle get roboto12RegularMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: regularFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto12MediumMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: mediumFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto12BoldMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: boldFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto12BoldOnCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: boldFontWeigth,
    color: onCtaColor,
  );

  TextStyle get roboto12RegularError => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: regularFontWeigth,
    color: AppColors.errorColor,
  );

  TextStyle get roboto12RegularOnCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: regularFontWeigth,
    color: onCtaColor,
  );

  TextStyle get roboto12RegularSecondary => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: regularFontWeigth,
    color: secondaryTextColor,
  );

  TextStyle get roboto12RegularInProgress => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: regularFontWeigth,
    color: AppColors.inProgressColor,
  );

  TextStyle get roboto10RegularMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: regularFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto10MediumMain => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: mediumFontWeigth,
    color: mainTextColor,
  );

  TextStyle get roboto10RegularOnCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: regularFontWeigth,
    color: onCtaColor,
  );

  TextStyle get roboto10RegularSecondary => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: regularFontWeigth,
    color: secondaryTextColor,
  );

  TextStyle get roboto10RegularInfo => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: regularFontWeigth,
    color: AppColors.infoColor,
  );

  TextStyle get roboto10RegularInProgress => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: regularFontWeigth,
    color: AppColors.inProgressColor,
  );

  TextStyle get roboto10MediumInProgress => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: mediumFontWeigth,
    color: AppColors.inProgressColor,
  );

  TextStyle get roboto10MediumOnCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: mediumFontWeigth,
    color: onCtaColor,
  );

  TextStyle get roboto10BoldOnCta => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: boldFontWeigth,
    color: onCtaColor,
  );

  TextStyle get roboto10RegularSuccess => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: regularFontWeigth,
    color: AppColors.successColor,
  );

  TextStyle get roboto10RegularError => TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: regularFontWeigth,
    color: AppColors.errorColor,
  );

  TextStyle get comicSansMs12RegularOnCta => TextStyle(
    fontFamily: comicSansMsFontFamily,
    fontSize: 12,
    fontWeight: regularFontWeigth,
    color: onCtaColor,
  );

  TextStyle get transparent => const TextStyle(color: Colors.transparent);
}
