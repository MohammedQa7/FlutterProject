import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/ProfileScreen.dart';
import 'package:flutter_application_1/view/cartScreen.dart';
import 'package:flutter_application_1/view/homescreen.dart';
import 'package:flutter_application_1/view/controller_view.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = HomeScreen();
  get currentScreen => _currentScreen;

  get navigatorValue => _navigatorValue;
  void changeSelectedValue(int slectedValue) {
    _navigatorValue = slectedValue;
    switch (slectedValue) {
      case 0:
        {
          _currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          _currentScreen = CartScreen();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileScreen();
          break;
        }
    }
    update();
  }
}
