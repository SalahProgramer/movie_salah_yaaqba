import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_salah_yaaqba/utilities/style/colors.dart';
import 'package:movie_salah_yaaqba/widget/image/custom_image_movie_item.dart';
import 'package:movie_salah_yaaqba/widget/lottie/lottie_widget.dart';
import 'package:movie_salah_yaaqba/widget/text/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../controller/page_movie_details_controller.dart';
import '../../model/movie_model.dart';
import '../../utilities/style/text_style.dart';
import '../../widget/widget_description_movie/animated_widget_Text.dart';
import '../../widget/widget_description_movie/bottom_widget_in_image.dart';
import '../../widget/widget_description_movie/top_widget_in_image.dart';

class MovieDescription extends StatefulWidget {
  final MovieModel movieItem;

  const MovieDescription({super.key, required this.movieItem});

  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      PageMovieDetailsController pageMovieDetailsController =
          context.read<PageMovieDetailsController>();
      await pageMovieDetailsController.getDataMovieDetails(
        imdbID: widget.movieItem.imdbID.toString(),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageMovieDetailsController pageMovieDetailsController =
        context.watch<PageMovieDetailsController>();


    Map<String, String> listDescription = {
      "Releasing On :": "${pageMovieDetailsController.movieDetails?.released}",
      "Runtime :": "${pageMovieDetailsController.movieDetails?.runtime}",
      "Genre :": "${pageMovieDetailsController.movieDetails?.genre}",
      "Director :": "${pageMovieDetailsController.movieDetails?.director}",
      "Writer :": "${pageMovieDetailsController.movieDetails?.writer}",
      "Actors :": "${pageMovieDetailsController.movieDetails?.actors}",
      "Language :": "${pageMovieDetailsController.movieDetails?.language}",
      "Country :": "${pageMovieDetailsController.movieDetails?.country}",
      "Awards :": "${pageMovieDetailsController.movieDetails?.awards}",
      "Meta Score :": "${pageMovieDetailsController.movieDetails?.metaScore}",
    };

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Hero(
                    tag: widget.movieItem.imdbID.toString(),
                    child: CustomImageMovieItem(
                      imageUrl: widget.movieItem.poster.toString(),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      ),

                      height: 0.4.sh,
                    ),
                  ),
                  BottomWidgetInImage(
                    movieItem: widget.movieItem,
                    textRating:
                        "${pageMovieDetailsController.movieDetails?.imdbRating}",
                  ),
                ],
              ),
              TopWidgetInImage(
                textYear: "${widget.movieItem.year}",
                textType: "${widget.movieItem.type}",
              ),
            ],
          ),
          SizedBox(height: 10.h),

          AnimatedWidgetMovie(
            title: "${widget.movieItem.title}",
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            textStyle: CustomTextStyle().rubik,
          ),

          Expanded(
            flex: 8,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 5.h),
              itemCount: listDescription.entries.toList().length,
              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 2.h),

              shrinkWrap: true,
              itemBuilder: (context, index) {
                String key = listDescription.keys.elementAt(index);
                String value = listDescription.values.elementAt(index);

                return Row(

                  children: [
                    LottieWidget(name: "point.json"),

                    CustomText(
                      text: "$key   ",
                      fontSize: 12.sp,

                      textStyle: CustomTextStyle().rubik,
                    ),
                  (pageMovieDetailsController.movieDetails!=null)
                    ?AnimatedWidgetMovie(
                      title: value,
                      maxLine: 70,


                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      textStyle: CustomTextStyle().rubik,
                      alignment: Alignment.topLeft,
                      fontSize: 12.sp,
                      doAnimate: true,
                      hasBorder: true,
                      color: CustomColor.blueColor,
                    ):                Expanded(
                child: Shimmer.fromColors(
                baseColor: Colors.grey[500]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                height: 8.h,
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                ),
                ),
                ),
                ),



                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
