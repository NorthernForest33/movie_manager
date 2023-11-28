part of 'home_movie_lists_bloc.dart';

abstract class HomeMovieListsEvent extends Equatable {}


class LoadHomeMovieLists extends HomeMovieListsEvent {
  final List<Map<String, String>> queryParameters;
  final Completer? completer;

  LoadHomeMovieLists({this.completer, required this.queryParameters});

  @override
  List<Object?> get props => [completer];
}
