class DetailMovieModel {
  late final bool adult;
  late final String backdropPath;
  late final List<GenreModel> genres;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final num popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final String homepage;
  late final bool video;
  late final num voteAverage;
  late final int voteCount;
  late final int runtime;

  DetailMovieModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      List<GenreModel> tmpGenres = [];
      for (var genre in json['genres']) {
        tmpGenres.add(GenreModel.fromJson(genre as dynamic));
      }
      genres = tmpGenres;
    }
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    homepage = json['homepage'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    runtime = json['runtime'];
  }
}

class GenreModel {
  late final int id;
  late final String name;

  GenreModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
}
