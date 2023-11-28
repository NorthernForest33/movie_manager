import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_manager/domain/blocs/movie_list_bloc/movie_list_bloc.dart';
import 'package:movie_manager/presentation/search/widgets/movie_card_widget.dart';
import 'package:movie_manager/presentation/search/widgets/search_button_widget.dart';
import 'package:movie_manager/presentation/widgets/failure_message_widget.dart';
import 'package:movie_manager/repositories/movie_repository/movie_repository.dart';

@RoutePage()
class SearchMovieScreen extends StatefulWidget {
  const SearchMovieScreen({Key? key}) : super(key: key);

  @override
  State<SearchMovieScreen> createState() => _SearchMovieScreenState();
}

class _SearchMovieScreenState extends State<SearchMovieScreen> {
  @override
  void initState() {
    BlocProvider.of<MovieListBloc>(context).add(LoadMovieList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final movieListBloc = BlocProvider.of<MovieListBloc>(context);
    final searchTextController = TextEditingController();
    return RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          movieListBloc.add(LoadMovieList(
              completer: completer,
              queryParameters: MovieListRequestParametrs()
                  .searchRequstParametrs(searchTextController.text, '1')));
          return completer.future;
        },
        color: theme.primaryColor,
        edgeOffset: 55,
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(54),
                  child: SearchButtonWidget(controller: searchTextController)),
            ),
            BlocBuilder<MovieListBloc, MovieListState>(
              builder: (context, state) {
                if (state is MovieListLoaded) {
                  final movieList = state.movieList;
                  return MovieCardWidget(
                    movieList: movieList,
                    searchTextController: searchTextController
                  );
                }
                if (state is MovieListFailure) {
                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 1.5,
                            child: FailureMessageWidget(
                                movieListBloc: movieListBloc)),
                        const SizedBox(height: 100)
                      ],
                    ),
                  );
                }
                return const SliverFillRemaining(
                    child: Center(
                        child: CircularProgressIndicator(
                            strokeWidth: 3, color: Colors.white)));
              },
            )
          ],
        ));
  }
}
