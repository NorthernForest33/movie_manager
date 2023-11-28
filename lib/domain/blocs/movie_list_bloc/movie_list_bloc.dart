import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';
import 'package:movie_manager/repositories/movie_repository/movie_repository.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc({required this.movieRepository}) : super(MovieListInitital()) {
    on<LoadMovieList>(_onLoadMovieList);
  }

  final MovieRepository movieRepository;

  _onLoadMovieList(LoadMovieList event, Emitter<MovieListState> emit) async {
    try {
      if (state is! MovieListLoaded) {
        emit(MovieListLoading());
      }

      final movieList = await movieRepository.getMovies(event.queryParameters);
      emit(MovieListLoaded(
          movieList: movieList.movies, totalPage: movieList.pages));
    } catch (e) {
      emit(MovieListFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  void loadMoreMovies(int index, List<Movie> movieList, String query,) async {
    if (index < movieList.length - 2) return;
    final newMovieList = await movieRepository.getMovies(
        MovieListRequestParametrs().searchRequstParametrs(query, '2'));
    movieList.addAll(newMovieList.movies);
  }
}
