part of 'movie_list_bloc.dart';

abstract class MovieListEvent extends Equatable {}

// ignore: must_be_immutable
class LoadMovieList extends MovieListEvent {
  final String query;
  bool get isSearchMode => query.isNotEmpty;
  final Completer? completer;

  LoadMovieList({
    this.query = '',
    this.completer,
  });

  @override
  List<Object?> get props => [completer, query];
}

class ResetMovieList extends MovieListEvent {
  @override
  List<Object?> get props => [];
}
