
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Referals extends StatefulWidget {
  @override
  _ReferalsState createState() => _ReferalsState();
}

class _ReferalsState extends State<Referals> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
        final textScale = MediaQuery.of(context).textScaleFactor;


    return Scaffold(
      backgroundColor: theme.backgroundColor,

        appBar: AppBar(
                elevation: 0.2,
 bottomOpacity: 1.0,
 shadowColor: theme.scaffoldBackgroundColor,
  backgroundColor:theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: const Text('Referals '),
        ),
        body: const WebView(
              zoomEnabled:true,
          initialUrl: 'https://flutter.dev',
        ));
  }
}