
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

class LicenseAgreement extends StatefulWidget {
  const LicenseAgreement({Key? key}) : super(key: key);

  @override
  _LicenseAgreementState createState() => _LicenseAgreementState();
}

class _LicenseAgreementState extends State<LicenseAgreement> {
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
          title: const Text('mobile webview '),
        ),
        body: const WebView(
          initialUrl: 'https://flutter.dev',
        ));
  }
}