import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_manager/domain/entity/movie_response/movie_response.dart';
import 'package:movie_manager/repositories/movie_repository/movie_repository.dart';

part 'home_movie_lists_event.dart';
part 'home_movie_lists_state.dart';

class HomeMovieListsBloc extends Bloc<HomeMovieListsEvent, HomeMovieListsState> {
  HomeMovieListsBloc({required this.movieRepository}) : super(HomeMovieListsInitital()) {
    on<LoadHomeMovieLists>(_onLoadHomeMovieLists);
  }

  final MovieRepository movieRepository;

  _onLoadHomeMovieLists(LoadHomeMovieLists event, Emitter<HomeMovieListsState> emit) async{
      try {
        if (state is! HomeMovieListsLoaded){
          emit(HomeMovieListsLoading());
        }

        List<MovieResponse> homeMovieLists = [];
        for (int i = 0; i < event.queryParameters.length; i++) {
        homeMovieLists.add(await movieRepository.getMovies(1));
        }
        emit(HomeMovieListsLoaded(homeMovieLists: homeMovieLists));
        
      } catch (e){
        emit(HomeMovieListsFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
  }
}
