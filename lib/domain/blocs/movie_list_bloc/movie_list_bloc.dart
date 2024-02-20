import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';
import 'package:movie_manager/domain/entity/movie_response/movie_response.dart';
import 'package:movie_manager/repositories/movie_repository/movie_repository.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListContainer extends Equatable {
  final List<Movie> movies;
  final int currentPage;
  final int totalPage;

  bool get isComplete => currentPage >= totalPage;

  const MovieListContainer.initial()
      : movies = const <Movie>[],
        currentPage = 0,
        totalPage = 1;

  const MovieListContainer({
    required this.movies,
    required this.currentPage,
    required this.totalPage,
  });

  MovieListContainer copyWith({
    List<Movie>? movies,
    int? currentPage,
    int? totalPage,
  }) {
    return MovieListContainer(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
    );
  }

  @override
  List<Object> get props => [movies, currentPage, totalPage];
}

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc({required this.movieRepository}) : super(MovieListInitital()) {
    on<LoadMovieList>(_onLoadMovieList);
    on<ResetMovieList>(_onResetMovieList);
  }

  final MovieRepository movieRepository;

  _onLoadMovieList(LoadMovieList event, Emitter<MovieListState> emit) async {
    try {
      MovieListContainer movieContainer;
      if (state is! MovieListLoaded) {
        emit(MovieListLoading());
        movieContainer = const MovieListContainer.initial();
      } else {
        movieContainer = (state as MovieListLoaded).movieListContainer;
      }
      if (event.isSearchMode) {
        movieContainer = await _loadNextPage(movieContainer, (nextPage) async {
          final movieResponse =
              await movieRepository.searchMovies(event.query, nextPage);
          return movieResponse;
        });
      } else {
        movieContainer = await _loadNextPage(movieContainer, (nextPage) async {
          final movieResponse = await movieRepository.getMovies(nextPage, MovieRequestLink.popular);
          return movieResponse;
        });
      }
      emit(MovieListLoaded(movieListContainer: movieContainer));
    } catch (e) {
      emit(MovieListFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  _onResetMovieList(ResetMovieList event, Emitter<MovieListState> emit) async {
    emit(MovieListLoading());
    emit(MovieListLoaded.initial());
  }

  Future<MovieListContainer> _loadNextPage(
    MovieListContainer movieContainer,
    Future<MovieResponse> Function(int) loader,
  ) async {
    if (movieContainer.isComplete) return movieContainer;
    final nextPage = movieContainer.currentPage + 1;
    final movieResponse = await loader(nextPage);
    final movieList = List<Movie>.from(movieContainer.movies)
      ..addAll(movieResponse.movies);
    final newContainer = movieContainer.copyWith(
        movies: movieList,
        currentPage: nextPage,
        totalPage: movieResponse.totalPages);
    return newContainer;
  }

  void isLoadNextPage(
      {required int currentMovie,
      required int totalMovies,
      required String query}) {
    if (currentMovie < totalMovies - 1) return;
    add(LoadMovieList(query: query));
  }
}
