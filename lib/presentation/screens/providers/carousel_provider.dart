import 'package:flutter/material.dart';

class CarouselProvider extends ChangeNotifier {
  int currentIndex = 0;

  void udateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
