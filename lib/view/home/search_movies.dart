import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:movie_salah_yaaqba/utilities/global/app_global.dart';
import 'package:movie_salah_yaaqba/utilities/validations/validation.dart';
import 'package:movie_salah_yaaqba/view/movies/movies_list.dart';
import 'package:movie_salah_yaaqba/widget/app_bar/custom_app_bar.dart';
import 'package:movie_salah_yaaqba/widget/lottie/lottie_widget.dart';
import 'package:movie_salah_yaaqba/widget/text/custom_text.dart';
import 'package:provider/provider.dart';

import '../../controller/favourite_controller.dart';
import '../../controller/search_controller.dart';
import '../../utilities/style/colors.dart';
import '../../widget/button/custom_button.dart';
import '../../widget/text_field/custom_text_field.dart';
import 'favourite_page.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FavouriteController favouriteController =
          context.read<FavouriteController>();
      favouriteController.getFavouriteMovies();
    });
    super.initState();
  }

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
            textNameLottie: "",
            backgroundColor: CustomColor.blueColor,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.w, top: 8.h),
                child: InkWell(
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  onTap: () {
                    NavigatorApp.pushAnimation(FavouritePage(), Offset(0, 1));
                  },
                  child: Icon(FontAwesome.heart, color: Colors.white),
                ),
              ),
            ],
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
                                  await Future.delayed(
                                    Duration(milliseconds: 200),
                                  );
                                  if (formKey.currentState!.validate()) {
                                    // dialogWaiting();
                                    await pageSearchController.clear();
                                    NavigatorApp.pushAnimation(
                                      MoviesList(),
                                      Offset(-1, 0),
                                    );
                                  } else {}
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
