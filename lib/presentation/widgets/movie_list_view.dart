import 'package:cinematch/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movies;
  const MovieListView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 130,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
