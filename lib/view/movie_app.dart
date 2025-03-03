import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:movie_salah_yaaqba/view/start_screen.dart';

import '../utilities/global/app_global.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        fontSizeResolver: FontSizeResolvers.height,
        ensureScreenSize: true,
        splitScreenMode: true,
        minTextAdapt: true,
        enableScaleWH: () => true,
        enableScaleText: () => true,
        builder: (_, child) {
          return
            MaterialApp(
              navigatorKey: NavigatorApp.navigatorKey,
              debugShowCheckedModeBanner: false,
              builder: (context, child) => Overlay(
                initialEntries: [
                  OverlayEntry(
                      builder: (context) => ResponsiveBreakpoints.builder(
                        child: child!,
                        breakpoints: [
                          const Breakpoint(start: 0, end: 450, name: MOBILE),
                          const Breakpoint(
                              start: 451, end: 800, name: TABLET),
                          const Breakpoint(
                              start: 801, end: 1920, name: DESKTOP),
                          const Breakpoint(
                              start: 1921, end: double.infinity, name: '4K'),
                        ],
                      )),
                ],
              ),
              title: 'Movies',


              home: child,

            )
          ;
        },
        child: StartScreen());
  }
}
