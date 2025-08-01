import 'package:flutter/material.dart';

class CarouselProvider extends ChangeNotifier {
  int currentIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
