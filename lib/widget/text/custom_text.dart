import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilities/style/colors.dart';
import '../../utilities/style/text_style.dart';

class CustomText extends StatelessWidget {


  final String text;
  final double? fontSize;
  final Color? color;
  const CustomText({super.key, required this.text, this.fontSize, this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        maxLines: 2,
        style: CustomTextStyle().rubik.copyWith(
          fontSize: fontSize??19.sp,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,


          color: color??CustomColor.blueColor,

        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
