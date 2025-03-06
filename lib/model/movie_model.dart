class MovieModel {
   String? title;
   String? year;
   String? imdbID;
   String? type;
   String? poster;

  MovieModel({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.type,
    required this.poster,
  });



  MovieModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'] ?? '';
    year = json['Year'] ?? '';
    imdbID = json['imdbID'] ?? '';
    type = json['Type'] ?? '';
    poster = json['Poster'] ?? '';

  }

  static List<MovieModel> fromJsonListMovies(List<dynamic> jsonList) {
    return jsonList.map((json) => MovieModel.fromJson(json)).toList();
  }

   @override
  String toString() {
    return 'MovieModel{title: $title, year: $year, imdbID: $imdbID, type: $type, poster: $poster}';
  }

}
