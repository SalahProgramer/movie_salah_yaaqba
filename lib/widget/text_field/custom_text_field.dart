import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/style/text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final dynamic prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validate;
  final TextInputType? inputType;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  final TextEditingController? controller;
  final String label;
  final TextAlign textAlign;
  final bool? alignLabelWithHint;
  final bool hasTap;
  final bool hasFocusBorder;
  final bool hasFill;
  final int? maxLines;
  final int? maxLength;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  // final FocusNode? focusNode;

  final dynamic controlPage;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.validate,
    required this.inputType,
    required this.controller,
    this.label = "",
    required this.controlPage,
    this.textAlign = TextAlign.start,
    this.alignLabelWithHint = false,
    this.hasTap = false,
    this.onTap,
    this.hasFocusBorder = true,
    this.hasFill = true,
    required this.maxLines,
    this.hintStyle,
    this.textStyle,
    this.onChanged,
    this.suffixIcon,
    this.maxLength,
    this.focusNode,

    // this.focusNode
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      selectionControls: DesktopTextSelectionControls(),
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onTap: (widget.hasTap == false) ? null : widget.onTap,
      cursorColor: (widget.hasTap == false) ? Colors.black : Colors.transparent,
      validator: widget.validate,
      keyboardType: widget.inputType,
      controller: widget.controller,
      textDirection: TextDirection.ltr,
      focusNode: widget.focusNode,
      maxLines: widget.maxLines,
      style:
          widget.textStyle ??
          CustomTextStyle().rubik.copyWith(
            fontSize: 14.sp,
            color: Colors.black,

            fontWeight: FontWeight.bold,
          ),

      textAlign: widget.textAlign,
      canRequestFocus: (widget.hasFill) ? true : false,

      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: (widget.hasFill) ? Colors.white70 : Colors.transparent,
        filled: (widget.hasFill) ? true : false,
        alignLabelWithHint: widget.alignLabelWithHint,
        hintStyle:
            widget.hintStyle ??
            CustomTextStyle().rubik.copyWith(
              color: Colors.black45,
              fontSize: 12.sp,
            ),
        label:
            (widget.label != "")
                ? Text(
                  widget.label,
                  style: CustomTextStyle().rubik.copyWith(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                )
                : null,
        errorMaxLines: 3,
        border:
            (widget.hasFocusBorder)
                ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                )
                : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
        enabledBorder:
            (widget.hasFocusBorder)
                ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.blueGrey.shade100,
                  ),
                )
                : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
        focusedBorder:
            (widget.hasFocusBorder)
                ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide:
                      (widget.hasFocusBorder)
                          ? BorderSide(color: Colors.black, width: 1)
                          : BorderSide(
                            width: 0,
                            color: Colors.blueGrey.shade100,
                          ),
                )
                : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
