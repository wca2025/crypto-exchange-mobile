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
// #e4e9f2   #d3dce9   #c2cee1  
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor:Color(0xFF1da2b4),
      canvasColor: Colors.white,
      accentColor: Colors.grey[100],
      hoverColor: Colors.grey[500],
      // cursorColor:  Colors.grey[400],
       shadowColor: Colors.grey[300],
       highlightColor:  Color.fromARGB(255, 146, 157, 183),
       hintColor:  Colors.red[400],
      backgroundColor: Colors.white70,
      scaffoldBackgroundColor:Color(0xFFf5f7fa),
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

