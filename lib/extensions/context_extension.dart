import 'package:flutter/material.dart';
import 'package:movie_checker/l10n/app_localizations.dart';
import 'package:movie_checker/style/text_styles.dart';
import 'package:movie_checker/style/theme.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;

  CustomScheme get customScheme => CustomScheme.of(this);

  TextStyles get textStyles => TextStyles.of(this);
}
