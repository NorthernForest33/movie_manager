part of 'movie_list_bloc.dart';

abstract class MovieListEvent extends Equatable {}

// ignore: must_be_immutable
class LoadMovieList extends MovieListEvent {
  final Map<String, String> queryParameters;
  List<Movie>? movieList = [];
  final Completer? completer;

  LoadMovieList(
      {
      this.completer,
      this.movieList,
      this.queryParameters = MovieListRequestParametrs.popularMovies});

  @override
  List<Object?> get props => [completer, queryParameters];
}
