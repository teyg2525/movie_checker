import 'package:flutter/material.dart';
import 'package:movie_checker/extensions/context_extension.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({this.color, this.strokeWidth, super.key});

  final Color? color;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) => Align(
    child: CircularProgressIndicator(
      strokeWidth: strokeWidth ?? 4,
      color: color ?? context.customScheme.ctaDefaultColor,
    ),
  );
}
