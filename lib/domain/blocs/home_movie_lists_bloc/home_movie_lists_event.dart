part of 'home_movie_lists_bloc.dart';

abstract class HomeMovieListsEvent extends Equatable {}


class LoadHomeMovieLists extends HomeMovieListsEvent {
  final List<String> movieRequestLink;
  final Completer? completer;

  LoadHomeMovieLists({this.completer, required this.movieRequestLink});

  @override
  List<Object?> get props => [completer];
}
