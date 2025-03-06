import 'package:flutter/cupertino.dart';
import 'package:movie_salah_yaaqba/helpers/helper.dart';
import 'package:movie_salah_yaaqba/model/movie_details_model.dart';

import '../service/api/api_movie.dart';

class MovieDetailsController extends ChangeNotifier {
  ApiMovie apiDetailsMovie = ApiMovie();
  MovieDetailsModel? movieDetails;

  Future<void> getDataMovieDetails({required String imdbID}) async {
    MovieDetailsModel? short;

    short = await apiDetailsMovie.apiDetailsMovie(imdbID: imdbID);
    if (short != null) {
      movieDetails = short;
      // short is not null, so you can safely use it
      printLog("Movie Title: ${movieDetails?.title}");
    } else {
      // Handle the case when short is null
      printLog("Movie details not found.");
    }

    notifyListeners();
  }

  Future<void> clear() async {
    movieDetails = null;
    notifyListeners();
  }
}
