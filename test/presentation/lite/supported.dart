
import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Supported extends StatefulWidget {
  @override
  _SupportedState createState() => _SupportedState();
}

class _SupportedState extends State<Supported> {
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
          backgroundColor: theme.primaryColor,
          automaticallyImplyLeading: false,
          title:  Text('mobile webview ',style:TextStyle(fontSize:14*textScale )),
        ),
        body: const WebView(
          initialUrl: 'https://flutter.dev',
        ));
  }
}