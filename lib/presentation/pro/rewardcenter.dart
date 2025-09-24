
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RewardCenter extends StatefulWidget {
  @override
  _RewardCenterState createState() => _RewardCenterState();
}

class _RewardCenterState extends State<RewardCenter> {
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
          title:  Text('RewardCenter ',style:TextStyle(fontSize:14*textScale,color:Colors.black )),
        ),
        body: const WebView(
              zoomEnabled:true,
          initialUrl: 'https://flutter.dev',
        ));
  }
}