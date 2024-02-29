import 'package:json_annotation/json_annotation.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';

part 'movie_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetails {
  final bool adult;
  final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompanie> productionCompanies;
  final List<ProductionCountrie> productionCountries;
  @JsonKey(fromJson: parseMovieDateFromString)
  final DateTime? releaseDate;
  final int revenue;
  final int? runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String? tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  @JsonKey(includeFromJson: false, includeToJson: false)
  MovieDetailsCredits? credits;
  @JsonKey(includeFromJson: false, includeToJson: false)
  MovieDetailsVideos? videos;

  MovieDetails(
      {required this.adult,
      required this.backdropPath,
      required this.belongsToCollection,
      required this.budget,
      required this.genres,
      required this.homepage,
      required this.id,
      required this.imdbId,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.productionCompanies,
      required this.productionCountries,
      required this.releaseDate,
      required this.revenue,
      required this.runtime,
      required this.spokenLanguages,
      required this.status,
      required this.tagline,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount,
      this.credits,
      this.videos});

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BelongsToCollection {
  const BelongsToCollection();

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Genre {
  final int id;
  final String name;
  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCompanie {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;
  ProductionCompanie({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompanie.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanieFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanieToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCountrie {
  @JsonKey(name: 'iso_3166_1')
  final String iso;
  final String name;
  ProductionCountrie({
    required this.iso,
    required this.name,
  });

  factory ProductionCountrie.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountrieFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountrieToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SpokenLanguage {
  @JsonKey(name: 'iso_639_1')
  final String iso;
  final String name;

  SpokenLanguage({
    required this.iso,
    required this.name,
  });
  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsVideos {
  List<MovieDetailsVideosResult> results;
  MovieDetailsVideos({
    required this.results,
  });

  factory MovieDetailsVideos.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsVideosFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsVideosToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsVideosResult {
  final String id;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;
  MovieDetailsVideosResult({
    required this.id,
    required this.iso6391,
    required this.iso31661,
    required this.key,
    required this.name,
    required this.site,
    required this.size,
    required this.type,
  });

  factory MovieDetailsVideosResult.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsVideosResultFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsVideosResultToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDetailsCredits {
  final List<Actor> cast;
  final List<Employee> crew;
  MovieDetailsCredits({
    required this.cast,
    required this.crew,
  });

  factory MovieDetailsCredits.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsCreditsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsCreditsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Actor {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;
  Actor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  Map<String, dynamic> toJson() => _$ActorToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Employee {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String creditId;
  final String department;
  final String job;
  Employee({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
