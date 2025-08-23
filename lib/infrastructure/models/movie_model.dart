import 'package:cinematch/domain/entities/movie.dart';

class MovieModel {
  final String posterPath;
  final String backdropPath;
  MovieModel({required this.backdropPath, required this.posterPath});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'] ?? '',
    );
  }

  Movie toMovieEntity() =>
      Movie(backdropPath: backdropPath, posterPath: posterPath);
}
