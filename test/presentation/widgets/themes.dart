import 'package:flutter/material.dart';
CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  // Color c1 = const Color(#004cff);
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }


  static ThemeData get lightTheme { 
    return ThemeData(
      highlightColor:Color.fromARGB(255, 153, 171, 213),
      primaryColor:Color.fromRGBO(120, 154, 234, 1),
      canvasColor: Colors.white70,
      accentColor: Colors.grey[100],
      hoverColor: Colors.grey[500],
       shadowColor: Colors.grey[300],
      backgroundColor: Colors.white70,
      scaffoldBackgroundColor: Colors.grey[100],
      textTheme:  TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        // bodyText1: TextStyle(color: Colors.grey100 ),
        bodyText2: TextStyle(color: Colors.black),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
            highlightColor:Color.fromARGB(255, 153, 171, 213),
      primaryColor: Colors.black54,
      accentColor: Colors.white70,
      backgroundColor: Colors.grey[400],
      scaffoldBackgroundColor: Colors.grey,
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
    );
  }
}


