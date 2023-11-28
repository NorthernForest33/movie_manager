import 'package:json_annotation/json_annotation.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: 'docs')
  final List<Movie> movies;
  final int total;
  final int limit;
  final int page;
  final int pages;

  MovieResponse({
    required this.movies,
    required this.total,
    required this.limit,
    required this.page,
    required this.pages,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}