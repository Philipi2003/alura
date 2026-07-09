import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/search_movies_service.dart';

class SearchMovieViewmodel {
  List<Movie> _moviesList = [];

  List<Movie> get moviesList => _moviesList;

  Future<List<Movie>> getPopularMovies() async {
    SearchMoviesService searchPopularMovies = SearchPopularMovies();
    final response = await searchPopularMovies.getMovies();
    _moviesList = response;
    return _moviesList;
  }
}
