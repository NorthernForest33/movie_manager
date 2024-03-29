import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_manager/domain/blocs/movie_list_bloc/movie_list_bloc.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';
import 'package:movie_manager/repositories/movie_repository/movie_repository.dart';
import 'package:movie_manager/router/router.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget(
      {super.key, required this.movieList, required this.searchTextController});
  final List<Movie> movieList;
  final TextEditingController searchTextController;

  @override
  Widget build(BuildContext context) {
    final movieListBloc = BlocProvider.of<MovieListBloc>(context);
    return SliverFixedExtentList(
        itemExtent: 140,
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, index) {
            movieListBloc.isLoadNextPage(
                currentMovie: index,
                totalMovies: movieList.length,
                query: searchTextController.text);
            final movie = movieList[index];
            final releaseDate = movie.releaseDate != null
                ? DateFormat.yMMMMd().format(movie.releaseDate!)
                : '';
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withOpacity(0.85)),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 2),
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8),
                  ],
                ),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    Row(children: [
                      movie.posterPath == null
                          ? const SizedBox(width: 85.0)
                          : Image.network(
                              ImageDownLoader.imageUrl(movie.posterPath!),
                              fit: BoxFit.fill,
                            ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Text(releaseDate,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.grey)),
                            const SizedBox(height: 6),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(movie.overview,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(height: 1.2)),
                            ),
                          ],
                        ),
                      )
                    ]),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        onTap: () {
                          AutoRouter.of(context)
                              .push(MovieDetailsRoute(movie: movie));
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          childCount: movieList.length,
        ));
  }
}
