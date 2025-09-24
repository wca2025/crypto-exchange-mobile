import 'show_app.dart';

import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/cupertino.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _OnBoardingPageMobile(),
          tablet: _OnBoardingPageTablet(),
        ),
      ),
    );
  }
}

class _OnBoardingPageTablet extends StatefulWidget {
  @override
  __OnBoardingPageTabletState createState() => __OnBoardingPageTabletState();
}

class __OnBoardingPageTabletState extends State<_OnBoardingPageTablet> {
 final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (_) => ShowApp()),
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

class _OnBoardingPageMobile extends StatefulWidget {
  @override
  _OnBoardingPageMobileState createState() => _OnBoardingPageMobileState();
}

class _OnBoardingPageMobileState extends State<_OnBoardingPageMobile> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (_) => ShowApp()),
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
    var  pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      // descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor:Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "Get up to 500USD in cash advances",
              body: "Get 0% APR cash advacnes up to 500USD for anything you want  .Deposited within minutes",
              image: _buildImage('img1'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "  Lighting Fast Transfers",
              body: "Get your funds transferd within minutes with tiurbo transfers",
              image: _buildImage('img2'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Mo credit checks or monthly fees",
              body:
                  "Get instacash with no strings attached",
              image: _buildImage('img3'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Felxible repayment dates",
              body:
                  "Request anytime you need it repay on yuor payday you.we got your bacl",
              image: _buildImage('img3'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Unlock Boosts to get additional funds",
              body:
                  "Earn Boosts for on time repayments and  through promotions to boost your instacash limit",
              image: _buildImage('img3'),
              decoration: pageDecoration,
            ),
           
        
          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          // skipFlex: 0,
          nextFlex: 0,
          skip:  Text('Skip',    style: TextStyle(
                                              color:Colors.grey ,
                                              fontSize: 12 * textScale,
                                              fontWeight: FontWeight.w400,
                                            ),),
          next:  Icon(Icons.arrow_forward,color: Colors.grey ,),
          done:  Text('continue',
              style: TextStyle(
                                              color: Colors.grey ,
                                              fontSize: 12 * textScale,
                                              fontWeight: FontWeight.w400,
                                            ),),
          dotsDecorator:  DotsDecorator(
            size: Size(10.0, 10.0),
            // color: Color(0xFFBDBDBD),
            color: Colors.grey ,
    
            activeColor:Colors.grey ,
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
