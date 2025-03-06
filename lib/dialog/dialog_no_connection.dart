import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/global/app_global.dart';
import '../utilities/style/colors.dart';
import '../utilities/style/text_style.dart';
import '../widget/button/custom_botton_with_icon_without_background.dart';

Future<void> noConnection() {
  return showGeneralDialog(
    context: NavigatorApp.context,
    useRootNavigator: true,
    barrierDismissible: false,
    pageBuilder: (context, animation, secondaryAnimation) {
      return CupertinoAlertDialog(
        insetAnimationCurve: Curves.bounceInOut,
        title: const Icon(FontAwesomeIcons.wifi, color: Colors.red),
        content: Column(
          children: [
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Text(
                "No connection, check network",
                style: CustomTextStyle().rubik.copyWith(
                  color: Colors.black54,
                  fontSize: 11.sp,
                ),
              ),
            ),
          ],
        ),
        actions: [
          CustomButtonWithIconWithoutBackground(
            text: "Yes",
            textIcon: "yes",
            height: 20.h,

            textStyle: CustomTextStyle().rubik.copyWith(
              color: CustomColor.blueColor,
              fontSize: 12.sp,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
