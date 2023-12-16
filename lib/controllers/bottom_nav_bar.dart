import 'package:flutter/material.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int selectedIndex = 0;
  navigateBottomBar(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
