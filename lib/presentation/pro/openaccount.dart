import 'show_app.dart';

import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/cupertino.dart';

class OpenAccountPageMaterial extends StatefulWidget {
  const OpenAccountPageMaterial({Key? key}) : super(key: key);

  @override
  _OpenAccountPageMaterialState createState() => _OpenAccountPageMaterialState();
}

class _OpenAccountPageMaterialState extends State<OpenAccountPageMaterial> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _OpenAccountPageMaterialMobile(),
          tablet: _OpenAccountPageMaterialTablet(),
        ),
      ),
    );
  }
}

class _OpenAccountPageMaterialTablet extends StatefulWidget {
  @override
  __OpenAccountPageMaterialTabletState createState() =>
      __OpenAccountPageMaterialTabletState();
}

class __OpenAccountPageMaterialTabletState
    extends State<_OpenAccountPageMaterialTablet> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (_) => ShowAppMaterial()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      // descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.grey,
      imagePadding: EdgeInsets.zero,
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "unlimited  films ",
              body: "watch anywhere cancel at anytime",
              image: _buildImage('img1'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "download and watch offline",
              body: " always have something to watch",
              image: _buildImage('img2'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Kids and teens",
              body:
                  "Kids and teens can track their stocks 24/7 and place trades that you approve.",
              image: _buildImage('img3'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "No annoying contracts",
              body: "join today cancel at anytime",
              image: _buildImage('img2'),
              // footer: RaisedButton(
              //   onPressed: () {
              //     introKey.currentState?.animateScroll(0);
              //   },
              //   child: const Text(
              //     'FooButton',
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   // color: Colors.lightBlue,
              //   color: Colors.blueGrey,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8.0),
              //   ),
              // ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "watch everywhere",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("stream on your phone", style: bodyStyle),
                  // Icon(Icons.edit),
                  Text("tablet laptop tv and more", style: bodyStyle),
                ],
              ),
              image: _buildImage('img1'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          // skipFlex: 0,
          nextFlex: 0,
          skip: const Text('Skip'),
          next: const Icon(Icons.arrow_forward),
          done: const Text('continue',
              style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            // color: Color(0xFFBDBDBD),
            color: Colors.white,
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class _OpenAccountPageMaterialMobile extends StatefulWidget {
  @override
  _OpenAccountPageMaterialMobileState createState() =>
      _OpenAccountPageMaterialMobileState();
}

class _OpenAccountPageMaterialMobileState
    extends State<_OpenAccountPageMaterialMobile> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (_) => ShowAppMaterial()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    const bodyStyle = TextStyle(fontSize: 19.0);
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      // descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "Welcome to cx ",
              body:
                  "The most trusted cyrptocurrency exchange with over 10,00,000 users worldwide",
              image: _buildImage('img1'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "One Click Trading ",
              body:
                  "We make crypto trading quick and simple with our innovative",
              image: _buildImage('img2'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Exclusive welcome gifts",
              body: "Signup now to receive exclusive welcomed gitfs.",
              image: _buildImage('img3'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          // skipFlex: 0,
          nextFlex: 0,
          skip: Text(
            'Skip',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12 * textScale,
              fontWeight: FontWeight.w400,
            ),
          ),
          next: Icon(
            Icons.arrow_forward,
            color: Colors.grey,
          ),
          done: Text(
            'continue',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12 * textScale,
              fontWeight: FontWeight.w400,
            ),
          ),
          dotsDecorator: DotsDecorator(
            size: Size(10.0, 10.0),
            // color: Color(0xFFBDBDBD),
            color: Colors.grey,

            activeColor: Colors.grey,
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class OpenAccountCupertinoPage extends StatefulWidget {
  const OpenAccountCupertinoPage({Key? key}) : super(key: key);

  @override
  _OpenAccountCupertinoPageState createState() =>
      _OpenAccountCupertinoPageState();
}

class _OpenAccountCupertinoPageState extends State<OpenAccountCupertinoPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _OpenAccountCupertinoPageMobile(),
          tablet: _OpenAccountCupertinoPageTablet(),
        ),
      ),
    );
  }
}

class _OpenAccountCupertinoPageTablet extends StatefulWidget {
  @override
  __OpenAccountCupertinoPageTabletState createState() =>
      __OpenAccountCupertinoPageTabletState();
}

class __OpenAccountCupertinoPageTabletState
    extends State<_OpenAccountCupertinoPageTablet> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (_) => ShowAppCupertino()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      // descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.grey,
      imagePadding: EdgeInsets.zero,
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "unlimited  films ",
              body: "watch anywhere cancel at anytime",
              image: _buildImage('img1'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "download and watch offline",
              body: " always have something to watch",
              image: _buildImage('img2'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Kids and teens",
              body:
                  "Kids and teens can track their stocks 24/7 and place trades that you approve.",
              image: _buildImage('img3'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "No annoying contracts",
              body: "join today cancel at anytime",
              image: _buildImage('img2'),
              // footer: RaisedButton(
              //   onPressed: () {
              //     introKey.currentState?.animateScroll(0);
              //   },
              //   child: const Text(
              //     'FooButton',
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   // color: Colors.lightBlue,
              //   color: Colors.blueGrey,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(8.0),
              //   ),
              // ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "watch everywhere",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("stream on your phone", style: bodyStyle),
                  // Icon(Icons.edit),
                  Text("tablet laptop tv and more", style: bodyStyle),
                ],
              ),
              image: _buildImage('img1'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          // skipFlex: 0,
          nextFlex: 0,
          skip: const Text('Skip'),
          next: const Icon(Icons.arrow_forward),
          done: const Text('continue',
              style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            // color: Color(0xFFBDBDBD),
            color: Colors.white,
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class _OpenAccountCupertinoPageMobile extends StatefulWidget {
  @override
  _OpenAccountCupertinoPageMobileState createState() =>
      _OpenAccountCupertinoPageMobileState();
}

class _OpenAccountCupertinoPageMobileState
    extends State<_OpenAccountCupertinoPageMobile> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (_) => ShowAppCupertino()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    const bodyStyle = TextStyle(fontSize: 19.0);
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      // descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "Cogratunlations on abcoming s master trader  ",
              body:
                  "Your pofile pciture nickname and personal information will be updated after review",
              image: _buildImage('img1'),
              decoration: pageDecoration,
            )],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          // skipFlex: 0,
          nextFlex: 0,
          skip: Text(
            'Skip',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12 * textScale,
              fontWeight: FontWeight.w400,
            ),
          ),
          next: Icon(
            Icons.arrow_forward,
            color: Colors.grey,
          ),
          done: Text(
            'continue',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12 * textScale,
              fontWeight: FontWeight.w400,
            ),
          ),
          dotsDecorator: DotsDecorator(
            size: Size(10.0, 10.0),
            // color: Color(0xFFBDBDBD),
            color: Colors.grey,

            activeColor: Colors.grey,
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
    );
  }
}
