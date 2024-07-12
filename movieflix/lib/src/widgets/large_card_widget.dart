import 'package:flutter/material.dart';
import 'package:movieflix/src/screens/detail_screen.dart';
import '../models/movie_model.dart';
import '../services/api_service.dart';

class LargeCardWidget extends StatelessWidget {
  final MovieModel movie;

  const LargeCardWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: movie.id.toString(),
              posterPath: movie.posterPath,
            ),
          ),
        );
      },
      child: Container(
        width: 300,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Image.network(
          '${ApiService.imageUrl}${movie.backdropPath}',
        ),
      ),
    );
  }
}
