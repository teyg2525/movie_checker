import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_checker/extensions/context_extension.dart';
import 'package:movie_checker/style/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.title = '',
    this.focusNode,
    this.onTap,
    this.label,
    this.onSubmitted,
    this.onChanged,
    this.controller,
    this.enabled = true,
    this.placeholder,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.max = 999999,
    this.filled = false,
    this.prefixIcon,
    this.errorMaxLines = 1,
    this.maxLines = 1,
    this.expands = false,
    this.focusedColor,
    this.errorText,
    this.valid = true,
    this.inputFormatters,
    this.textInputAction = TextInputAction.done,
    this.borderRadius = 8,
  });

  final String title;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  final String? placeholder;
  final String? errorText;
  final String? label;
  final bool filled;
  final int errorMaxLines;
  final int? maxLines;
  final bool expands;
  final Widget? prefixIcon;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final bool enabled;
  final bool valid;
  final bool readOnly;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Color? focusedColor;
  final int max;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;

    return title.isEmpty
        ? _CustomField(
            focusNode: focusNode,
            controller: controller,
            textInputAction: textInputAction,
            onSubmitted: onSubmitted,
            inputFormatters: inputFormatters,
            maxLines: maxLines,
            expands: expands,
            onChanged: onChanged,
            valid: valid,
            errorText: errorText,
            errorMaxLines: errorMaxLines,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            filled: filled,
            borderRadius: borderRadius,
            placeholder: placeholder,
            label: label,
            obscureText: obscureText,
            keyboardType: keyboardType,
            enabled: enabled,
            max: max,
            readOnly: readOnly,
            onTap: onTap,
          )
        : Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(title, style: textStyles.roboto14RegularMain),
                ),
              ),
              _CustomField(
                focusNode: focusNode,
                controller: controller,
                textInputAction: textInputAction,
                onSubmitted: onSubmitted,
                inputFormatters: inputFormatters,
                maxLines: maxLines,
                expands: expands,
                onChanged: onChanged,
                valid: valid,
                errorText: errorText,
                errorMaxLines: errorMaxLines,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                filled: filled,
                borderRadius: borderRadius,
                placeholder: placeholder,
                label: label,
                obscureText: obscureText,
                keyboardType: keyboardType,
                enabled: enabled,
                max: max,
                readOnly: readOnly,
                onTap: onTap,
              ),
            ],
          );
  }
}

class _CustomField extends StatelessWidget {
  const _CustomField({
    required this.focusNode,
    required this.controller,
    required this.textInputAction,
    required this.onSubmitted,
    required this.inputFormatters,
    required this.maxLines,
    required this.expands,
    required this.onChanged,
    required this.valid,
    required this.errorText,
    required this.errorMaxLines,
    required this.suffixIcon,
    required this.prefixIcon,
    required this.filled,
    required this.borderRadius,
    required this.placeholder,
    required this.label,
    required this.obscureText,
    required this.keyboardType,
    required this.enabled,
    required this.max,
    required this.readOnly,
    required this.onTap,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final void Function(String p1)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final bool expands;
  final void Function(String p1)? onChanged;
  final bool valid;
  final String? errorText;
  final int errorMaxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool filled;
  final double borderRadius;
  final String? placeholder;
  final String? label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool enabled;
  final int max;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;

    return TextField(
      focusNode: focusNode,
      controller: controller,
      textInputAction: maxLines == null
          ? TextInputAction.newline
          : textInputAction,
      textAlignVertical: TextAlignVertical.top,
      onSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      expands: expands,
      onChanged: onChanged,
      decoration: InputDecoration(
        errorText: valid ? null : errorText,
        errorMaxLines: errorMaxLines,
        counterStyle: textStyles.roboto14RegularMain,
        counterText: '12/128',
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(right: 8),
                child: suffixIcon,
              ),
        prefixIcon: prefixIcon,
        filled: filled,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.errorColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.errorColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textStyles.mainTextColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textStyles.ctaPressedColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textStyles.ctaDisabledColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        counter: const SizedBox.shrink(),
        hintText: placeholder,
        hintMaxLines: maxLines ?? 2,
        labelText: label,
        isDense: true,
        hintStyle: textStyles.roboto14RegularSecondary,
        labelStyle: textStyles.roboto14RegularMain,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 20,
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      enabled: enabled,
      maxLength: max,
      readOnly: readOnly,
      autocorrect: false,
      onTap: onTap,
    );
  }
}
