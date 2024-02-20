// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final MovieListContainer movieListContainer;

  MovieListLoaded({required this.movieListContainer});

  MovieListLoaded.initial() : movieListContainer = const MovieListContainer.initial();

  MovieListLoaded copyWith({
    MovieListContainer? movieListContainer,
  }) {
    return MovieListLoaded(
      movieListContainer: movieListContainer ?? this.movieListContainer,
    );
  }

  @override
  List<Object?> get props => [movieListContainer];
}

class MovieListFailure extends MovieListState {
  final Object? exception;

  MovieListFailure({this.exception});

  @override
  List<Object?> get props => [exception];
}