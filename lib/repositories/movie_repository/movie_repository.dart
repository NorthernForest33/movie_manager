import 'package:dio/dio.dart';
import 'package:movie_manager/domain/entity/movie_response/movie_response.dart';

class MovieListRequestParametrs {
  static const Map<String, String> popularMovies = {
    'premiere.world': '15.10.2022-15.10.2023',
    'sortFields': 'votes.kp',
    'sortType': '-1',
    'limit': '20'
  };

  static const Map<String, String> releasedSoonMovies = {
    'poster.url': '!null',
    'status': 'announced',
    'sortFields': 'votes.await',
    'sortType': '-1',
    'limit': '20'
  };

  static const Map<String, String> mostRatedMovie = {
    'sortFields': 'rating.kp',
    'sortType': '-1',
    'limit': '20'
  };

  Map<String, String> searchRequstParametrs(String query, String page) =>
      {'page': page, 'limit': '20', 'name': query};
}

class MovieRepository {
  Dio dio = Dio();
  Map<String, String> headers = {
    'accept': 'application/json',
    'X-API-KEY': '49BHQRJ-YJFMW5K-PPSYSZN-S2NRJNC'
  };

  Future<MovieResponse> getMovies(
      Map<String, String> queryParameters) async {
    final dynamic json = await Dio().get('https://api.kinopoisk.dev/v1.3/movie',
        options: Options(headers: headers), queryParameters: queryParameters);
    final jsonMap = json.data as Map<String, dynamic>;
    final result = MovieResponse.fromJson(jsonMap);
    return result;
  }

}
