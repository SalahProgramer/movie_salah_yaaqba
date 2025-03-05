import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_salah_yaaqba/utilities/global/app_global.dart';
import 'package:movie_salah_yaaqba/utilities/validations/validation.dart';
import 'package:movie_salah_yaaqba/view/movies/movies_list.dart';
import 'package:movie_salah_yaaqba/widget/app_bar/custom_app_bar.dart';
import 'package:movie_salah_yaaqba/widget/lottie/lottie_widget.dart';
import 'package:movie_salah_yaaqba/widget/text/custom_text.dart';
import 'package:provider/provider.dart';

import '../../controller/search_controller.dart';
import '../../dialog/dialog_waiting.dart';
import '../../utilities/style/colors.dart';
import '../../widget/button/custom_button.dart';
import '../../widget/text_field/custom_text_field.dart';

class HomeMoviesList extends StatefulWidget {
  const HomeMoviesList({super.key});

  @override
  State<HomeMoviesList> createState() => _HomeMoviesListState();
}

class _HomeMoviesListState extends State<HomeMoviesList> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          backgroundColor: Colors.white.withValues(alpha: 0.93),
          appBar: CustomAppBar(
            title: "Search Movies",
            textLeading: "",
            backgroundColor: CustomColor.blueColor,

            colorWidgets: Colors.white,
          ),

          body: Form(
            key: formKey,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.h),

                    Image(
                      image: const AssetImage("assets/images/nabeeh_movie.png"),
                      width: 0.5.sw,

                      height: 0.22.sh,

                      // 90% of screen width
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 20.h),
                    CustomText(
                      text:
                          "Discover and Explore: Your Ultimate Guide to Finding the Perfect Movie",
                    ),
                    SizedBox(height: 40.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: CustomTextFormField(
                        hintText: 'Search for a movie by title',

                        inputType: TextInputType.text,
                        controller: pageSearchController.textSearch,
                        controlPage: pageSearchController,
                        onChanged: (p0) async {
                          await pageSearchController.changeText(p0);
                        },

                        validate: (p0) {
                          return Validation.checkText(
                            p0?.trim().toString() ?? "",
                            "search",
                          );
                        },
                        maxLines: 1,
                        prefixIcon: LottieWidget(name: "Searching Movie.json"),
                        hasFill: true,
                        hasFocusBorder: false,
                      ),
                    ),
                    SizedBox(height: 30.h),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 0.2.sw),
                      width: double.maxFinite,
                      child: CustomButton(
                        text: 'Search',
                        textIcon: '',
                        hasBackground: true,
                        backgroundColor: CustomColor.blueColor,
                        padding: EdgeInsets.symmetric(vertical: 10.w),
                        onPressed:
                            (pageSearchController.text == "")
                                ? null
                                : () async {
                          FocusScope.of(context).unfocus();
                                  if (formKey.currentState!.validate()) {
                                    // dialogWaiting();




                                    NavigatorApp.pushAnimation(MoviesList());
                                  } else {



                                  }
                                },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
