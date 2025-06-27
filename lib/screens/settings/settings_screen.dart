import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_checker/components/custom_dropdown.dart';
import 'package:movie_checker/components/svg_image_button.dart';
import 'package:movie_checker/extensions/context_extension.dart';
import 'package:movie_checker/gen/assets.gen.dart';
import 'package:movie_checker/l10n/app_localizations.dart';
import 'package:movie_checker/l10n/language.dart';
import 'package:movie_checker/providers/app_config/app_config_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _firebaseUrlController;

  @override
  void initState() {
    _firebaseUrlController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _firebaseUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final textStyles = context.textStyles;
    final scheme = context.customScheme;
    const locales = AppLocalizations.supportedLocales;

    final appProvider = context.watch<AppConfigProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SvgImageButton(
            onPressed: () => context.router.back(),
            asset: Assets.icons.close,
          ),
        ),
        title: Text(
          localization.settings,
          style: textStyles.roboto18MediumMain,
        ),
        centerTitle: false,
        backgroundColor: scheme.onCtaColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SettingRow(
                title: localization.darkMode,
                setting: Switch(
                  activeColor: textStyles.ctaDefaultColor,
                  value: appProvider.brightness == Brightness.dark,
                  onChanged: (value) => appProvider.setBrightness(
                    value ? Brightness.dark : Brightness.light,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomDropdown<Locale>(
                title: localization.language,
                locales
                    .map(
                      (l) => DropdownMenuItem<Locale>(
                        child: Text(
                          l.languageCode,
                          style: textStyles.roboto14RegularMain,
                        ),
                        value: l,
                      ),
                    )
                    .toList(),
                appProvider.language.value,
                (item) {
                  if (item is Locale) {
                    appProvider.setLanguage(Language.fromLocale(item));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingRow extends StatelessWidget {
  const SettingRow({required this.title, required this.setting, super.key});

  final String title;
  final Widget setting;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: textStyles.roboto16RegularMain),
        const SizedBox(width: 4),
        setting,
      ],
    );
  }
}
