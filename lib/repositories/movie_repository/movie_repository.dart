import 'package:dio/dio.dart';
import 'package:movie_manager/domain/entity/movie_response/movie_details.dart';
import 'package:movie_manager/domain/entity/movie_response/movie_response.dart';

class MovieRequestLink {
  static const nowPlaying = '/movie/now_playing';
  static const popular = '/movie/popular';
  static const topRated = '/movie/top_rated';
  static const upcoming = '/movie/upcoming';
}

class MovieRepository {
  Dio dio = Dio();
  static const String _apiKey = 'a72aeb65f93911542ff66814d78affd0';
  static const String _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  Map<String, String> headers = {
    'Authorization': 'a72aeb65f93911542ff66814d78affd0',
    'accept': 'application/json'
  };

  Future<MovieResponse> getMovies(int page, String moviesLink) async {
    print('try');
    final dynamic json =
        await Dio().get('$_host$moviesLink', queryParameters: {
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
    final dynamic json =
        await Dio().get('$_host/search/movie', queryParameters: {
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

  Future<MovieDetails> getMovieDetails(int id) async {
    print('try Details');
    final dynamic json = await Dio().get('$_host/movie/$id', queryParameters: {
      'api_key': _apiKey,
      'language': 'en-US',
      'movie_id': id,
    });
    print('get Details');
    final jsonMap = json.data as Map<String, dynamic>;
    var result = MovieDetails.fromJson(jsonMap);
    result.credits = await _getMovieDetailsCredits(id);
    result.videos = await _getMovieDetailsVideos(id);
    return result;
  }

Future<MovieDetailsCredits> _getMovieDetailsCredits(int id) async {
  print('try Credits');
  final dynamic json = await Dio().get('$_host/movie/$id/credits', queryParameters: {
      'api_key': _apiKey,
      'language': 'en-US',
      'movie_id': id,
    });
    print('get Credits');
    final jsonMap = json.data as Map<String, dynamic>;
    final result = MovieDetailsCredits.fromJson(jsonMap);
    return result;
}

Future<MovieDetailsVideos> _getMovieDetailsVideos(int id) async {
  print('try Videos');
  final dynamic json = await Dio().get('$_host/movie/$id/videos', queryParameters: {
      'api_key': _apiKey,
      'language': 'en-US',
      'movie_id': id,
    });
    print('get Videos');
    final jsonMap = json.data as Map<String, dynamic>;
    final result = MovieDetailsVideos.fromJson(jsonMap);
    return result;
}

}

class ImageDownLoader {
  static String imageUrl(String path) => MovieRepository._imageUrl + path;
}
