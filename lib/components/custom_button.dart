import 'package:flutter/material.dart';
import 'package:movie_checker/style/text_styles.dart';
import 'package:movie_checker/style/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color,
    this.child,
    this.onPressed,
    this.enabled = true,
    this.label = '',
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
    this.minimumSize = const Size.fromHeight(52),
    this.isLoading = false,
    this.showBorder = false,
    this.loaderColor,
    this.density,
  });

  final bool isLoading;
  final VoidCallback? onPressed;
  final Color? color;
  final EdgeInsets padding;
  final String label;
  final bool enabled;
  final TextStyle? textStyle;
  final Widget? child;
  final Color? loaderColor;
  final Size minimumSize;
  final bool showBorder;
  final VisualDensity? density;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = CustomScheme.fromTheme(theme);
    final textStyles = TextStyles.fromBrightness(theme.brightness);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize,
        backgroundColor: color ?? scheme.ctaDefaultColor,
        foregroundColor: textStyle?.color ?? scheme.onCtaColor,
        disabledBackgroundColor: Colors.transparent,
        disabledForegroundColor: scheme.lineColor,
        textStyle: textStyle ?? textStyles.roboto16BoldOnCta,
        padding: padding,
        visualDensity: density,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: showBorder
              ? BorderSide(color: textStyle?.color ?? scheme.onCtaColor)
              : BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: !enabled || isLoading ? null : onPressed,
      child: isLoading ? _loadingChild() : _defaultChild(),
    );
  }

  Widget _defaultChild() => child ?? Text(label);
  Widget _loadingChild() => SizedBox(
    height: minimumSize.height - padding.vertical,
    width: minimumSize.height - padding.vertical,
    child: CircularProgressIndicator(color: loaderColor),
  );
}
