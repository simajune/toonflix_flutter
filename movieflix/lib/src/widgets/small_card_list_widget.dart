import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/src/widgets/small_card_widget.dart';

import '../models/movie_model.dart';

class SmallCardListWidget extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;

  const SmallCardListWidget({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var movie in movies)
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 8),
                    child: SmallCardWidget(
                      movie: movie,
                      title: movie.title,
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
