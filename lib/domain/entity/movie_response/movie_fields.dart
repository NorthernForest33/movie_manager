import 'package:json_annotation/json_annotation.dart';

part 'movie_fields.g.dart';

@JsonSerializable()
class Audience {
  final int count;
  final String country;

  Audience({
    required this.count,
    required this.country,
  });

  factory Audience.fromJson(Map<String, dynamic> json) => _$AudienceFromJson(json);
  Map<String, dynamic> toJson() => _$AudienceToJson(this);
}

@JsonSerializable()
class Poster {
  final String? url;
  final String? previewUrl;

  Poster({
    required this.url,
    required this.previewUrl,
  });

  factory Poster.fromJson(Map<String, dynamic> json) => _$PosterFromJson(json);
  Map<String, dynamic> toJson() => _$PosterToJson(this);
}

@JsonSerializable()
class Backdrop {
  final String? url;
  final String? previewUrl;

  Backdrop({
    required this.url,
    required this.previewUrl,
  });

  factory Backdrop.fromJson(Map<String, dynamic> json) => _$BackdropFromJson(json);
  Map<String, dynamic> toJson() => _$BackdropToJson(this);
}

@JsonSerializable()
class Budget {
  final int? value;
  final String? currency;

  Budget({
    required this.value,
    required this.currency,
  });

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);
  Map<String, dynamic> toJson() => _$BudgetToJson(this);
}

@JsonSerializable()
class Genres {
  final String? name;

  Genres({
    required this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

@JsonSerializable()
class Country {
  final String? name;

  Country({
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class ExternalId {
  final String? kpHd;
  final String? imdb;
  final int? tmdb;

  ExternalId({
    required this.kpHd,
    required this.imdb,
    required this.tmdb,
  });

  factory ExternalId.fromJson(Map<String, dynamic> json) => _$ExternalIdFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalIdToJson(this);
}

@JsonSerializable()
class Fact {
  final String? value;
  final String? type;
  final bool? spoiler;

  Fact({
    required this.value,
    required this.type,
    required this.spoiler,
  });

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);
  Map<String, dynamic> toJson() => _$FactToJson(this);
}

@JsonSerializable()
class Fees {
  final Budget? world;
  final Budget? russia;
  final Budget? usa;

  Fees({
    required this.world,
    required this.russia,
    required this.usa,
  });

  factory Fees.fromJson(Map<String, dynamic> json) => _$FeesFromJson(json);
  Map<String, dynamic> toJson() => _$FeesToJson(this);
}

@JsonSerializable()
class ImagesInfo {
  final int? postersCount;
  final int? backdropsCount;
  final int? framesCount;

  ImagesInfo({
    required this.postersCount,
    required this.backdropsCount,
    required this.framesCount,
  });

  factory ImagesInfo.fromJson(Map<String, dynamic> json) => _$ImagesInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesInfoToJson(this);
}

@JsonSerializable()
class Logo {
  final String? url;

  Logo({
    required this.url,
  });

  factory Logo.fromJson(Map<String, dynamic> json) => _$LogoFromJson(json);
  Map<String, dynamic> toJson() => _$LogoToJson(this);
}

@JsonSerializable()
class Name {
  final String name;
  final String? language;
  final String? type;

  Name({
    required this.name,
    required this.language,
    required this.type,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class Person {
  final int? id;
  final String? photo;
  final String? name;
  final String? enName;
  final String? description;
  final String? profession;
  final String? enProfession;

  Person({
    required this.id,
    required this.photo,
    required this.name,
    required this.enName,
    required this.description,
    required this.profession,
    required this.enProfession,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable()
class Premiere {
  final String? country;
  final DateTime? world;
  final DateTime? russia;
  final String? digital;
  final DateTime? cinema;
  final String? bluray;
  final String? dvd;

  Premiere({
    required this.country,
    required this.world,
    required this.russia,
    required this.digital,
    required this.cinema,
    required this.bluray,
    required this.dvd,
  });

  factory Premiere.fromJson(Map<String, dynamic> json) => _$PremiereFromJson(json);
  Map<String, dynamic> toJson() => _$PremiereToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  final String? name;
  final String? url;
  final String? previewUrl;

  ProductionCompany({
    required this.name,
    required this.url,
    required this.previewUrl,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable()
class Rating {
  final double? kp;
  final double? imdb;
  final double? tmdb;
  final double? filmCritics;
  final double? russianFilmCritics;
  final double? ratingAwait;

  Rating({
    required this.kp,
    required this.imdb,
    required this.tmdb,
    required this.filmCritics,
    required this.russianFilmCritics,
    required this.ratingAwait,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class ReleaseYear {
  final int? start;
  final int? end;

  ReleaseYear({
    required this.start,
    required this.end,
  });

  factory ReleaseYear.fromJson(Map<String, dynamic> json) => _$ReleaseYearFromJson(json);
  Map<String, dynamic> toJson() => _$ReleaseYearToJson(this);
}

@JsonSerializable()
class ReviewInfo {
  final int? count;
  final int? positiveCount;
  final String? percentage;

  ReviewInfo({
    required this.count,
    required this.positiveCount,
    required this.percentage,
  });

  factory ReviewInfo.fromJson(Map<String, dynamic> json) => _$ReviewInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewInfoToJson(this);
}

@JsonSerializable()
class SeasonsInfo {
  final int? number;
  final int? episodesCount;

  SeasonsInfo({
    required this.number,
    required this.episodesCount,
  });

  factory SeasonsInfo.fromJson(Map<String, dynamic> json) => _$SeasonsInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SeasonsInfoToJson(this);
}

@JsonSerializable()
class SimilarMovies {
  final int? id;
  final String? name;
  final String? enName;
  final String? alternativeName;
  final String? type;
  final Poster? poster;

  SimilarMovies({
    required this.id,
    required this.name,
    required this.enName,
    required this.alternativeName,
    required this.type,
    required this.poster,
  });

  factory SimilarMovies.fromJson(Map<String, dynamic> json) => _$SimilarMoviesFromJson(json);
  Map<String, dynamic> toJson() => _$SimilarMoviesToJson(this);
}

@JsonSerializable()
class SequelsAndPrequel {
  final int? id;
  final String? name;
  final String? enName;
  final String? alternativeName;
  final String? type;
  final Poster? poster;

  SequelsAndPrequel({
    required this.id,
    required this.name,
    required this.enName,
    required this.alternativeName,
    required this.type,
    required this.poster,
  });

  factory SequelsAndPrequel.fromJson(Map<String, dynamic> json) => _$SequelsAndPrequelFromJson(json);
  Map<String, dynamic> toJson() => _$SequelsAndPrequelToJson(this);
}

@JsonSerializable()
class Videos {
  final List<Trailers>? trailers;
  final List<Teaser>? teasers;

  Videos({
    required this.trailers,
    required this.teasers,
  });

  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);
  Map<String, dynamic> toJson() => _$VideosToJson(this);
}

@JsonSerializable()
class Trailers {
  final String? url;
  final String? name;
  final String? site;
  final String? type;
  final int? size;

  Trailers({
    required this.url,
    required this.name,
    required this.site,
    required this.type,
    required this.size,
  });

  factory Trailers.fromJson(Map<String, dynamic> json) => _$TrailersFromJson(json);
  Map<String, dynamic> toJson() => _$TrailersToJson(this);
}

@JsonSerializable()
class Teaser {
  final String? url;
  final String? name;
  final String? site;
  final String? type;
  final int? size;

  Teaser({
    required this.url,
    required this.name,
    required this.site,
    required this.type,
    required this.size,
  });

  factory Teaser.fromJson(Map<String, dynamic> json) => _$TeaserFromJson(json);
  Map<String, dynamic> toJson() => _$TeaserToJson(this);
}

@JsonSerializable()
class Votes {
  final int? kp;
  final int? imdb;
  final int? tmdb;
  final int? filmCritics;
  final int? russianFilmCritics;
  final int? votesAwait;

  Votes({
    required this.kp,
    required this.imdb,
    required this.tmdb,
    required this.filmCritics,
    required this.russianFilmCritics,
    required this.votesAwait,
  });

  factory Votes.fromJson(Map<String, dynamic> json) => _$VotesFromJson(json);
  Map<String, dynamic> toJson() => _$VotesToJson(this);
}

@JsonSerializable()
class Watchability {
  final List<Item>? items;

  Watchability({
    required this.items,
  });

  factory Watchability.fromJson(Map<String, dynamic> json) => _$WatchabilityFromJson(json);
  Map<String, dynamic> toJson() => _$WatchabilityToJson(this);
}

@JsonSerializable()
class Item {
  final String? name;
  final Logo? logo;
  final String? url;

  Item({
    required this.name,
    required this.logo,
    required this.url,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}