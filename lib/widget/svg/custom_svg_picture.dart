import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgPicture extends StatelessWidget {
  final String? nameIcon;
  final ColorFilter? colorFilter;
  final double? heightIcon;

  const CustomSvgPicture({
    super.key,
    required this.nameIcon,
    this.colorFilter,
    this.heightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return (colorFilter != null)
        ? SvgPicture.asset(
          "assets/icons/${nameIcon!}.svg",
          height: heightIcon ?? 34.h,
          clipBehavior: Clip.none,
          colorFilter:
              colorFilter ??
              const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        )
        : SvgPicture.asset(
          "assets/icons/${nameIcon!}.svg",
          height: heightIcon ?? 34.h,
          clipBehavior: Clip.none,
        );
  }
}
