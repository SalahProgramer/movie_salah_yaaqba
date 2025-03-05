import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_salah_yaaqba/utilities/style/colors.dart';

import '../../../utilities/global/app_global.dart';
import '../../../utilities/style/text_style.dart';

Future<void> dialogWaiting() {
  return showDialog(
    context: NavigatorApp.context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Waiting",
              style: CustomTextStyle().rubik.copyWith(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1),
            ),
            SizedBox(height: 20.h),
            SpinKitThreeBounce(
              color: Colors.white,
              size: 25.w,
            ),
          ],
        ),
      );
    },
  );
}
