import 'package:flutter/material.dart';
import 'package:movie_checker/extensions/context_extension.dart';
import 'package:movie_checker/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({required this.onPressed, super.key});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final scheme = context.customScheme;
    final textStyles = context.textStyles;

    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.icons.back,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              scheme.mainTextColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 4),
          Text(localization.back, style: textStyles.roboto16MediumMain),
        ],
      ),
    );
  }
}
