part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {}

class LoadMovieDetails extends MovieDetailsEvent{
  final Completer? completer;
  final int movieId;
  final Movie movie;

  LoadMovieDetails({this.completer, required this.movieId, required this.movie});

    @override
  List<Object?> get props => [completer];
}