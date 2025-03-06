import 'package:flutter/cupertino.dart';
import 'package:movie_salah_yaaqba/model/movie_model.dart';
import '../database_local/sql_database.dart';

class FavouriteController extends ChangeNotifier {
  List<MovieModel> favouriteItems = [];
  List<bool> checkInCart = [];
  MovieModel? item;
  SqlDb sqlDb = SqlDb();

  Future<void> insertData({
    required String? imdbID,
    required String? title,
    required String? year,
    required String? type,
    required String? poster,
  }) async {

    int response = await sqlDb.insertData(
      sql:
          "INSERT INTO 'favouriteMovie' ('imdbID','Title','Year','Type','Poster') VALUES ('$imdbID','$title','$year','$type','$poster')",
    );

    if (response > 0) {
      await getFavouriteMovies();
    }
  }

  Future<void> deleteItemMovie({required String? imdbID}) async {
    await sqlDb.insertData(
      sql: "DELETE FROM 'favouriteMovie' WHERE imdbID='$imdbID'",
    );

    await getFavouriteMovies();
  }

  bool checkFavouriteItemImdbID({String? imdbID}) {
    return favouriteItems.any((item) {
      return item.imdbID == imdbID;
    });
  }
  Future<void> getFavouriteMovies() async {
    List<Map> response = await sqlDb.readData(sql: "SELECT * FROM 'favouriteMovie'");
    favouriteItems = MovieModel.fromJsonListMovies(response);

    notifyListeners();
  }

  Future<bool> checkFavouriteItemMovie({required String? imdbID}) async {
    List<Map> response = await sqlDb.readData(
      sql: "SELECT imdbID FROM 'favouriteMovie'  WHERE imdbID = '$imdbID'",
    );

    if (response.toString() == "[]") {
      return false;
    } else {
      return true;
    }
  }
}
