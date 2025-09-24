
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CopyrightMaterial extends StatefulWidget {
  @override
  _CopyrightMaterialState createState() => _CopyrightMaterialState();
}

class _CopyrightMaterialState extends State<CopyrightMaterial> {
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
        appBar: AppBar(
                elevation: 0.2,
 bottomOpacity: 1.0,
 shadowColor: theme.scaffoldBackgroundColor,
  backgroundColor:theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: const Text(' CopyrightMaterial '),
        ),
        body: const WebView(
              zoomEnabled:true,
          initialUrl: 'https://flutter.dev',
        ));
  }
}



class CopyrightCupertino extends StatefulWidget {
  @override
  _CopyrightCupertinoState createState() => _CopyrightCupertinoState();
}

class _CopyrightCupertinoState extends State<CopyrightCupertino> {
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
        appBar: AppBar(
                elevation: 0.2,
 bottomOpacity: 1.0,
 shadowColor: theme.scaffoldBackgroundColor,
  backgroundColor:theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: const Text(' Copyright '),
        ),
        body: const WebView(
              zoomEnabled:true,
          initialUrl: 'https://flutter.dev',
        ));
  }
}


