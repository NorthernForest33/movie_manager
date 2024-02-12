import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';

@RoutePage()
class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String movieGenres =
        movie.genres?.map((genre) => genre.name).join('/ ') ?? '';
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
              background: Image.network(
                movie.poster!.previewUrl!,
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
                          movie.name ?? '',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 19,
                              height: 1.2,
                              fontWeight: FontWeight.w500),
                        ),
                        movie.premiere != null
                            ? Text(movie.premiere!.world!.toIso8601String())
                            : const SizedBox.shrink(),
                        Text(movieGenres,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14)),
                        Text(movie.rating?.imdb.toString() ?? '')
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
                        Text(movie.description ?? movie.shortDescription ?? '',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14))
                      ],
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: [
                        const Text(
                          'Top Billed Cast',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        movie.persons != null ?
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: SizedBox(
                            height: 270.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movie.persons!.length,
                              itemExtent: 145,
                              itemBuilder: (context, index) {
                                final person = movie.persons![index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black
                                                  .withOpacity(0.85)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16)),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: const Offset(0, 2),
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                blurRadius: 16),
                                          ],
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: Column(children: [
                                          Image.network(
                                            person.photo ?? '',
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const SizedBox(height: 4),
                                                  Text(person.name ?? '',
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        height: 1,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          )
                                        ]),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16)),
                                          onTap: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : const SizedBox.shrink()],
                    )
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