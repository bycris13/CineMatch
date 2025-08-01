import 'package:cinematch/presentation/widgets/carousels/carousel_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:cinematch/presentation/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Column(
        children: [
          SizedBox(height: 30),
          // Crousel con puntos idicadores.
          CarouselWithSlider(),
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
          SizedBox(height: 30),
          // Lista peliculas.
          SizedBox(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                      child: Text('$index'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
