import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:glowy_borders/glowy_borders.dart';
import 'package:movie_salah_yaaqba/utilities/style/colors.dart';
import '../../utilities/global/app_global.dart';
import '../../utilities/style/text_style.dart';
import '../svg/custom_svg_picture.dart';

Future<void> messageSnackBar({
  required String text,
  required String nameIcon,
  ColorFilter? colorFilter,
}) async {
  ScaffoldMessenger.of(NavigatorApp.context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      duration: const Duration(milliseconds: 1100),
      content: AnimatedGradientBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSize: 2,
        glowSize: 0,
        gradientColors:
            (nameIcon == "warning")
                ? [Colors.yellow, Colors.yellowAccent.withValues(alpha: 0.7)]
                : [Colors.black, CustomColor.blueColor],
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
          ),
          child: ListTile(
            title: Text(
              text,
              style: CustomTextStyle().rubik.copyWith(
                color: Colors.black,
                fontSize: 12.sp,
              ),
            ),
            leading:
                (nameIcon == "")
                    ? null
                    : CustomSvgPicture(
                      nameIcon: nameIcon,
                      heightIcon: 16.h,
                      colorFilter:
                          (nameIcon == "")
                              ? null
                              : (colorFilter == null)
                              ? null
                              : ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    ),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                "assets/images/nabeeh_movie.png",
                width: 32.w,
                height: 32.w,
              ),
            ),

            // IconSvgWithoutBorder(
            //   nameIcon: 'icons/save.svg',
            //   onPressed: null,
            //   // colorFilter: ,
            // ),
          ),
        ),
      ),
    ),
  );
}

Future<void> messageError(String description) async {
  ScaffoldMessenger.of(NavigatorApp.context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      duration: const Duration(milliseconds: 1100),
      content: AnimatedGradientBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSize: 2,
        glowSize: 0,
        gradientColors: const [Colors.red, Colors.red],

        // animationProgress: ,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
          ),
          child: ListTile(
            title: Text(
              description,
              style: CustomTextStyle().heading1L.copyWith(
                color: Colors.black,
                fontSize: 12.sp,
              ),
            ),
            leading: CustomSvgPicture(nameIcon: "error", heightIcon: 19.h),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                "assets/images/nabeeh_movie.png",
                width: 27.w,
                height: 27.w,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Future<void> messageWarning(String description) async {
  ScaffoldMessenger.of(NavigatorApp.context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      duration: const Duration(milliseconds: 1100),
      content: AnimatedGradientBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSize: 2,
        glowSize: 0,
        gradientColors: const [Colors.yellow, Colors.yellowAccent],

        // animationProgress: ,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
          ),
          child: ListTile(
            title: Text(
              description,
              style: CustomTextStyle().rubik.copyWith(fontSize: 12.sp),
            ),
            leading: const CustomSvgPicture(nameIcon: "warning"),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                "assets/images/nabeeh_movie.png",
                width: 27.w,
                height: 27.w,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
