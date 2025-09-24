import 'faq.dart';
import 'package:flutter/services.dart';
// import 'copyright.dart';
// import 'downloads.dart';
// import 'license.dart';
// import 'license_agreement.dart';
// import 'privacy.dart';
// import 'privacy_policy.dart';
import '../widgets/responsive.dart';

import 'onlinesupport.dart';
// import 'terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/cupertino.dart';

import 'submitrequest.dart';

class Support extends StatefulWidget {
  final Color passedColor;
  final String passedColorName;
  const Support(
      {Key? key, required this.passedColor, required this.passedColorName})
      : super(key: key);
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        body: Responsive(
          mobile: _SupportMobile(
            passedColor: Colors.pink,
            passedColorName: 'Pink',
            key: null,
          ),
          tablet: _SupportTablet(
            passedColor: Colors.pink,
            passedColorName: 'Pink',
            key: null,
          ),
        ),
      ),
    );
  }
}

class _SupportTablet extends StatefulWidget {
  final Color passedColor;
  final String passedColorName;

  @override
  __SupportTabletState createState() => __SupportTabletState();

  const _SupportTablet(
      {Key? key, required this.passedColor, required this.passedColorName})
      : super(key: key);
}

class __SupportTabletState extends State<_SupportTablet> {
  @override
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // BackButtonInterceptor.remove(myInterceptor);
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context);

    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        resizeToAvoidBottomInset: false, //new line

        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          automaticallyImplyLeading: false,
          title: const Text('Support mobile'),
        ),
        body: ListView(
          // padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: screenHeight * 0.060,
              // color: passedColor,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return OnlineSupport();
                  }));
                },
                child: const Center(child: Text('Online Support:')),
              ),
            ),
            Divider(
              color: Colors.blueGrey[100],
              height: 2,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: screenHeight * 0.060,
              // color: Colors.grey,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return SubmitRequest();
                  }));
                },
                child: const Center(child: Text('Submit A Request')),
              ),
            ),
            Divider(
              color: Colors.blueGrey[100],
              height: 2,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: screenHeight * 0.060,
              // color: Colors.blueGrey,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Faq();
                  }));
                },
                child: const Center(child: Text('FAQ')),
              ),
            ),
          ],
        ));
  }
}

class _SupportMobile extends StatefulWidget {
  final Color passedColor;
  final String passedColorName;

  const _SupportMobile(
      {Key? key, required this.passedColor, required this.passedColorName})
      : super(key: key);
  @override
  _SupportMobileState createState() => _SupportMobileState(
      passedColor: this.passedColor, passedColorName: this.passedColorName);
}

class _SupportMobileState extends State<_SupportMobile> {
  Color passedColor;
  String passedColorName;
  _SupportMobileState(
      {required this.passedColor, required this.passedColorName});

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        resizeToAvoidBottomInset: false, //new line

        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          automaticallyImplyLeading: false,
          title: Text('Support mobile',
              style: TextStyle(fontSize: 14 * textScale)),
        ),
        body: ListView(
          // padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: screenHeight * 0.060,
              // color: passedColor,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return OnlineSupport();
                  }));
                },
                child: const Center(child: Text('Online Support:')),
              ),
            ),
            Divider(
              color: Colors.blueGrey[100],
              height: 2,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: screenHeight * 0.060,
              // color: Colors.grey,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return SubmitRequest();
                  }));
                },
                child: const Center(child: Text('Submit A Request')),
              ),
            ),
            Divider(
              color: Colors.blueGrey[100],
              height: 2,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: screenHeight * 0.060,
              // color: Colors.blueGrey,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Faq();
                  }));
                },
                child: const Center(child: Text('FAQ')),
              ),
            ),
          ],
        ));
  }
}
