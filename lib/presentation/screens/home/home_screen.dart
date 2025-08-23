import 'package:cinematch/presentation/screens/providers/movies_provider.dart';
import 'package:cinematch/presentation/widgets/carousel_with_indicator.dart';
import 'package:cinematch/presentation/widgets/movie_list_view.dart';
import 'package:flutter/material.dart';
import 'package:cinematch/presentation/widgets/home_app_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final popularMovies = context.watch<MoviesProvider>().popularMovies;
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            // Crousel con puntos idicadores.
            CarouselWithSlider(movies: popularMovies),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'The most pupular',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Peliculas mas populares.
            MovieListView(movies: popularMovies),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Entertaiment',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
