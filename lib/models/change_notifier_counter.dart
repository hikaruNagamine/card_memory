import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;
  int _fabIconNumber = 0;
  bool _clickedCentreFAB = false;
  int get count => _count;
  int get fabIconNumber => _fabIconNumber;
  bool get clickedCentreFAB => _clickedCentreFAB;

  void increment() {
    _count++;
    notifyListeners();
  }

  setFabIconNumber(int setnumber) {
    _fabIconNumber = setnumber;
    notifyListeners();
  }

  setClickedCentreFAB(bool click) {
    _clickedCentreFAB = click;
  }
}
