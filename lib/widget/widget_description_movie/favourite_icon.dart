import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

import '../../controller/favourite_controller.dart';
import '../../controller/search_controller.dart';
import '../../model/movie_model.dart';
import '../../utilities/style/colors.dart';

class FavouriteIcon extends StatefulWidget {
  final MovieModel movieItem;

  const FavouriteIcon({super.key, required this.movieItem});

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  @override
  Widget build(BuildContext context) {
    FavouriteController favouriteController =
    context.watch<FavouriteController>();
    PageSearchController pageSearchController =
    context.watch<PageSearchController>();

    bool favourite = favouriteController.checkFavouriteItemImdbID(
      imdbID: (widget.movieItem.imdbID),
    );
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: InkWell(
        overlayColor: WidgetStatePropertyAll(
          Colors.transparent,
        ),
        onTap: () async {
          if (await favouriteController
              .checkFavouriteItemMovie(
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
          size: 20.h,
          color:
          (favourite == true)
              ? CustomColor.primaryColor
              : Colors.white,
        ),
      ),
    );
  }
}
