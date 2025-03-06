import 'dart:convert';

import '../../dialog/dialog_no_connection.dart';
import '../../model/movie_model.dart';
import '../../utilities/network/connection_network.dart';
import 'package:http/http.dart' as http;

import '../domain.dart';

class ApiSearchMovie {
  Future<List<MovieModel>> apiSearchMovie({
    required String title,
    required int numPage,
  }) async {
    List<MovieModel> movieList;
    if (await isConnectedWifi()) {
      try {
        var response = await http.get(
          Uri.parse(
            "$baseUrl?apikey=$apikey&s=$title&page=$numPage&type=movie",
          ),
          headers: headers,
        );

        var res = json.decode(utf8.decode(response.bodyBytes));
        if (response.statusCode == 200) {
          movieList = MovieModel.fromJsonListMovies(res["Search"]);

          return movieList;
        } else {
          return [];
        }
      } catch (error) {
        return [];
      }
    } else {
      noConnection();
      return [];
    }
  }
}
