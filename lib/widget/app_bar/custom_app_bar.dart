import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/style/text_style.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color? shadowColor;
  final Color? colorWidgets;
  final Color? backgroundColor;
  final String title;
  final String textLeading;
  final List<Widget>? actions;
  @override
  final Size preferredSize;

  CustomAppBar({
    super.key,
    this.shadowColor,
    this.colorWidgets,
    required this.title,
    required this.textLeading,
    this.actions,
    this.backgroundColor,
  }) : preferredSize = Size.fromHeight(50.h);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15.r),
          bottomLeft: Radius.circular(15.r),

        ),
      ),
      shadowColor: widget.shadowColor ?? Colors.black87,

      backgroundColor: widget.backgroundColor ?? Colors.transparent,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Text(
          widget.title,
          style: CustomTextStyle().rubik.copyWith(
            fontSize: 18.sp,
            color: widget.colorWidgets ?? Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // leading: Padding(
      //   padding: EdgeInsets.only(top: 8.h),
      //   child: Align(
      //     alignment: Alignment.center,
      //     child: CustomTextButton(
      //         text: widget.textButton,
      //         textStyle: CustomTextStyle().heading1L.copyWith(
      //             fontSize: 14.sp,
      //             color: widget.colorWidgets ?? Colors.black,
      //             fontWeight: FontWeight.bold),
      //         onPressed: widget.onPressed),
      //   ),
      // ),
      actions: widget.actions ?? [],
    );
  }
}
