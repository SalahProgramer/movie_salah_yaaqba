import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/style/text_style.dart';
import 'lottie/lottie_widget.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  final String nameIcon;
  final double? fontSize;

  const EmptyWidget({
    super.key,
    required this.text,
    required this.nameIcon,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            style: CustomTextStyle().rubik.copyWith(
              fontSize: fontSize ?? 18.sp,
              height: 1.2.h,
              color: Colors.black,
            ),
            text,
          ),
          SizedBox(height: 5.h),
          LottieWidget(name: nameIcon, width: 120.w, height: 120.w),
        ],
      ),
    );
  }
}
