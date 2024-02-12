import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';
import 'package:movie_manager/repositories/movie_repository/movie_repository.dart';

@RoutePage()
class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final releaseDate = movie.releaseDate != null ? DateFormat.yMMMMd().format(movie.releaseDate!) : '';
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.primaryColor,
            foregroundColor: Colors.white,
            stretch: true,
            pinned: true,
            toolbarHeight: 30,
            collapsedHeight: 100,
            expandedHeight: 540,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Image.network(ImageDownLoader.imageUrl(movie.posterPath ?? ''),
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: Container(
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
                              fontSize: 19,
                              height: 1.2,
                              fontWeight: FontWeight.w500),
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
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 2000,
              width: double.infinity,
              color: theme.primaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Overview',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(movie.overview,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14))
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Column(children: [
                      Text(
                        'Top Billed Cast',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ])
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Stack(
//                 children: <Widget>[
//                   Positioned.fill(
//                     child: Image.network(
//                       movie.poster!.previewUrl!,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const Positioned.fill(
//                     child: Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Padding(
//                         padding: EdgeInsets.only(bottom: 8.0),
//                         child: Text(
//                           "Collapsing Toolbar",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 24.0,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),