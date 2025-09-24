import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/kyc/kyc_bloc.dart';
import 'addaddress.dart';
import 'editad.dart';
import 'postad.dart';
import 'verificationbusiness.dart';
import 'package:flutter/services.dart';

import 'editaddress.dart';

import '../widgets/responsive.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
// import 'stream.dart';
import 'package:share/share.dart';
import 'package:flutter/cupertino.dart';

import 'travel_bean.dart';
import 'verificationpersonal.dart';
import 'package:flutter_idensic_mobile_sdk_plugin/flutter_idensic_mobile_sdk_plugin.dart';

void launchSDK() async {
  // From your backend get an access token for the applicant to be verified.
  // The token must be generated with `levelName` and `userId`,
  // where `levelName` is the name of a level configured in your dashboard.
  //
  // The sdk will work in the production or in the sandbox environment
  // depend on which one the `accessToken` has been generated on.
  //
  final String accessToken = "your_access_token";

  // The access token has a limited lifespan and when it's expired, you must provide another one.
  // So be prepared to get a new token from your backend.
  final onTokenExpiration = () async {
    // call your backend to fetch a new access token (this is just an example)
    return Future<String>.delayed(
        Duration(seconds: 2), () => "your new access token");
  };

  final SNSStatusChangedHandler onStatusChanged =
      (SNSMobileSDKStatus newStatus, SNSMobileSDKStatus prevStatus) {
    print("The SDK status was changed: $prevStatus -> $newStatus");
  };

  final snsMobileSDK = SNSMobileSDK.init(accessToken, onTokenExpiration)
      .withHandlers(
          // optional handlers
          onStatusChanged: onStatusChanged)
      .withDebug(true) // set debug mode if required
      .withLocale(Locale(
          "en")) // optional, for cases when you need to override the system locale
      .build();

  final SNSMobileSDKResult result = await snsMobileSDK.launch();

  print("Completed with result: $result");
}

class VerificationBusiness extends StatefulWidget {
  @override
  VerificationBusinessState createState() => VerificationBusinessState();
}

class VerificationBusinessState extends State<VerificationBusiness> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: VerificationBusinessMobile(),
          tablet: VerificationBusinessTablet(),
        ),
      ),
    );
  }
}

class VerificationBusinessTablet extends StatefulWidget {
  @override
  VerificationBusinessTabletState createState() =>
      VerificationBusinessTabletState();
}

class VerificationBusinessTabletState
    extends State<VerificationBusinessTablet> {
  BestTutorSite _site = BestTutorSite.javatpoint;
  bool isSwitched = false;

  String authState = "User not signed in";
  String hubEvent = "";
  String error = "";
  List<String> exceptions = [];

  @override
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
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

  void showResult(_authState) async {}

  final String _content =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';

  void _shareContent() {
    Share.share(_content);
  }

  _showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text('VerificationBusiness'),
                      leading: Radio(
                        value: BestTutorSite.javatpoint,
                        groupValue: _site,
                        onChanged: (value) {},
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    ListTile(
                      title: const Text('login notices'),
                      leading: Radio(
                          value: BestTutorSite.w3schools,
                          groupValue: _site,
                          onChanged: (value) {}),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    ListTile(
                      title: const Text('assets'),
                      leading: Radio(
                        value: BestTutorSite.tutorialandexample,
                        groupValue: _site,
                        onChanged: (value) {},
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
                        height: 60,
                        // color: Colors.grey,

                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(' market alert '),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return Download();
                                // }));
                              },
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ),
                          ],
                        )),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Container(
                        height: 60,
                        // color: Colors.grey,

                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(' market alert '),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return Download();
                                // }));
                              },
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ),
                          ],
                        )),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        // Navigator.of(context,rootNavigator: true)
        //     .push(MaterialPageRoute(builder: (context) => SettingPage())

        //     );
        break;
      case 1:
        print("Privacy Clicked");
        break;
      case 2:
        print("User Logged out");
        // Navigator.of(context,rootNavigator: true).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => LoginPage()
        //     ),
        //     (route) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    List<TravelBean> _list = TravelBean.generateMostPopularBean();
    final ScrollController _controller = ScrollController();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
          elevation: 0.5,
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: const Text('VerificationBusiness',
              style: TextStyle(color: Colors.black87, fontSize: 14)),
          actions: [
            Container(
              width: screenWidth * 0.50,
              height: screenHeight * 0.35,
              // color: Colors.grey[400],
              child: Row(
                children: [
                  Expanded(child: Container(width: screenWidth * 0.035)),
                  InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return VerificationPersonal();
                      }));
                    },
                    child: const Text('Personal',
                        style: TextStyle(color: Colors.black87)),
                  )
                ],
              ),
            )
          ]),
      body: ListView(
        controller: _controller,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        // itemCount: 3,
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          Center(
            child: Container(
              // width: screenWidth * 0.95,
              color: theme.scaffoldBackgroundColor,

              //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Card(
                elevation: 0,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Row(children: [
                        Text('Current Verification',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale)),
                        Padding(padding: EdgeInsets.only(left: 135.0)),
                      ]),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 1, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "P2PTrading:no limit",
                                  style: TextStyle(
                                      fontSize: 12, color: theme.hoverColor),
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.65)),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 1, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "Fiat top up daily No limit ",
                                  style: TextStyle(
                                      fontSize: 12, color: theme.hoverColor),
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.65)),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 1, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "Coin Withdrawals:Daily 100 BTC",
                                  style: TextStyle(
                                      fontSize: 12, color: theme.hoverColor),
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.65)),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 1, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "Requirements",
                                  style: TextStyle(
                                      fontSize: 12, color: theme.hoverColor),
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.65)),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 1, bottom: 5, left: 12, right: 12),
                                child: Text(
                                  "Proof of Residence",
                                  style: TextStyle(
                                      fontSize: 12, color: theme.hoverColor),
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.65)),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 1, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "Proof of Residence",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: theme.backgroundColor),
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.65)),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 1, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "Proof of Residence",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: theme.backgroundColor),
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.65)),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 1, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "Proof of Residence",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: theme.backgroundColor),
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.65)),
                          ],
                        ),
                        Row(children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(
                                left: 32, right: 32, top: 5, bottom: 20),
                            child: GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: screenWidth * 0.045,
                                height: screenHeight * 0.045,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.0),
                                  color: theme.primaryColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: InkWell(
                                    // onTap: _signUp,
                                    child: Center(
                                      child: Text(
                                        'Verify Now',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12 * textScale,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  fetchSession() {}
}

class VerificationBusinessMobile extends StatefulWidget {
  @override
  VerificationBusinessMobileState createState() =>
      VerificationBusinessMobileState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class VerificationBusinessMobileState
    extends State<VerificationBusinessMobile> {
  BestTutorSite _site = BestTutorSite.javatpoint;
  bool isSwitched = false;

  String authState = "User not signed in";
  String hubEvent = "";
  String error = "";
  List<String> exceptions = [];

  @override
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
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

  void showResult(_authState) async {}

  final String _content =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';

  void _shareContent() {
    Share.share(_content);
  }

  _showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text('VerificationBusiness'),
                      leading: Radio(
                        value: BestTutorSite.javatpoint,
                        groupValue: _site,
                        onChanged: (value) {},
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    ListTile(
                      title: const Text('login notices'),
                      leading: Radio(
                          value: BestTutorSite.w3schools,
                          groupValue: _site,
                          onChanged: (value) {}),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    ListTile(
                      title: const Text('assets'),
                      leading: Radio(
                        value: BestTutorSite.tutorialandexample,
                        groupValue: _site,
                        onChanged: (value) {},
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
                        height: 60,
                        // color: Colors.grey,

                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(' market alert '),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return Download();
                                // }));
                              },
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ),
                          ],
                        )),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Container(
                        height: 60,
                        // color: Colors.grey,

                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(' market alert '),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return Download();
                                // }));
                              },
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ),
                          ],
                        )),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        // Navigator.of(context,rootNavigator: true)
        //     .push(MaterialPageRoute(builder: (context) => SettingPage())

        //     );
        break;
      case 1:
        print("Privacy Clicked");
        break;
      case 2:
        print("User Logged out");
        // Navigator.of(context,rootNavigator: true).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => LoginPage()
        //     ),
        //     (route) => false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    List<TravelBean> _list = TravelBean.generateMostPopularBean();
    final ScrollController _controller = ScrollController();

    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
            elevation: 0.5,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            title: const Text('VerificationBusiness',
                style: TextStyle(color: Colors.black87, fontSize: 14)),
            actions: [
              Container(
                width: screenWidth * 0.50,
                height: screenHeight * 0.35,
                // color: Colors.grey[400],
                child: Row(
                  children: [
                    Expanded(child: Container(width: screenWidth * 0.035)),
                    InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return VerificationPersonal();
                        }));
                      },
                      child: const Text('Personal',
                          style: TextStyle(color: Colors.black87)),
                    )
                  ],
                ),
              )
            ]),
        body:
            //  BlocConsumer<KycBloc, KycState>(
            //   listener: (context, state) {
            // TODO: implement listener
            //    if (state is _SuccessKycState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' succeess ', textScaleFactor: 1.5),
            //     ),
            //   );
            // }         else if (state is _ErrorKycState) {

            // ScaffoldMessenger.of(context).showSnackBar((
            //   const SnackBar(
            //     duration: Duration(seconds: 2),
            //     content: Text(' error ', textScaleFactor: 1.5),
            //   ),
            // );
            // }
            // },
            // builder: (context, state) {
            //   return
            ListView(
          controller: _controller,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          // itemCount: 3,
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            Center(
              child: Container(
                width: screenWidth * 0.95,
                color: theme.scaffoldBackgroundColor,

                //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Card(
                  elevation: 0,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Row(children: [
                          Text('Current Verification',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15 * textScale)),
                          Padding(padding: EdgeInsets.only(left: 135.0)),
                        ]),
                      ),
                      Divider(
                        color: Colors.blueGrey[100],
                        height: 2,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 12, right: 12),
                                  child: Text(
                                    "P2PTrading:no limit",
                                    style: TextStyle(
                                        fontSize: 12, color: theme.hoverColor),
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.65)),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 12, right: 12),
                                  child: Text(
                                    "Fiat top up daily No limit ",
                                    style: TextStyle(
                                        fontSize: 12, color: theme.hoverColor),
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.65)),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 12, right: 12),
                                  child: Text(
                                    "Coin Withdrawals:Daily 100 BTC",
                                    style: TextStyle(
                                        fontSize: 12, color: theme.hoverColor),
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.65)),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 12, right: 12),
                                  child: Text(
                                    "Requirements",
                                    style: TextStyle(
                                        fontSize: 12, color: theme.hoverColor),
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.65)),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 5, left: 12, right: 12),
                                  child: Text(
                                    "Proof of Residence",
                                    style: TextStyle(
                                        fontSize: 12, color: theme.hoverColor),
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.65)),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 12, right: 12),
                                  child: Text(
                                    "Proof of Residence",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: theme.backgroundColor),
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.65)),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 12, right: 12),
                                  child: Text(
                                    "Proof of Residence",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: theme.backgroundColor),
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.65)),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, left: 12, right: 12),
                                  child: Text(
                                    "Proof of Residence",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: theme.backgroundColor),
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.65)),
                            ],
                          ),
                          Row(children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.only(
                                  left: 32, right: 32, top: 5, bottom: 20),
                              child: GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.045,
                                  height: screenHeight * 0.045,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.0),
                                    color: theme.primaryColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: InkWell(
                                      // onTap: _signUp,
                                      child: Center(
                                        child: Text(
                                          'Verify Now',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12 * textScale,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
          //   );
          // },
        ));
  }
}
