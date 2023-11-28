// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Audience _$AudienceFromJson(Map<String, dynamic> json) => Audience(
      count: json['count'] as int,
      country: json['country'] as String,
    );

Map<String, dynamic> _$AudienceToJson(Audience instance) => <String, dynamic>{
      'count': instance.count,
      'country': instance.country,
    };

Poster _$PosterFromJson(Map<String, dynamic> json) => Poster(
      url: json['url'] as String?,
      previewUrl: json['previewUrl'] as String?,
    );

Map<String, dynamic> _$PosterToJson(Poster instance) => <String, dynamic>{
      'url': instance.url,
      'previewUrl': instance.previewUrl,
    };

Backdrop _$BackdropFromJson(Map<String, dynamic> json) => Backdrop(
      url: json['url'] as String?,
      previewUrl: json['previewUrl'] as String?,
    );

Map<String, dynamic> _$BackdropToJson(Backdrop instance) => <String, dynamic>{
      'url': instance.url,
      'previewUrl': instance.previewUrl,
    };

Budget _$BudgetFromJson(Map<String, dynamic> json) => Budget(
      value: json['value'] as int?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$BudgetToJson(Budget instance) => <String, dynamic>{
      'value': instance.value,
      'currency': instance.currency,
    };

Genres _$GenresFromJson(Map<String, dynamic> json) => Genres(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'name': instance.name,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
    };

ExternalId _$ExternalIdFromJson(Map<String, dynamic> json) => ExternalId(
      kpHd: json['kpHd'] as String?,
      imdb: json['imdb'] as String?,
      tmdb: json['tmdb'] as int?,
    );

Map<String, dynamic> _$ExternalIdToJson(ExternalId instance) =>
    <String, dynamic>{
      'kpHd': instance.kpHd,
      'imdb': instance.imdb,
      'tmdb': instance.tmdb,
    };

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      value: json['value'] as String?,
      type: json['type'] as String?,
      spoiler: json['spoiler'] as bool?,
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      'value': instance.value,
      'type': instance.type,
      'spoiler': instance.spoiler,
    };

Fees _$FeesFromJson(Map<String, dynamic> json) => Fees(
      world: json['world'] == null
          ? null
          : Budget.fromJson(json['world'] as Map<String, dynamic>),
      russia: json['russia'] == null
          ? null
          : Budget.fromJson(json['russia'] as Map<String, dynamic>),
      usa: json['usa'] == null
          ? null
          : Budget.fromJson(json['usa'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeesToJson(Fees instance) => <String, dynamic>{
      'world': instance.world,
      'russia': instance.russia,
      'usa': instance.usa,
    };

ImagesInfo _$ImagesInfoFromJson(Map<String, dynamic> json) => ImagesInfo(
      postersCount: json['postersCount'] as int?,
      backdropsCount: json['backdropsCount'] as int?,
      framesCount: json['framesCount'] as int?,
    );

Map<String, dynamic> _$ImagesInfoToJson(ImagesInfo instance) =>
    <String, dynamic>{
      'postersCount': instance.postersCount,
      'backdropsCount': instance.backdropsCount,
      'framesCount': instance.framesCount,
    };

Logo _$LogoFromJson(Map<String, dynamic> json) => Logo(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$LogoToJson(Logo instance) => <String, dynamic>{
      'url': instance.url,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      name: json['name'] as String,
      language: json['language'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
      'type': instance.type,
    };

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: json['id'] as int?,
      photo: json['photo'] as String?,
      name: json['name'] as String?,
      enName: json['enName'] as String?,
      description: json['description'] as String?,
      profession: json['profession'] as String?,
      enProfession: json['enProfession'] as String?,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'name': instance.name,
      'enName': instance.enName,
      'description': instance.description,
      'profession': instance.profession,
      'enProfession': instance.enProfession,
    };

Premiere _$PremiereFromJson(Map<String, dynamic> json) => Premiere(
      country: json['country'] as String?,
      world: json['world'] == null
          ? null
          : DateTime.parse(json['world'] as String),
      russia: json['russia'] == null
          ? null
          : DateTime.parse(json['russia'] as String),
      digital: json['digital'] as String?,
      cinema: json['cinema'] == null
          ? null
          : DateTime.parse(json['cinema'] as String),
      bluray: json['bluray'] as String?,
      dvd: json['dvd'] as String?,
    );

Map<String, dynamic> _$PremiereToJson(Premiere instance) => <String, dynamic>{
      'country': instance.country,
      'world': instance.world?.toIso8601String(),
      'russia': instance.russia?.toIso8601String(),
      'digital': instance.digital,
      'cinema': instance.cinema?.toIso8601String(),
      'bluray': instance.bluray,
      'dvd': instance.dvd,
    };

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) =>
    ProductionCompany(
      name: json['name'] as String?,
      url: json['url'] as String?,
      previewUrl: json['previewUrl'] as String?,
    );

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'previewUrl': instance.previewUrl,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      kp: (json['kp'] as num?)?.toDouble(),
      imdb: (json['imdb'] as num?)?.toDouble(),
      tmdb: (json['tmdb'] as num?)?.toDouble(),
      filmCritics: (json['filmCritics'] as num?)?.toDouble(),
      russianFilmCritics: (json['russianFilmCritics'] as num?)?.toDouble(),
      ratingAwait: (json['ratingAwait'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'kp': instance.kp,
      'imdb': instance.imdb,
      'tmdb': instance.tmdb,
      'filmCritics': instance.filmCritics,
      'russianFilmCritics': instance.russianFilmCritics,
      'ratingAwait': instance.ratingAwait,
    };

ReleaseYear _$ReleaseYearFromJson(Map<String, dynamic> json) => ReleaseYear(
      start: json['start'] as int?,
      end: json['end'] as int?,
    );

Map<String, dynamic> _$ReleaseYearToJson(ReleaseYear instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };

ReviewInfo _$ReviewInfoFromJson(Map<String, dynamic> json) => ReviewInfo(
      count: json['count'] as int?,
      positiveCount: json['positiveCount'] as int?,
      percentage: json['percentage'] as String?,
    );

Map<String, dynamic> _$ReviewInfoToJson(ReviewInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'positiveCount': instance.positiveCount,
      'percentage': instance.percentage,
    };

SeasonsInfo _$SeasonsInfoFromJson(Map<String, dynamic> json) => SeasonsInfo(
      number: json['number'] as int?,
      episodesCount: json['episodesCount'] as int?,
    );

Map<String, dynamic> _$SeasonsInfoToJson(SeasonsInfo instance) =>
    <String, dynamic>{
      'number': instance.number,
      'episodesCount': instance.episodesCount,
    };

SimilarMovies _$SimilarMoviesFromJson(Map<String, dynamic> json) =>
    SimilarMovies(
      id: json['id'] as int?,
      name: json['name'] as String?,
      enName: json['enName'] as String?,
      alternativeName: json['alternativeName'] as String?,
      type: json['type'] as String?,
      poster: json['poster'] == null
          ? null
          : Poster.fromJson(json['poster'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SimilarMoviesToJson(SimilarMovies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'enName': instance.enName,
      'alternativeName': instance.alternativeName,
      'type': instance.type,
      'poster': instance.poster,
    };

SequelsAndPrequel _$SequelsAndPrequelFromJson(Map<String, dynamic> json) =>
    SequelsAndPrequel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      enName: json['enName'] as String?,
      alternativeName: json['alternativeName'] as String?,
      type: json['type'] as String?,
      poster: json['poster'] == null
          ? null
          : Poster.fromJson(json['poster'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SequelsAndPrequelToJson(SequelsAndPrequel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'enName': instance.enName,
      'alternativeName': instance.alternativeName,
      'type': instance.type,
      'poster': instance.poster,
    };

Videos _$VideosFromJson(Map<String, dynamic> json) => Videos(
      trailers: (json['trailers'] as List<dynamic>?)
          ?.map((e) => Trailers.fromJson(e as Map<String, dynamic>))
          .toList(),
      teasers: (json['teasers'] as List<dynamic>?)
          ?.map((e) => Teaser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideosToJson(Videos instance) => <String, dynamic>{
      'trailers': instance.trailers,
      'teasers': instance.teasers,
    };

Trailers _$TrailersFromJson(Map<String, dynamic> json) => Trailers(
      url: json['url'] as String?,
      name: json['name'] as String?,
      site: json['site'] as String?,
      type: json['type'] as String?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$TrailersToJson(Trailers instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'site': instance.site,
      'type': instance.type,
      'size': instance.size,
    };

Teaser _$TeaserFromJson(Map<String, dynamic> json) => Teaser(
      url: json['url'] as String?,
      name: json['name'] as String?,
      site: json['site'] as String?,
      type: json['type'] as String?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$TeaserToJson(Teaser instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'site': instance.site,
      'type': instance.type,
      'size': instance.size,
    };

Votes _$VotesFromJson(Map<String, dynamic> json) => Votes(
      kp: json['kp'] as int?,
      imdb: json['imdb'] as int?,
      tmdb: json['tmdb'] as int?,
      filmCritics: json['filmCritics'] as int?,
      russianFilmCritics: json['russianFilmCritics'] as int?,
      votesAwait: json['votesAwait'] as int?,
    );

Map<String, dynamic> _$VotesToJson(Votes instance) => <String, dynamic>{
      'kp': instance.kp,
      'imdb': instance.imdb,
      'tmdb': instance.tmdb,
      'filmCritics': instance.filmCritics,
      'russianFilmCritics': instance.russianFilmCritics,
      'votesAwait': instance.votesAwait,
    };

Watchability _$WatchabilityFromJson(Map<String, dynamic> json) => Watchability(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WatchabilityToJson(Watchability instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      name: json['name'] as String?,
      logo: json['logo'] == null
          ? null
          : Logo.fromJson(json['logo'] as Map<String, dynamic>),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'url': instance.url,
    };
