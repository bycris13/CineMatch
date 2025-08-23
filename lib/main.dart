import 'package:cinematch/config/theme/app_theme.dart';
import 'package:cinematch/presentation/screens/home/home_screen.dart';
import 'package:cinematch/presentation/screens/providers/carousel_provider.dart';
import 'package:cinematch/presentation/screens/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return CarouselProvider();
          },
        ),
        ChangeNotifierProvider(create: (_) => MoviesProvider()..loadMovies()),
      ],
      child: MaterialApp(
        title: 'CineMatch',
        theme: AppTheme().themeData(),
        home: HomeScreen(),
      ),
    );
  }
}
