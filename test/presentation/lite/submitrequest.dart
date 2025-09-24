
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

class SubmitRequest extends StatefulWidget {
  @override
  _SubmitRequestState createState() => _SubmitRequestState();
}

class _SubmitRequestState extends State<SubmitRequest> {
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
          backgroundColor:theme.backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text('SubmitRequest',style:TextStyle(fontSize:14*textScale,color:Colors.black )),
        ),
        body: const WebView(
          initialUrl: 'https://flutter.dev',
        ));
  }



}