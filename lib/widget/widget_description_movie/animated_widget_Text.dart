import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_salah_yaaqba/utilities/style/text_style.dart';
import 'package:provider/provider.dart';

import '../../controller/page_movie_details_controller.dart';
import '../text/custom_text.dart';

class AnimatedWidgetMovie extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final bool? doAnimate;
  final bool? hasBorder;
  final int? maxLine;
  final TextStyle? textStyle;

  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;

  const AnimatedWidgetMovie({
    super.key,
    required this.title,
    this.alignment,
    this.color,
    this.fontSize,
    this.doAnimate = false,
    this.padding,
    this.textStyle,
    this.maxLine,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    PageMovieDetailsController pageMovieDetailsController =
        context.watch<PageMovieDetailsController>();
    return Flexible(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0.0),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 900),
          opacity:
              (doAnimate == false)
                  ? 1
                  : (pageMovieDetailsController.movieDetails == null)
                  ? 0
                  : 1,
          child:
              (hasBorder == true)
                  ? AnimatedContainer(
                duration: Duration(milliseconds: 900),

                padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.white70,

                      borderRadius: BorderRadius.circular(5.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0,
                          blurRadius: 5.r,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: customText(),
                  )
                  : customText(),
        ),
      ),
    );
  }

  Widget customText() {
    return CustomText(
      text: title,
      color: color ?? Colors.black,
      alignment: alignment ?? AlignmentDirectional.topStart,
      maxLine: maxLine ?? 2,
      fontSize: fontSize ?? 16.sp,
      textStyle: textStyle ?? CustomTextStyle().lobster,
    );
  }
}
