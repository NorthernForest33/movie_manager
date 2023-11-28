import 'package:flutter/material.dart';
import 'package:movie_manager/resources/app_images.dart';

class TrailersHorizontalListWidget extends StatefulWidget {
  const TrailersHorizontalListWidget({Key? key}) : super(key: key);

  @override
  State<TrailersHorizontalListWidget> createState() => _TrailersHorizontalListWidgetState();
}

class _TrailersHorizontalListWidgetState extends State<TrailersHorizontalListWidget> {
  final categories = ['Streaming', 'OnTV', 'Series', 'Movies'];
  late String? selectedCategory = categories.first;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 340,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            colorFilter:
                ColorFilter.mode(Colors.blueGrey.shade700, BlendMode.modulate),
            image: const AssetImage(AppImage.movieGuardiansGalaxeBack),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lastes Trailer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedCategory,
                    dropdownColor: theme.primaryColor,
                    underline: const SizedBox(),
                    items: categories
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() => selectedCategory = item),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemExtent: constraints.maxWidth * 0.9,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                            AppImage.movieGuardiansGalaxeBack),
                                        const DecoratedBox(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 20,
                                                  spreadRadius: -20),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.play_arrow_rounded,
                                            color: Colors.white,
                                            size: 80,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 15,
                                  right: 15,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Icon(Icons.more_horiz),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'Elite',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'Elite Season 4 | Trailter | Netflix',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}