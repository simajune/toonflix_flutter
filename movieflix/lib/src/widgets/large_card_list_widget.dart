import 'package:flutter/material.dart';
import 'package:movieflix/src/models/movie_model.dart';
import 'package:movieflix/src/widgets/large_card_widget.dart';

class LargeCardListWidget extends StatelessWidget {
  late final String title;
  late final List<MovieModel> movies;

  LargeCardListWidget({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            children: [
              for (var movie in movies)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8),
                  child: LargeCardWidget(
                    movie: movie,
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
