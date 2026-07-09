import 'dart:convert';

import 'package:cinetopia/app/helpers/consts.dart';
import 'package:cinetopia/app/models/movie.dart';
import 'package:http/http.dart' as http;

abstract class SearchMoviesService {
  Future<List<Movie>> getMovies();
}

class SearchPopularMovies implements SearchMoviesService {
  @override
  Future<List<Movie>> getMovies() async {
    List<Movie> movies = [];
    try {
      final response = await http.get(
        Uri.parse(popularMoviesUrl),
        headers: requestHeader,
      );
      if (response.statusCode == 200) {
        for (dynamic movie in jsonDecode(response.body)['results']) {
          movies.add(Movie.fromMap(movie));
        }
        return movies;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
