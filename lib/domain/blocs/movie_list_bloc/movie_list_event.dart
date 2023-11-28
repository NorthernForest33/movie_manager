part of 'movie_list_bloc.dart';

abstract class MovieListEvent extends Equatable {}

class LoadMovieList extends MovieListEvent {
  final Map<String, String> queryParameters;
  final Completer? completer;

  LoadMovieList(
      {this.completer,
      this.queryParameters = MovieListRequestParametrs.popularMovies});

  @override
  List<Object?> get props => [completer, queryParameters];
}

class LoadMovieListNextPage extends MovieListEvent {


  @override
  List<Object?> get props => [];
}