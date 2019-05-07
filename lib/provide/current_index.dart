import 'package:flutter/material.dart';

class CurrentIndexProvide with ChangeNotifier {
  int currentIndex = 0;

  // 改变菜单索引
  changeCurrentIndex (int index) {
    currentIndex = index;

    notifyListeners();
  }
}