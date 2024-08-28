import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:music_player/Themes/Dark_Mode.dart';
import 'package:music_player/Themes/Light_Mode.dart';

class ThemeProviders extends ChangeNotifier {
// initiallly light mode
  ThemeData _themeData = lightMode;

  // get theme
  ThemeData get themeData => _themeData;

  // is dark mode
  bool get isDarkMode => _themeData == darkMode;

  // set theme

  set themeData(ThemeData themeData) {
    _themeData = themeData;

    // update UI
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
