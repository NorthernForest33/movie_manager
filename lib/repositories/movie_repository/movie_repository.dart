import 'package:dio/dio.dart';
import 'package:movie_manager/domain/entity/movie_response/movie_response.dart';

class MovieListRequestParametrs {
  static const Map<String, String> popularMovies = {
    'page': '1',
    'sortField': 'votes.kp',
    'sortType': '-1',
    'limit': '20'
  };

  static const Map<String, String> releasedSoonMovies = {
    'poster.url': '!null',
    'status': 'announced',
    'sortField': 'votes.await',
    'sortType': '-1',
    'limit': '20'
  };

  static const Map<String, String> mostRatedMovie = {
    'sortField': 'rating.imdb',
    'sortType': '-1',
    'limit': '20'
  };

  Map<String, String> searchRequstParametrs(String query, String page) =>
      {'page': page, 'limit': '20', 'query': query};
}

class MovieRepository {
  Dio dio = Dio();
  static const String _apiKey = 'a72aeb65f93911542ff66814d78affd0';
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  Map<String, String> headers = {
    'Authorization': 'a72aeb65f93911542ff66814d78affd0',
    'accept': 'application/json'
  };

  Future<MovieResponse> getMovies(int page) async {
    print('try');
    final dynamic json = await Dio().get(
        'https://api.themoviedb.org/3/movie/popular',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'en-US',
          'page': page.toString(),
        });
    print('get');
    final jsonMap = json.data as Map<String, dynamic>;
    final result = MovieResponse.fromJson(jsonMap);
    return result;
  }

  Future<MovieResponse> searchMovies(String query, int page) async {
    print('try');
    final dynamic json = await Dio().get(
        'https://api.themoviedb.org/3/search/movie',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'en-US',
          'query': query,
          'page': page.toString(),
          'include_adult': true.toString(),
        });
    print('get');
    final jsonMap = json.data as Map<String, dynamic>;
    final result = MovieResponse.fromJson(jsonMap);
    return result;
  }
}

class ImageDownLoader {
  static String imageUrl(String path) => MovieRepository._imageUrl + path;
}
