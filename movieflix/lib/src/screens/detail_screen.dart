import 'package:flutter/material.dart';
import 'package:movieflix/src/models/detail_movie_model.dart';
import 'package:movieflix/src/services/api_service.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final String posterPath;
  const DetailScreen({super.key, required this.id, required this.posterPath});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<DetailMovieModel> movie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movie = ApiService.getMovieById(widget.id);
  }

  onButtonTap(String url) async {
    await launchUrlString(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('${ApiService.imageUrl}${widget.posterPath}'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Back to list'),
          backgroundColor: Colors.transparent,
        ),
        body: FutureBuilder(
          future: movie,
          builder: (
            context,
            snapshot,
          ) {
            if (snapshot.hasData) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        snapshot.data!.title,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      RatingBar.builder(
                          ignoreGestures: true,
                          itemSize: 30,
                          initialRating: snapshot.data!.voteAverage / 2,
                          allowHalfRating: true,
                          itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          onRatingUpdate: (rating) {}),
                      const SizedBox(
                        height: 16,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Text(
                              '${snapshot.data!.runtime ~/ 60}h ${snapshot.data!.runtime % 60}m',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const VerticalDivider(
                              thickness: 1,
                              color: Colors.white,
                              indent: 3,
                              endIndent: 3,
                            ),
                            for (var genre in snapshot.data!.genres)
                              Text(
                                '${genre.name}  ',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data!.overview,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      SizedBox(
                        height: 90,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 48.0,
                            vertical: 15,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                            ),
                            onPressed: () {
                              onButtonTap(snapshot.data!.homepage);
                            },
                            child: const Text(
                              'Buy ticket',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
