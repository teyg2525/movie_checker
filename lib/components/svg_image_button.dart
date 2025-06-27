import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImageButton extends StatelessWidget {
  const SvgImageButton({
    required this.onPressed,
    required this.asset,
    super.key,
  });

  final Function() onPressed;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onPressed, child: SvgPicture.asset(asset));
  }
}
