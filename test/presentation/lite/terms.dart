
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
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
  backgroundColor:theme.scaffoldBackgroundColor,          automaticallyImplyLeading: false,
          title:  Text('mobile webview ',style:TextStyle(fontSize:14*textScale )),
        ),
        body: const WebView(
          initialUrl: 'https://flutter.dev',
        ));
  }
}