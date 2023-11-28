part of 'home_movie_lists_bloc.dart';

abstract class HomeMovieListsState extends Equatable {}

class HomeMovieListsInitital extends HomeMovieListsState {
  @override
  List<Object?> get props => [];
}

class HomeMovieListsLoading extends HomeMovieListsState {
  @override
  List<Object?> get props => [];
}


class HomeMovieListsLoaded extends HomeMovieListsState {
  final List<MovieResponse> homeMovieLists;

  HomeMovieListsLoaded({required this.homeMovieLists});

  @override
  List<Object?> get props => [homeMovieLists];
}

class HomeMovieListsFailure extends HomeMovieListsState {
  final Object? exception;

  HomeMovieListsFailure({this.exception});

  @override
  List<Object?> get props => [exception];
}