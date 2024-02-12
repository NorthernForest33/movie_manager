import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';
import 'package:movie_manager/repositories/movie_repository/movie_repository.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListContainer {
  final List<Movie> movies;
  final int currentPage;
  final int totalPage;

  MovieListContainer({
    required this.movies,
    required this.currentPage,
    required this.totalPage,
  });
}

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

      final movieList = await movieRepository.getMovies(1);
      emit(MovieListLoaded(
        movieList: [...?event.movieList, ...movieList.movies],
        totalPage: movieList.totalPages,
      ));
    } catch (e) {
      emit(MovieListFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  int _currentPage = 1;
  String _newQuery = '';
  void loadNextPage(int index, List<Movie> movieList, String query) async {
    if (index < movieList.length - 1) return;
    if (_newQuery == query) {
      _currentPage++;
    } else {
      _currentPage = 1;
    }
    _newQuery = query;
    add(LoadMovieList(
        queryParameters: MovieListRequestParametrs()
            .searchRequstParametrs(query, _currentPage.toString()),
        movieList: movieList));
  }
}
