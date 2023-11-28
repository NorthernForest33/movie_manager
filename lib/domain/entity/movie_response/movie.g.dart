// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as int,
      externalId: json['externalId'] == null
          ? null
          : ExternalId.fromJson(json['externalId'] as Map<String, dynamic>),
      name: json['name'] as String?,
      alternativeName: json['alternativeName'] as String?,
      enName: json['enName'] as String?,
      names: (json['names'] as List<dynamic>)
          .map((e) => Name.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      typeNumber: json['typeNumber'] as int?,
      year: json['year'] as int?,
      description: json['description'] as String?,
      shortDescription: json['shortDescription'] as String?,
      slogan: json['slogan'] as String?,
      status: json['status'] as String?,
      rating: json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      votes: json['votes'] == null
          ? null
          : Votes.fromJson(json['votes'] as Map<String, dynamic>),
      movieLength: json['movieLength'] as int?,
      ratingMpaa: json['ratingMpaa'] as String?,
      ageRating: json['ageRating'] as int?,
      logo: json['logo'] == null
          ? null
          : Logo.fromJson(json['logo'] as Map<String, dynamic>),
      poster: json['poster'] == null
          ? null
          : Poster.fromJson(json['poster'] as Map<String, dynamic>),
      backdrop: json['backdrop'] == null
          ? null
          : Backdrop.fromJson(json['backdrop'] as Map<String, dynamic>),
      videos: json['videos'] == null
          ? null
          : Videos.fromJson(json['videos'] as Map<String, dynamic>),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      persons: (json['persons'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewInfo: json['reviewInfo'] == null
          ? null
          : ReviewInfo.fromJson(json['reviewInfo'] as Map<String, dynamic>),
      seasonsInfo: (json['seasonsInfo'] as List<dynamic>?)
          ?.map((e) => SeasonsInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      budget: json['budget'] == null
          ? null
          : Budget.fromJson(json['budget'] as Map<String, dynamic>),
      fees: json['fees'] == null
          ? null
          : Fees.fromJson(json['fees'] as Map<String, dynamic>),
      premiere: json['premiere'] == null
          ? null
          : Premiere.fromJson(json['premiere'] as Map<String, dynamic>),
      similarMovies: (json['similarMovies'] as List<dynamic>?)
          ?.map((e) => SimilarMovies.fromJson(e as Map<String, dynamic>))
          .toList(),
      sequelsAndPrequels: (json['sequelsAndPrequels'] as List<dynamic>?)
          ?.map((e) => SequelsAndPrequel.fromJson(e as Map<String, dynamic>))
          .toList(),
      watchability: json['watchability'] == null
          ? null
          : Watchability.fromJson(json['watchability'] as Map<String, dynamic>),
      releaseYears: (json['releaseYears'] as List<dynamic>?)
          ?.map((e) => ReleaseYear.fromJson(e as Map<String, dynamic>))
          .toList(),
      top10: json['top10'] as int?,
      top250: json['top250'] as int?,
      ticketsOnSale: json['ticketsOnSale'] as bool?,
      totalSeriesLength: json['totalSeriesLength'] as int?,
      seriesLength: json['seriesLength'] as int?,
      isSeries: json['isSeries'] as bool?,
      audience: (json['audience'] as List<dynamic>?)
          ?.map((e) => Audience.fromJson(e as Map<String, dynamic>))
          .toList(),
      facts: (json['facts'] as List<dynamic>?)
          ?.map((e) => Fact.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagesInfo: json['imagesInfo'] == null
          ? null
          : ImagesInfo.fromJson(json['imagesInfo'] as Map<String, dynamic>),
      productionCompanies: (json['productionCompanies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'name': instance.name,
      'alternativeName': instance.alternativeName,
      'enName': instance.enName,
      'names': instance.names,
      'type': instance.type,
      'typeNumber': instance.typeNumber,
      'year': instance.year,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'slogan': instance.slogan,
      'status': instance.status,
      'rating': instance.rating,
      'votes': instance.votes,
      'movieLength': instance.movieLength,
      'ratingMpaa': instance.ratingMpaa,
      'ageRating': instance.ageRating,
      'logo': instance.logo,
      'poster': instance.poster,
      'backdrop': instance.backdrop,
      'videos': instance.videos,
      'genres': instance.genres,
      'countries': instance.countries,
      'persons': instance.persons,
      'reviewInfo': instance.reviewInfo,
      'seasonsInfo': instance.seasonsInfo,
      'budget': instance.budget,
      'fees': instance.fees,
      'premiere': instance.premiere,
      'similarMovies': instance.similarMovies,
      'sequelsAndPrequels': instance.sequelsAndPrequels,
      'watchability': instance.watchability,
      'releaseYears': instance.releaseYears,
      'top10': instance.top10,
      'top250': instance.top250,
      'ticketsOnSale': instance.ticketsOnSale,
      'totalSeriesLength': instance.totalSeriesLength,
      'seriesLength': instance.seriesLength,
      'isSeries': instance.isSeries,
      'audience': instance.audience,
      'facts': instance.facts,
      'imagesInfo': instance.imagesInfo,
      'productionCompanies': instance.productionCompanies,
    };
