import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_salah_yaaqba/controller/search_controller.dart';
import 'package:movie_salah_yaaqba/widget/empty_widget.dart';
import 'package:provider/provider.dart';

import '../../controller/favourite_controller.dart';
import '../../utilities/style/colors.dart';
import '../../widget/app_bar/custom_app_bar.dart';
import '../../widget/grid_view/custom_grid_view.dart';
import '../../widget/shimmer/shimmer_item_movie.dart';
import '../../widget/widget_movie_item/widget_movie_item.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  bool hasReachedIndex = false;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      PageSearchController pageSearchController =
          context.read<PageSearchController>();

      await pageSearchController.getSearch();

      scrollController.addListener(() async {
        if ((scrollController.position.pixels >=
            scrollController.position.maxScrollExtent)) {
          await pageSearchController.changeSpinHaveMoreData(true);
          await pageSearchController.getSearch();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageSearchController pageSearchController =
        context.watch<PageSearchController>();
    FavouriteController favouriteController =
        context.watch<FavouriteController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: pageSearchController.text.trim(),
        textNameLottie: "Back.json",
        backgroundColor: Colors.transparent,

        colorWidgets: CustomColor.blueColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child:
                  ((pageSearchController.movieList.isNotEmpty) &&
                          (pageSearchController.haveData == true))
                      ? CustomGridView(
                        builder: (context, index) {
                          if (index == pageSearchController.movieList.length) {
                            // Show loader at the end
                            return pageSearchController.showSpinKitMoreData
                                ? Center(
                                  child: SpinKitSpinningLines(
                                    color: CustomColor.blueColor,
                                    size: 30.h,
                                  ),
                                )
                                : SizedBox(); // Empty widget if not loading
                          }

                          bool favourite = favouriteController
                              .checkFavouriteItemImdbID(
                                imdbID:
                                    pageSearchController.movieList[index].imdbID
                                        .toString(),
                              );

                          return InkWell(
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            overlayColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                            onTap: () async {},
                            child: WidgetMovieItem(
                              favourite: favourite,
                              index: index,
                              movieItem: pageSearchController.movieList[index],
                            ),
                          );
                        },
                        scrollController: scrollController,
                        itemCount:
                            (pageSearchController.haveMoreData)
                                ? pageSearchController.movieList.length + 1
                                : pageSearchController.movieList.length,
                      )
                      : ((pageSearchController.haveData == true))
                      ? CustomGridView(
                        itemCount: 12,
                        scrollController: scrollController,
                        builder: (context, index) {
                          return ShimmerItemMovie();
                        },
                      )
                      : EmptyWidget(
                        text: "Movie not found!",
                        nameIcon: "Empty.json",
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
