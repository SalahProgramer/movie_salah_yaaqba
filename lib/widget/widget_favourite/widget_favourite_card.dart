import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_salah_yaaqba/model/movie_model.dart';
import 'package:movie_salah_yaaqba/widget/image/custom_image_movie_item.dart';
import 'package:movie_salah_yaaqba/widget/widget_favourite/slidable_favourite_widget.dart';
import '../../dialog/dialog_delete_favourite_item.dart';
import '../../utilities/style/colors.dart';
import '../../utilities/style/text_style.dart';
import 'package:flutter/cupertino.dart';

import '../messages/messages.dart';

class WidgetFavouriteCard extends StatefulWidget {
  final int index;
  final MovieModel favouriteItem;

  const WidgetFavouriteCard({
    super.key,
    required this.index,
    required this.favouriteItem,
  });

  @override
  State<WidgetFavouriteCard> createState() => _WidgetFavouriteCardState();
}

class _WidgetFavouriteCardState extends State<WidgetFavouriteCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      overlayColor: WidgetStateColor.transparent,
      onTap: () {},
      child: SlidableFavouriteWidget(
        index: widget.index,
        card: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: card(context, widget.favouriteItem),
        ),
        onPressed: () async {
          await onPopDeleteFavouriteItem(imdbID: widget.favouriteItem.imdbID);

          await messageSnackBar(
            text: "The movie has been removed.",
            nameIcon: "",
          );
        },
      ),
    );
  }

  Widget text({required String name, Color? color, double? size}) {
    return Flexible(
      child: Text(
        name,
        textDirection: TextDirection.rtl,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: CustomTextStyle().rubik.copyWith(
          fontWeight: FontWeight.bold,
          color: color ?? CustomColor.blueColor,
          fontSize: size ?? 14.sp,
        ),
      ),
    );
  }

  Widget card(BuildContext context, MovieModel item) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        // side: BorderSide(color: Colors.black,width: 0.0),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomImageMovieItem(
                      imageUrl: widget.favouriteItem.poster ?? "",
                      height: 100.h,
                      boxFit: BoxFit.fill,
                      borderCircle: 10.r,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5.w),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.favouriteItem.title ?? "",
                          textDirection: TextDirection.rtl,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyle().rubik.copyWith(
                            fontWeight: FontWeight.bold,
                            color: CustomColor.blueColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.w),

                        text(
                          name: " ${widget.favouriteItem.year}",
                          color: Colors.black,
                        ),

                        Row(
                          children: [
                            InkWell(
                              overlayColor: WidgetStateColor.transparent,
                              highlightColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              onTap: () async {
                                await onPopDeleteFavouriteItem(
                                  imdbID: widget.favouriteItem.imdbID,
                                );

                                await messageSnackBar(
                                  text: "The movie has been removed.",
                                  nameIcon: "",
                                );
                              },
                              child: Icon(
                                CupertinoIcons.delete,
                                color: CustomColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
