import 'dart:convert';

import 'package:cinematch/domain/entities/movie.dart';
import 'package:cinematch/infrastructure/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieService {
  final String url =
      'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1';
  final String token =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NmY2M2ZlYjdhNmY3YWIyZDAzOTM1NmFhMDE1MTAwMCIsIm5iZiI6MTc1Mzk5Nzc2Mi44ODQsInN1YiI6IjY4OGJlMWMyMjM3NjU4MzQ2ZDYxZTIxZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7PwIyETPpbE31hlUFO1xMEmKVyEvh_Dl_TumJt96me0';
  Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json;charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List movieJson = data['results'];

      return movieJson
          .map((movieJson) => MovieModel.fromJson(movieJson).toMovieEntity())
          .toList();
    } else {
      throw Exception('Error al obtener películas: ${response.statusCode}');
    }
  }
}
