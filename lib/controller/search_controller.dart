import 'package:flutter/cupertino.dart';
import 'package:movie_salah_yaaqba/model/movie_model.dart';
import '../service/api/api_movie.dart';
import '../utilities/global/app_global.dart';
import 'favourite_controller.dart';
import 'package:provider/provider.dart';

class PageSearchController extends ChangeNotifier {
  TextEditingController textSearch = TextEditingController();
  String text = "";
  ApiMovie apiSearchMovie = ApiMovie();
  int numberPage = 1;
  List<MovieModel> movieList = [];
  bool haveMoreData = true;
  bool haveData = true;
  bool showSpinKitMoreData = false;
  Map<String, bool> isFavourite = {};

  FavouriteController favouriteController =
      NavigatorApp.context.read<FavouriteController>();

  Future<void> changeText(String changeText) async {
    text = changeText.trim();
    notifyListeners();
  }

  Future<void> changeIsFavourite(String id, bool newIsFavourite) async {
    isFavourite[id] = newIsFavourite;
    notifyListeners();
  }

  Future<void> clear() async {
    movieList = [];
    haveMoreData = true;
    haveData = true;
    numberPage = 1;
    notifyListeners();
  }

  Future<void> changeSpinHaveMoreData(bool check) async {
    showSpinKitMoreData = check;
    notifyListeners();
  }

  Future<void> getSearch() async {
    List<MovieModel> short = [];
    if (haveMoreData) {
      short = await apiSearchMovie.apiSearchMovie(
        title: text,
        numPage: numberPage,
      );
    }

    if (short.isEmpty) {
      haveMoreData = false;
      if (numberPage == 1) {
        haveData = false;
      }
      notifyListeners();
      return;
    } else {
      movieList.addAll(short);
      movieList = movieList.toSet().toList();
      if (movieList.isNotEmpty) {
        List<MovieModel> tempItems = List.from(movieList);

        for (var item in tempItems) {
          final imdbID = item.imdbID.toString();
          bool check = await favouriteController.checkFavouriteItemMovie(
            imdbID: item.imdbID,
          );
          isFavourite[imdbID] = check;
        }
        numberPage++;
        notifyListeners();
      } else {
        haveData = false;
        notifyListeners();
        return;
      }
    }
  }
}
