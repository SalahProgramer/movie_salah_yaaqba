import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'animated_widget_Text.dart';

class TopWidgetInImage extends StatelessWidget {
  final String textYear;
  final String textType;
  const TopWidgetInImage({super.key, required this.textYear, required this.textType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black12, Colors.black87],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedWidgetMovie(

            title: textYear,
            color: Colors.white,
            fontSize: 18.sp,
          ),
          AnimatedWidgetMovie(

            title: textType,
            color: Colors.white,
            fontSize: 18.sp,
            alignment: Alignment.topRight,
          ),
        ],
      ),
    );
  }
}
