import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/movie_model.dart';
import 'animated_widget_text.dart';
import 'favourite_icon.dart';

class BottomWidgetInImage extends StatelessWidget {
  final MovieModel movieItem;
  final String textRating;

  const BottomWidgetInImage({super.key, required this.movieItem, required this.textRating});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
        horizontal: 5.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black87, Colors.black12],
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Icon(Icons.star,color: Colors.yellow,
          size: 20.h,),
          SizedBox(width: 5.w,),
          AnimatedWidgetMovie(
            title:
            textRating,
            doAnimate: true,
            fontSize: 14.sp,
            padding: EdgeInsets.only(top: 3.h),
            color: Colors.white,
          ),

          Spacer(),
          FavouriteIcon(
            movieItem: movieItem,
          ),
        ],
      ),
    );
  }
}
