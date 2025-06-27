import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_checker/components/svg_image_button.dart';
import 'package:movie_checker/config/app_router.gr.dart';
import 'package:movie_checker/extensions/context_extension.dart';
import 'package:movie_checker/gen/assets.gen.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final textStyles = context.textStyles;
    final scheme = context.customScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.movies, style: textStyles.roboto18MediumMain),
        actions: [
          SvgImageButton(
            onPressed: () => context.router.push(SettingsRoute()),
            asset: Assets.icons.settings,
          ),
        ],
        centerTitle: false,
        backgroundColor: scheme.onCtaColor,
        elevation: 0,
      ),

      body: SafeArea(
        child: ListView.separated(
          itemCount: 10,
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return Container(child: Text('test' + index.toString()));
          },
          separatorBuilder: (context, index) =>
              Divider(color: scheme.lineColor),
        ),
      ),
    );
  }
}
