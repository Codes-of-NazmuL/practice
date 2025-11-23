

import 'package:flutter/material.dart';

class ButtonShadowProvider extends ChangeNotifier {
  bool isPressed = false;

  pressed() {
    isPressed = true;
    notifyListeners();
  }

  relased() {
    isPressed = false;
    notifyListeners();
  }
}
