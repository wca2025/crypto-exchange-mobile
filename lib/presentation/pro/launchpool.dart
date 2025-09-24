
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class LaunchpoolMaterial extends StatefulWidget {
  @override
  _LaunchpoolMaterialState createState() => _LaunchpoolMaterialState();
}

class _LaunchpoolMaterialState extends State<LaunchpoolMaterial> {
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
          title: const Text(' LaunchpoolMaterial '),
        ),
        body: const WebView(
              zoomEnabled:true,
          initialUrl: 'https://flutter.dev',
        ));
  }
}





class LaunchpoolCupertino extends StatefulWidget {
  @override
  _LaunchpoolCupertinoState createState() => _LaunchpoolCupertinoState();
}

class _LaunchpoolCupertinoState extends State<LaunchpoolCupertino> {
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
          title: const Text(' Launchpool '),
        ),
        body: const WebView(
              zoomEnabled:true,
          initialUrl: 'https://flutter.dev',
        ));
  }
}