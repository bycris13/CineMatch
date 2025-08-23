import 'package:cinematch/config/helpers/movie_service.dart';
import 'package:cinematch/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  List<Movie> _popularMovies = [];

  List<Movie> get popularMovies => _popularMovies;

  Future<void> loadMovies() async {
    _popularMovies = await MovieService().fetchPopularMovies();
    notifyListeners();
  }
}
