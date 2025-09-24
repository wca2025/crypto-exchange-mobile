import 'package:flutter/material.dart';
class Responsive extends StatelessWidget {
  final Widget mobile;
   final Widget tablet;

  const Responsive({
    required this.mobile,
     required this.tablet,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 640;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 640 &&
      MediaQuery.of(context).size.width < 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 640) {
          return tablet;
        } 
        else {
          return mobile;
        }
      },
    );
  }
}
