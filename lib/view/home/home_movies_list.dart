import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_salah_yaaqba/widget/app_bar/custom_app_bar.dart';
import 'package:movie_salah_yaaqba/widget/lottie/lottie_widget.dart';
import 'package:movie_salah_yaaqba/widget/text/custom_text.dart';
import 'package:provider/provider.dart';

import '../../controller/search_controller.dart';
import '../../utilities/style/colors.dart';
import '../../widget/text_field/custom_text_field.dart';

class HomeMoviesList extends StatefulWidget {
  const HomeMoviesList({super.key});

  @override
  State<HomeMoviesList> createState() => _HomeMoviesListState();
}

class _HomeMoviesListState extends State<HomeMoviesList> {
  @override
  Widget build(BuildContext context) {
    PageSearchController pageSearchController =
        context.watch<PageSearchController>();
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            title: "Search Movies",
            textLeading: "",
            colorWidgets: CustomColor.blueColor,
          ),

          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 5.h,),


                  Image(
                    image: const AssetImage("assets/images/nabeeh_movie.png"),
                    width: 0.5.sw,

                    height: 0.20.sh,

                    // 90% of screen width
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20.h,),
                  CustomText(
                    text:
                        "Discover and Explore: Your Ultimate Guide to Finding the Perfect Movie",
                  ),
                  SizedBox(height: 20.h),

                  CustomTextFormField(
                    hintText: 'Search for a movie by title',
                    inputType: TextInputType.text,
                    controller: pageSearchController.textSearch,
                    controlPage: pageSearchController,
                    maxLines: 1,
                    prefixIcon: LottieWidget(name: "Searching Movie.json"),
                    hasFill: true,
                    hasFocusBorder: false,
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
