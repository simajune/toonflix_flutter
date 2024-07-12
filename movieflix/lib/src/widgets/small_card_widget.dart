import 'package:flutter/material.dart';
import 'package:movieflix/src/services/api_service.dart';
import '../models/movie_model.dart';
import '../screens/detail_screen.dart';

class SmallCardWidget extends StatelessWidget {
  final String title;
  final MovieModel movie;

  const SmallCardWidget({
    super.key,
    required this.title,
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
        width: 150,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              '${ApiService.imageUrl}${movie.posterPath}',
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              movie.title,
            ),
          ],
        ),
      ),
    );
  }
}
