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
  Map<String, String> headers = {
    'accept': 'application/json',
    'X-API-KEY': '49BHQRJ-YJFMW5K-PPSYSZN-S2NRJNC'
  };

  Future<MovieResponse> getMovies(Map<String, String> queryParameters,
      [bool? isSearch]) async {
    print('try');
    final dynamic json = await Dio().get(
        isSearch == null || false
            ? 'https://api.kinopoisk.dev/v1.4/movie'
            : 'https://api.kinopoisk.dev/v1.4/movie/search',
        options: Options(headers: headers),
        queryParameters: queryParameters);
    print('get');
    final jsonMap = json.data as Map<String, dynamic>;
    final result = MovieResponse.fromJson(jsonMap);
    return result;
  }
}
