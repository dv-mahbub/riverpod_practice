import 'package:flutter/material.dart';

class CouterNotifier extends ChangeNotifier {
  int _num = 0;
  get getCount => _num;

  void increment() {
    _num++;
    notifyListeners();
  }

  void decrement() {
    _num--;
    notifyListeners();
  }
}
