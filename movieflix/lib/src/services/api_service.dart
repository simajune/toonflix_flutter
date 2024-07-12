import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/detail_movie_model.dart';
import '../models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";
  static const String movie = "movie";

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        final popularMovie = MovieModel.fromJson(movie);
        movieInstances.add(popularMovie);
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowPlayingMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$nowPlaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        final nowMovie = MovieModel.fromJson(movie);
        movieInstances.add(nowMovie);
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingSoonMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$comingSoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        final comingMovie = MovieModel.fromJson(movie);
        movieInstances.add(comingMovie);
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<DetailMovieModel> getMovieById(String id) async {
    final url = Uri.parse('$baseUrl/$movie?id=$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      final detailMovie = DetailMovieModel.fromJson(movie);
      return detailMovie;
    }
    throw Error();
  }
}
