import 'package:flutter/material.dart';
import 'package:cinematch/presentation/widgets/home_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widthSlide = MediaQuery.of(context).size.width * 0.6;
    final heightSilde = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
      appBar: HomeAppBar(),
      body: Column(
        children: [
          SizedBox(height: 50),
          CarouselSlider(
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (context) {
                  return SizedBox(
                    width: widthSlide,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        child: Image.network(
                          'https://www.superherotoystore.com/cdn/shop/articles/Blog_Banners_8_4352178c-1daa-49ff-99eb-a4a9dcf843b0_1600x.jpg?v=1745580913',
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
                  0.7, // <-- Esto reduce el espacio entre las tarjetas
            ),
          ),
        ],
      ),
    );
  }
}
