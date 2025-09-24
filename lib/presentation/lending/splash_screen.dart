// import '../onboarding_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'homepage.dart';
import 'show_app.dart';
import 'themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import '../show_app.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          actions: [],
          title: Text(
            "cx Pro",
            style: TextStyle(
              // ignore: deprecated_member_use
              color: Colors.black,
              fontSize: 14 * textScale,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: AnimatedSplashScreen(
            duration: 3000,
            splash: Text(
              "cx Pro",
              style: TextStyle(
                // ignore: deprecated_member_use
                color: theme.highlightColor,
                fontSize: 32 * textScale,
                fontWeight: FontWeight.w900,
              ),
            ),
            nextScreen: ShowApp(),
            backgroundColor: Colors.black),
      ),
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
    );
  }
}
