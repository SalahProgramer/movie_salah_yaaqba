import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_salah_yaaqba/utilities/global/app_global.dart';
import 'package:movie_salah_yaaqba/view/home/search_movies.dart';
import '../utilities/style/colors.dart';
import '../utilities/style/text_style.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      NavigatorApp.pushAndRemoveUntil(SearchMovies());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage("assets/images/nabeeh_movie.png"),
                width: 0.5.sw,

                height: 0.35.sh,

                // 90% of screen width
                fit: BoxFit.contain,
              ),
              Text(
                "NABEEH MOVIES",

                textAlign: TextAlign.center,
                style: CustomTextStyle().rubik.copyWith(
                  color: Colors.black,
                  fontSize: 22.sp,
                  height: 1.2.h,
                ),
              ),
              SizedBox(height: 40.h),
              SpinKitSpinningLines(color: CustomColor.blueColor, size: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
