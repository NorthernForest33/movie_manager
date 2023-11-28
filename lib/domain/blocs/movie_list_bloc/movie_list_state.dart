part of 'movie_list_bloc.dart';

abstract class MovieListState extends Equatable {}

class MovieListInitital extends MovieListState {
  @override
  List<Object?> get props => [];
}

class MovieListLoading extends MovieListState {
  @override
  List<Object?> get props => [];
}

class MovieListLoaded extends MovieListState {
  final List<Movie> movieList;
  final int currentPage;
  final int totalPage;

  MovieListLoaded({this.currentPage = 0, this.movieList = const <Movie>[], this.totalPage = 1});

  @override
  List<Object?> get props => [movieList];
}

class MovieListFailure extends MovieListState {
  final Object? exception;

  MovieListFailure({this.exception});

  @override
  List<Object?> get props => [exception];
}