import 'package:cinematch/presentation/screens/providers/carousel_provider.dart';
import 'package:flutter/material.dart';
import 'package:cinematch/presentation/widgets/home_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widthSlide = MediaQuery.of(context).size.width * 0.6;
    final heightSilde = MediaQuery.of(context).size.width * 0.4;
    final carouselProvider = context.watch<CarouselProvider>();
    final items = [1, 2, 3];
    return Scaffold(
      appBar: HomeAppBar(),
      body: Column(
        children: [
          SizedBox(height: 30),
          CarouselSlider(
            items: items.map((i) {
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
              viewportFraction: 0.7,
              onPageChanged: (index, reason) {
                return carouselProvider.udateIndex(index);
              }, // <-- Esto reduce el espacio entre las tarjetas
            ),
          ),
          SizedBox(height: 20),
          // Puntos indicadores
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
        ],
      ),
    );
  }
}
