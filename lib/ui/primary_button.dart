import 'package:workmanager_example/constant.dart';
import 'package:workmanager_example/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double? maxWidth;
  final double? maxHeight;
  final TextStyle? style;
  final Color? borderColor;
  final double? borderWidth;
  final Color? textColor;
  final double? paddingWidth;
  final double? paddingHeight;
  const PrimaryButton(
      {Key? key,
      this.onPressed,
      required this.label,
      this.borderRadius,
      this.backgroundColor,
      this.borderColor = Colors.transparent,
      this.textColor = Colors.white,
      this.borderWidth = 0.0,
      this.maxWidth = double.infinity,
      this.maxHeight = 59,
      this.style,
      this.paddingWidth,
      this.paddingHeight})
      : super(key: key);

  const PrimaryButton.outlineColor(
      {Key? key,
      this.onPressed,
      required this.label,
      this.borderRadius,
      this.backgroundColor = Colors.transparent,
      this.borderColor = primaryColor,
      this.textColor = primaryColor,
      this.borderWidth = 1.0,
      this.maxWidth = double.infinity,
      this.maxHeight = 45,
      this.style,
      this.paddingWidth,
      this.paddingHeight})
      : super(key: key);
  const PrimaryButton.outline(
      {Key? key,
      this.onPressed,
      required this.label,
      this.borderRadius,
      this.backgroundColor = Colors.transparent,
      this.borderColor = contentColor,
      this.textColor = contentColor,
      this.borderWidth = 1.0,
      this.maxWidth = double.infinity,
      this.maxHeight = 52,
      this.style,
      this.paddingWidth,
      this.paddingHeight})
      : super(key: key);
  const PrimaryButton.noBorder(
      {Key? key,
      this.onPressed,
      required this.label,
      this.borderRadius,
      this.backgroundColor = const Color.fromRGBO(237, 239, 244, 0.6),
      this.borderColor = Colors.transparent,
      this.textColor = contentColor,
      this.borderWidth = 1.0,
      this.maxWidth = double.infinity,
      this.maxHeight = 45,
      this.style,
      this.paddingWidth,
      this.paddingHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: onPressed ?? () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: paddingWidth ?? 0,
          vertical: paddingHeight ?? 0,
        ),
        width: paddingWidth != null ? null : maxWidth,
        height: paddingHeight != null ? null : maxHeight,
        decoration: BoxDecoration(
          color: backgroundColor ?? primaryColor,
          border: Border.all(width: borderWidth!, color: borderColor!),
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
        child: Center(
            child: Text(label,
                style: style ??
                    buttonTitleStyle.copyWith(color: textColor, fontSize: 18))),
      ),
    );
  }
}
