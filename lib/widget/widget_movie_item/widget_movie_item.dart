import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:movie_salah_yaaqba/controller/page_movie_details_controller.dart';
import 'package:movie_salah_yaaqba/model/movie_model.dart';
import 'package:movie_salah_yaaqba/utilities/global/app_global.dart';
import 'package:movie_salah_yaaqba/utilities/style/colors.dart';
import 'package:movie_salah_yaaqba/view/movies/movie_description.dart';
import 'package:movie_salah_yaaqba/widget/text/custom_text.dart';
import 'package:vibration/vibration.dart';
import '../../controller/favourite_controller.dart';
import '../../controller/search_controller.dart';
import '../image/custom_image_movie_item.dart';
import 'package:provider/provider.dart';

class WidgetMovieItem extends StatefulWidget {
  final bool favourite;

  final int index;
  final MovieModel movieItem;

  const WidgetMovieItem({
    super.key,
    required this.favourite,
    required this.index,
    required this.movieItem,
  });

  @override
  State<WidgetMovieItem> createState() => _WidgetMovieItemState();
}

class _WidgetMovieItemState extends State<WidgetMovieItem> {
  @override
  Widget build(BuildContext context) {
    FavouriteController favouriteController =
        context.watch<FavouriteController>();

    PageSearchController pageSearchController =
        context.watch<PageSearchController>();
    PageMovieDetailsController pageMovieDetailsController=context.watch<PageMovieDetailsController>();
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      onTap: () async {
        await pageMovieDetailsController.clear();
        NavigatorApp.push(MovieDescription(movieItem: widget.movieItem));
      },
      child: AnimatedGradientBorder(
        gradientColors: [CustomColor.blueColor, CustomColor.chrismasColor],
        borderRadius: BorderRadius.circular(5.r),
        glowSize: 2,
        borderSize: 1,
        child: Container(
          // margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Colors.white,
          ),

          child: Column(
            children: [
              Expanded(
                child: CustomImageMovieItem(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.r),
                    topLeft: Radius.circular(5.r),
                  ),
                  borderCircle: 5.r,
                  boxFit: BoxFit.fill,
                  imageUrl: widget.movieItem.poster ?? "",
                ),
              ),
              SizedBox(height: 5.h),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: CustomText(
                          text: widget.movieItem.year.toString(),
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 9.w),
                      child: InkWell(
                        overlayColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                        onTap: () async {
                          if (await favouriteController.checkFavouriteItemMovie(
                                imdbID: widget.movieItem.imdbID,
                              ) ==
                              false) {
                            await pageSearchController.changeIsFavourite(
                              widget.movieItem.imdbID.toString(),
                              true,
                            );

                            await favouriteController.insertData(
                              title: widget.movieItem.title,
                              imdbID: widget.movieItem.imdbID,
                              poster: widget.movieItem.poster,
                              type: widget.movieItem.type,
                              year: widget.movieItem.year,
                            );
                            Vibration.vibrate(duration: 100);
                          } else {
                            await favouriteController.deleteItemMovie(
                              imdbID: widget.movieItem.imdbID,
                            );
                          }
                        },
                        child: Icon(
                          FontAwesome.heart,
                          color:
                              (widget.favourite == true)
                                  ? CustomColor.primaryColor
                                  : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "${widget.movieItem.title.toString()}\n",
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
