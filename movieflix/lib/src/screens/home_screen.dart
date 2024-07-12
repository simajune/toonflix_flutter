import 'package:flutter/material.dart';
import 'package:movieflix/src/models/movie_model.dart';
import 'package:movieflix/src/widgets/large_card_list_widget.dart';

import '../services/api_service.dart';
import '../widgets/small_card_list_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final Future<List<MovieModel>> movies = ApiService.getPopularMovies();
  final Future<List<MovieModel>> nowMovies = ApiService.getNowPlayingMovies();
  final Future<List<MovieModel>> comingMovies =
      ApiService.getComingSoonMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('movieflix'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                FutureBuilder(
                    future: movies,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return LargeCardListWidget(
                          title: 'Popular Movies',
                          movies: snapshot.data!,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                const SizedBox(
                  height: 32,
                ),
                FutureBuilder(
                    future: nowMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SmallCardListWidget(
                          title: 'Now in Cinemas',
                          movies: snapshot.data!,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                const SizedBox(
                  height: 32,
                ),
                FutureBuilder(
                    future: comingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SmallCardListWidget(
                          title: 'Coming soon',
                          movies: snapshot.data!,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
