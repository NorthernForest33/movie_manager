import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';

import 'package:movie_manager/repositories/movie_repository/movie_repository.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc({required this.movieRepository})
      : super(MovieDetailsInitital()) {
    on<LoadMovieDetails>(_onLoadMovieDetails);
  }

  final MovieRepository movieRepository;

  _onLoadMovieDetails(
      LoadMovieDetails event, Emitter<MovieDetailsState> emit) async {
    try {
      emit(MovieDetailsLoading());

      final movieDetails = await movieRepository.getMovieDetails(event.movieId);
      event.movie.details = movieDetails;
      emit(MovieDetailsLoaded(movie: event.movie));
    } catch (e) {
      emit(MovieDetailsFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }
}
