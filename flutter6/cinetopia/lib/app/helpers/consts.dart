import 'package:cinetopia/app/api_key.dart';

const String popularMoviesUrl =
    "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1";
const Map<String, String> requestHeader = {
  'accept': 'application/json',
  'Authorization': 'Bearer $apiKey',
};
const String imageUrlPrefix = 'https://image.tmdb.org/t/p/w500';
