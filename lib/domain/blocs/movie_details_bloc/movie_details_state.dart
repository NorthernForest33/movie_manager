part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {}

class MovieDetailsInitital extends MovieDetailsState {
  @override
  List<Object?> get props => [];
}

class MovieDetailsLoading extends MovieDetailsState {

  @override
  List<Object?> get props => [];
}

class MovieDetailsLoaded extends MovieDetailsState {
  final Movie movie;

  MovieDetailsLoaded({required this.movie});

  @override
  List<Object?> get props => [];
}

class MovieDetailsFailure extends MovieDetailsState {
  final Object? exception;

  MovieDetailsFailure({this.exception});

  @override
  List<Object?> get props => [exception];
}