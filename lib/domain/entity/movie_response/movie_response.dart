import 'package:json_annotation/json_annotation.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';

part 'movie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieResponse {
  @JsonKey(name: 'results')
  final List<Movie> movies;
  final int totalResults;
  final int totalPages;
  final int page;

  MovieResponse({
    required this.movies,
    required this.totalPages,
    required this.totalResults,
    required this.page,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
