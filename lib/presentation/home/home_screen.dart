import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_manager/domain/blocs/home_movie_lists_bloc/home_movie_lists_bloc.dart';
import 'package:movie_manager/presentation/home/widgets/home_movie_horizonal_list_widget.dart';
import 'package:movie_manager/presentation/home/widgets/home_trailers_horizontal_list_widget.dart';
import 'package:movie_manager/presentation/widgets/failure_message_widget.dart';
import 'package:movie_manager/repositories/movie_repository/movie_repository.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final listQueryParametrs = [
    MovieListRequestParametrs.popularMovies,
    MovieListRequestParametrs.releasedSoonMovies,
    MovieListRequestParametrs.mostRatedMovie
  ];

  @override
  void initState() {
    BlocProvider.of<HomeMovieListsBloc>(context)
        .add(LoadHomeMovieLists(queryParameters: listQueryParametrs));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final movieListBloc = context.watch<HomeMovieListsBloc>();

    return RefreshIndicator(
      onRefresh: () async {
        final completer = Completer();
        movieListBloc.add(LoadHomeMovieLists(
            queryParameters: listQueryParametrs, completer: completer));
        return completer.future;
      },
      edgeOffset: 50,
      color: theme.primaryColor,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        slivers: [
          SliverAppBar(
            titleTextStyle: const TextStyle(height: 1.8),
            backgroundColor: theme.primaryColor.withAlpha(120),
            pinned: true,
            floating: true,
            title: const Text(
              'Movie manager',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<HomeMovieListsBloc, HomeMovieListsState>(
              builder: (context, state) {
                if (state is HomeMovieListsLoaded) {
                  final homeMovieLists = state.homeMovieLists;
                  return Column(children: [
                    const Divider(),
                    MovieHorizontalListWidget(
                      nameGroup: 'Популярное сейчас',
                      listCategories: const ['Movies', 'Series'],
                      movieList: homeMovieLists[0].movies,
                    ),
                    const Divider(),
                    MovieHorizontalListWidget(
                      nameGroup: 'Скоро выйдет',
                      listCategories: const ['Movies', 'Series'],
                      movieList: homeMovieLists[1].movies,
                    ),
                    const TrailersHorizontalListWidget(),
                    MovieHorizontalListWidget(
                      nameGroup: 'По рейтингу за всё время',
                      listCategories: const ['Movies', 'Series'],
                      movieList: homeMovieLists[2].movies,
                    ),
                    const Divider(),
                  ]);
                }
                if (state is HomeMovieListsFailure) {
                  return FailureMessageWidget(
                      onBlocEvent: () => movieListBloc.add(LoadHomeMovieLists(queryParameters: listQueryParametrs)));
                }
                return const SizedBox(
                  height: 650,
                  child: Center(
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 3)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
