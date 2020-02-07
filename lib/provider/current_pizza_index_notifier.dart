import 'package:flutter/material.dart';

class CurrentPizzaIndexNotifier with ChangeNotifier {
  int _currentIndex = 1;

  int get currentIndex => _currentIndex;

  set currentIndex(int newIndex) {
    _currentIndex = newIndex;
    // print(_currentIndex);
    notifyListeners();
  }
}
