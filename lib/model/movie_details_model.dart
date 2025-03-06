import 'package:movie_salah_yaaqba/model/rating_model.dart';

class MovieDetailsModel {
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  String? metaScore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbID;
  String? type;
  String? dvd;
  String? boxOffice;
  String? production;
  String? website;
  List<RatingModel>? ratings;

  MovieDetailsModel({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.metaScore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.type,
    required this.dvd,
    required this.boxOffice,
    required this.production,
    required this.website,
    required this.ratings,
  });

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'] ?? '';
    year = json['Year'] ?? '';
    rated = json['Rated'] ?? '';
    released = json['Released'] ?? '';
    runtime = json['Runtime'] ?? '';
    genre = json['Genre'] ?? '';
    director = json['Director'] ?? '';
    writer = json['Writer'] ?? '';
    actors = json['Actors'] ?? '';
    plot = json['Plot'] ?? '';
    language = json['Language'] ?? '';
    country = json['Country'] ?? '';
    awards = json['Awards'] ?? '';
    poster = json['Poster'] ?? '';
    metaScore = json['Metascore'] ?? '';
    imdbRating = json['imdbRating'] ?? '';
    imdbVotes = json['imdbVotes'] ?? '';
    imdbID = json['imdbID'] ?? '';
    type = json['Type'] ?? '';
    dvd = json['DVD'] ?? '';
    boxOffice = json['BoxOffice'] ?? '';
    production = json['Production'] ?? '';
    website = json['Website'] ?? '';
    ratings =
        (json['Ratings'] as List<dynamic>?)
            ?.map((rating) => RatingModel.fromJson(rating))
            .toList() ??
        [];
  }

  @override
  String toString() {
    return 'MovieDetailsModel{title: $title, year: $year, rated: $rated, released: $released, runtime: $runtime, genre: $genre, director: $director, writer: $writer, actors: $actors, plot: $plot, language: $language, country: $country, awards: $awards, poster: $poster, metascore: $metaScore, imdbRating: $imdbRating, imdbVotes: $imdbVotes, imdbID: $imdbID, type: $type, dvd: $dvd, boxOffice: $boxOffice, production: $production, website: $website, ratings: $ratings}';
  }
}
