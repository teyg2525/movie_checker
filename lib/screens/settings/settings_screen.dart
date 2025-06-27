import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_checker/components/svg_image_button.dart';
import 'package:movie_checker/extensions/context_extension.dart';
import 'package:movie_checker/gen/assets.gen.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final textStyles = context.textStyles;
    final scheme = context.customScheme;

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
          padding: const EdgeInsets.all(20),
          child: Column(children: []),
        ),
      ),
    );
  }
}
