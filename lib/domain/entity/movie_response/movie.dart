import 'package:json_annotation/json_annotation.dart';
import 'package:movie_manager/domain/entity/movie_response/movie_fields.dart';

part 'movie.g.dart';


@JsonSerializable()
class Movie {
  final int id;
  final ExternalId? externalId;
  final String? name;
  final String? alternativeName;
  final String? enName;
  final List<Name> names;
  final String type;
  final int? typeNumber;
  final int? year;
  final String? description;
  final String? shortDescription;
  final String? slogan;
  final String? status;
  final Rating? rating;
  final Votes? votes;
  final int? movieLength;
  final String? ratingMpaa;
  final int? ageRating;
  final Logo? logo;
  final Poster? poster;
  final Backdrop? backdrop;
  final Videos? videos;
  final List<Genres>? genres;
  final List<Country>? countries;
  final List<Person>? persons;
  final ReviewInfo? reviewInfo;
  final List<SeasonsInfo>? seasonsInfo;
  final Budget? budget;
  final Fees? fees;
  final Premiere? premiere;
  final List<SimilarMovies>? similarMovies;
  final List<SequelsAndPrequel>? sequelsAndPrequels;
  final Watchability? watchability;
  final List<ReleaseYear>? releaseYears;
  final int? top10;
  final int? top250;
  final bool? ticketsOnSale;
  final int? totalSeriesLength;
  final int? seriesLength;
  final bool? isSeries;
  final List<Audience>? audience;
  final List<Fact>? facts;
  final ImagesInfo? imagesInfo;
  final List<ProductionCompany>? productionCompanies;

  Movie({
    required this.id,
    required this.externalId,
    required this.name,
    required this.alternativeName,
    required this.enName,
    required this.names,
    required this.type,
    required this.typeNumber,
    required this.year,
    required this.description,
    required this.shortDescription,
    required this.slogan,
    required this.status,
    required this.rating,
    required this.votes,
    required this.movieLength,
    required this.ratingMpaa,
    required this.ageRating,
    required this.logo,
    required this.poster,
    required this.backdrop,
    required this.videos,
    required this.genres,
    required this.countries,
    required this.persons,
    required this.reviewInfo,
    required this.seasonsInfo,
    required this.budget,
    required this.fees,
    required this.premiere,
    required this.similarMovies,
    required this.sequelsAndPrequels,
    required this.watchability,
    required this.releaseYears,
    required this.top10,
    required this.top250,
    required this.ticketsOnSale,
    required this.totalSeriesLength,
    required this.seriesLength,
    required this.isSeries,
    required this.audience,
    required this.facts,
    required this.imagesInfo,
    required this.productionCompanies,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
