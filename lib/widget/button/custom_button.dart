import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utilities/style/text_style.dart';
import '../lottie/lottie_widget.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final String textIcon;
  final void Function()? onPressed;
  final bool hasBackground;
  final double? height;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final TextStyle? textStyle;
  final ColorFilter? colorFilter;
  final IconAlignment? iconAlignment;
  final BorderSide? borderSide;

  const CustomButton(
      {super.key,
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
        this.borderSide});

  @override
  State<CustomButton> createState() =>
      _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        iconAlignment: widget.iconAlignment ?? IconAlignment.end,
        clipBehavior: Clip.none,
        style: ElevatedButton.styleFrom(
            padding: widget.padding ?? EdgeInsets.zero,
            alignment: Alignment.center,

            shape: RoundedRectangleBorder(
                side: widget.borderSide ?? BorderSide.none,
                borderRadius:
                widget.borderRadius ?? BorderRadius.circular(10.r)),
            shadowColor: Colors.transparent,
            overlayColor: Colors.transparent,
            foregroundColor: Colors.black,
            backgroundColor: (widget.hasBackground)
                ? widget.backgroundColor ?? Colors.white.withValues(alpha: 0.9)
                : Colors.transparent,
            elevation: widget.elevation ?? 0),
        onPressed: widget.onPressed,
        icon: (widget.textIcon == "")
            ? SizedBox()
            : (widget.isLoading == false)
            ?  LottieWidget(
          name: widget.textIcon,
          width: widget.height ?? 40.w,
          height: widget.height ?? 40.w,
        )

            : Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: SizedBox(
            width: 30.w,
            height: 30.w,
            child: SpinKitFadingCircle(
              color: Colors.white,
              size: 20.h,
            ),
          ),
        ),
        label: Text(widget.text,
            style: widget.textStyle ?? CustomTextStyle().heading1L));
  }
}