import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_salah_yaaqba/widget/text/custom_text.dart';
import 'package:provider/provider.dart';

import '../../controller/favourite_controller.dart';
import '../../utilities/style/colors.dart';
import '../../widget/app_bar/custom_app_bar.dart';
import '../../widget/empty_widget.dart';
import '../../widget/widget_favourite/widget_favourite_card.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    FavouriteController favouriteController =
        context.watch<FavouriteController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Favourite",
        textNameLottie: "Back.json",
        backgroundColor: Colors.transparent,

        colorWidgets: CustomColor.blueColor,
      ),
      body:
          (favouriteController.favouriteItems.isEmpty)
              ? Center(
                child: EmptyWidget(
                  text: "There are no movies in the favorites.",
                  nameIcon: "favourite.json",
                  fontSize: 14.sp,
                ),
              )
              : SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
                  child: Column(
                    children: [
                      SizedBox(height: 5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 5.w),
                          Flexible(
                            flex: 2,
                            child: CustomText(
                              text: "Number of products in favourites: ",
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CustomText(
                              text:
                                  "${favouriteController.favouriteItems.length}",
                              color: CustomColor.blueColor,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Expanded(
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: favouriteController.favouriteItems.length,
                          itemBuilder: (context, index) {
                            final reversedIndex =
                                favouriteController.favouriteItems.length -
                                1 -
                                index;
                            return WidgetFavouriteCard(
                              index: reversedIndex,
                              favouriteItem:
                                  favouriteController
                                      .favouriteItems[reversedIndex],

                              // checkInCart: check,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
