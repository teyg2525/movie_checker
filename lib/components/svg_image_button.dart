import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_checker/extensions/context_extension.dart';

class SvgImageButton extends StatelessWidget {
  const SvgImageButton({
    required this.onPressed,
    required this.asset,
    this.size,
    super.key,
  });

  final Function() onPressed;
  final String asset;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final scheme = context.customScheme;

    return InkWell(
      onTap: onPressed,
      child: SvgPicture.asset(
        asset,
        width: size ?? 24,
        height: size ?? 24,
        colorFilter: ColorFilter.mode(scheme.ctaDefaultColor, BlendMode.srcIn),
      ),
    );
  }
}
