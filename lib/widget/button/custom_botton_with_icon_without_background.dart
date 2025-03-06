import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utilities/style/text_style.dart';
import '../svg/custom_svg_picture.dart';

class CustomButtonWithIconWithoutBackground extends StatefulWidget {
  final String text;
  final String textIcon;
  final void Function()? onPressed;
  final bool hasBackground;
  final double? height;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  final bool? noChoiceSize;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final TextStyle? textStyle;
  final ColorFilter? colorFilter;
  final IconAlignment? iconAlignment;

  const CustomButtonWithIconWithoutBackground({
    super.key,
    required this.text,
    required this.textIcon,
    required this.onPressed,
    this.padding,
    this.hasBackground = false,
    this.height,
    this.isLoading = false,
    this.textStyle,
    this.elevation,
    this.backgroundColor,
    this.colorFilter,
    this.iconAlignment,
    this.borderRadius,
    this.noChoiceSize,
  });

  @override
  State<CustomButtonWithIconWithoutBackground> createState() =>
      _CustomButtonWithIconWithoutBackgroundState();
}

class _CustomButtonWithIconWithoutBackgroundState
    extends State<CustomButtonWithIconWithoutBackground> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      iconAlignment: widget.iconAlignment ?? IconAlignment.end,
      clipBehavior: Clip.none,
      style: ElevatedButton.styleFrom(
        padding: widget.padding ?? EdgeInsets.zero,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10.r),
        ),
        shadowColor: Colors.transparent,
        overlayColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        backgroundColor:
            (widget.hasBackground)
                ? widget.backgroundColor ?? Colors.white.withValues(alpha: 0.9)
                : Colors.transparent,
        elevation: widget.elevation ?? 0,
      ),
      onPressed: widget.onPressed,
      icon:
          (widget.textIcon == "")
              ? null
              : CustomSvgPicture(
                nameIcon: widget.textIcon,
                colorFilter: widget.colorFilter,
                heightIcon: widget.height ?? 20.h,
              ),
      label: Text(
        widget.text,
        style: widget.textStyle ?? CustomTextStyle().rubik,
      ),
    );
  }
}
