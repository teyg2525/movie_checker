import 'package:flutter/material.dart';
import 'package:movie_checker/extensions/context_extension.dart';

class WatchedIndicator extends StatelessWidget {
  const WatchedIndicator({required this.watched, super.key});

  final bool watched;

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final textStyles = context.textStyles;
    return Text(
      watched ? localization.watched : localization.planned,
      style: watched
          ? textStyles.roboto14RegularSuccess
          : textStyles.roboto14RegularInfo,
    );
  }
}
