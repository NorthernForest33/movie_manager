import 'package:flutter/material.dart';
import 'package:movie_manager/domain/entity/movie_response/movie.dart';

class MovieHorizontalListWidget extends StatelessWidget {
  final String nameGroup;
  final List<String> listCategories;
  final List<Movie> movieList;

  const MovieHorizontalListWidget(
      {super.key,
      required this.nameGroup,
      required this.listCategories,
      required this.movieList});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 340,
      color: theme.primaryColor,
      child: Column(
        children: [
          MovieNameGroupWidget(
            nameGroup: nameGroup,
            listCategories: listCategories,
          ),
          MovieItemListWidget(
            movieList: movieList,
          ),
        ],
      ),
    );
  }
}

class MovieNameGroupWidget extends StatefulWidget {
  final String nameGroup;
  final List<String> listCategories;

  const MovieNameGroupWidget({
    super.key,
    required this.nameGroup,
    required this.listCategories,
  });

  @override
  State<MovieNameGroupWidget> createState() => _MovieNameGroupWidgetState();
}

class _MovieNameGroupWidgetState extends State<MovieNameGroupWidget> {
  late List<String> categories = widget.listCategories;
  late String? selectedCategory = categories.first;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.nameGroup,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          DropdownButton<String>(
            iconEnabledColor: Colors.white,
            value: selectedCategory,
            dropdownColor: theme.primaryColor,
            underline: const SizedBox(),
            items: categories
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ))
                .toList(),
            onChanged: (item) => setState(() => selectedCategory = item),
          )
        ],
      ),
    );
  }
}

class MovieItemListWidget extends StatefulWidget {
  final List<Movie> movieList;

  const MovieItemListWidget({super.key, required this.movieList});

  @override
  State<MovieItemListWidget> createState() => _MovieItemListWidgetState();
}

class _MovieItemListWidgetState extends State<MovieItemListWidget> {
  @override
  Widget build(BuildContext context) {
    final movieList = widget.movieList;

    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: SizedBox(
        height: 270.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieList.length,
          itemExtent: 145,
          itemBuilder: (context, index) {
            final movie = movieList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                    child: Column(children: [
                      Image.network(
                        movie.poster?.url ?? '',
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 4),
                              Text(movie.name ?? '',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    height: 1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Text(
                                  '${movie.countries?.first.name ?? ''} \n ${movie.year ?? ''} ',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      height: 1, color: Colors.grey)),
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
      ),
    );
  }
}
