import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinematch/domain/entities/movie.dart';
import 'package:cinematch/presentation/screens/providers/carousel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarouselWithSlider extends StatelessWidget {
  final List<Movie> movies;
  const CarouselWithSlider({required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    final widthSlide = MediaQuery.of(context).size.width * 0.7;
    final heightSilde = MediaQuery.of(context).size.height * 0.2;
    final items = movies.take(3).toList();
    final carouselProvider = context.watch<CarouselProvider>();
    return Column(
      children: [
        CarouselSlider(
          items: items.map((movie) {
            return Builder(
              builder: (context) {
                return SizedBox(
                  width: widthSlide,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                        fit: BoxFit.cover,
                        width: widthSlide,
                        height: heightSilde,
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: heightSilde,
            autoPlay: true,
            initialPage: 0,
            enlargeCenterPage: true,
            enlargeStrategy:
                CenterPageEnlargeStrategy.zoom, // Animacion de zoom
            viewportFraction:
                0.8, // <-- Esto reduce el espacio entre las tarjetas
            onPageChanged: (index, reason) {
              return carouselProvider.updateIndex(index);
            },
          ),
        ),
        SizedBox(height: 20),
        // Fila de puntos indicadore
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(items.length, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: carouselProvider.currentIndex == index ? 10 : 8,
              height: carouselProvider.currentIndex == index ? 10 : 8,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}
