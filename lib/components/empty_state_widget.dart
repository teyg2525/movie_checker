import 'package:flutter/material.dart';
import 'package:movie_checker/extensions/context_extension.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget(this.description, {this.title, super.key});

  final String description;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final textStyles = context.textStyles;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ?? localization.empty,
            style: textStyles.roboto18BoldMain,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: textStyles.roboto16RegularSecondary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
