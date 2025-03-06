import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/style/text_style.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final int? maxLine;
  final TextStyle? textStyle;
  final AlignmentGeometry? alignment;
  const CustomText({super.key, required this.text, this.fontSize, this.color, this.maxLine, this.alignment, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment?? Alignment.center,
      child: Text(
        text,
        maxLines:maxLine??2,
        style: (textStyle?? CustomTextStyle().rubik).copyWith(
          fontSize: fontSize ?? 19.sp,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,

          color: color ?? Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
