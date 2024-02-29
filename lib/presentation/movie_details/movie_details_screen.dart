import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_manager/domain/blocs/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';
import 'package:movie_manager/repositories/movie_repository/movie_repository.dart';


@RoutePage()
class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final Movie movie;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<MovieDetailsBloc>(context)
        .add(LoadMovieDetails(movieId: widget.movie.id, movie: widget.movie));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final movie = widget.movie;
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.primaryColor,
          body: CustomScrollView(
            slivers: [
              MovieDetailsAppBar(movie: movie),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieDetailsOverview(movieOverview: movie.overview),
                      const SizedBox(height: 12),
                      if (state is MovieDetailsLoading) ...{
                        const SizedBox(
                          height: 270,
                          width: double.infinity,
                          child: Center(
                              child: CircularProgressIndicator(
                                  strokeWidth: 3, color: Colors.white)),
                        )
                      },
                      if (state is MovieDetailsLoaded) ...{
                        Column(
                          children: [
                            MovieDetailsTopBilledCast(movie: movie),
                            const SizedBox(height: 20),
                            const Column(
                              children: [
                                 Text(
                                  'Trailers',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),

                              ],
                            )
                          ],
                        )
                      },
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



class MovieDetailsTopBilledCast extends StatelessWidget {
  const MovieDetailsTopBilledCast({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        'Top Billed Cast',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        color: Colors.transparent,
        width: double.infinity,
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie.details?.credits?.cast.length,
          itemExtent: 120,
          itemBuilder: (context, index) {
            final actor = movie.details?.credits?.cast[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black.withOpacity(0.85)),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 2),
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 16),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          actor?.profilePath != null
                              ? Image.network(ImageDownLoader.imageUrl(
                                  actor?.profilePath ?? ''))
                              : const SizedBox(height: 160),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 4),
                                  Text(actor?.name ?? '',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          height: 1,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                  Text(actor?.character ?? '',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          height: 1,
                                          color: Colors.white,
                                          fontSize: 12)),
                                ],
                              ),
                            ),
                          )
                        ]),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      )
    ]);
  }
}

class MovieDetailsOverview extends StatelessWidget {
  const MovieDetailsOverview({
    super.key,
    required this.movieOverview,
  });

  final String movieOverview;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Overview',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(movieOverview,
            style: const TextStyle(color: Colors.white, fontSize: 14))
      ],
    );
  }
}

class MovieDetailsAppBar extends StatelessWidget {
  const MovieDetailsAppBar({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      backgroundColor: theme.primaryColor,
      foregroundColor: Colors.white,
      stretch: true,
      pinned: true,
      toolbarHeight: 30,
      collapsedHeight: 100,
      expandedHeight: 540,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Image.network(
          ImageDownLoader.imageUrl(movie.posterPath ?? ''),
          fit: BoxFit.cover,
        ),
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: _TitleInfo(movie: movie)),
    );
  }
}

class _TitleInfo extends StatelessWidget {
  const _TitleInfo({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final releaseDate = movie.releaseDate != null
        ? DateFormat.yMMMMd().format(movie.releaseDate!)
        : '';
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(0.3),
              blurRadius: 16),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                  fontSize: 19, height: 1.2, fontWeight: FontWeight.w500),
            ),
            movie.releaseDate != null
                ? Text(releaseDate)
                : const SizedBox.shrink(),
            const Text('movieGenres',
                style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text(movie.voteAverage.toString())
          ],
        ),
      ),
    );
  }
}

