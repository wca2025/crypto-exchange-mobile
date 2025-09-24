import 'dart:ui';

import '../pro/resetpassword1.dart';

import 'messages.dart';
import 'profile.dart';

import 'about.dart';
import 'accountprofile.dart';
import 'addresslist.dart';
import 'change_password.dart';
import 'deleteaccount.dart';
import 'disableaccount.dart';
import 'language.dart';
import 'orders.dart';
import 'paymentmethodlist.dart';
import 'phoneverification.dart';
import 'trading_password.dart';
import 'verificationpersonal.dart';
import 'verificationpersonal.dart';
import 'package:flutter/services.dart';
import 'account2.dart';
import 'antiphishing.dart';
import 'emailverification.dart';
import 'emailverification2.dart';
import 'twofa.dart';
import 'home_view.dart';
import 'homepage.dart';
import 'trade.dart';
import 'market.dart';
import 'sign_in.dart';
// import 'travel_bean.dart';
// import 'download2.dart';
// import 'downloads.dart';
//
import '../widgets/responsive.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
// import 'stream.dart';
import 'package:share/share.dart';

class Modals extends StatefulWidget {
  @override
  _ModalsState createState() => _ModalsState();
}

class _ModalsState extends State<Modals> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _ModalsMobile(),
          tablet: _ModalsTablet(),
        ),
      ),
    );
  }
}

class _ModalsTablet extends StatefulWidget {
  @override
  __ModalsTabletState createState() => __ModalsTabletState();
}

class __ModalsTabletState extends State<_ModalsTablet> {
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
    super.dispose();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context);

    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  _showSimpleModalDialog1(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 300),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'To protect your assets,please complete the following security settings before you start the P2P trading'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('X Bind Phone Number'),
                      // leading: Radio(
                      //   value: BestTutorSite.tutorialandexample,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog2(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'You will nedd to pay USD for the purchase. Do you have a USD account?'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('No',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 16 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog3(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text('Please set the trading password'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog4(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 300),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'To protect your assets,please complete the following settings before editing your payment methods:'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('X Bind Phone Number',
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                      subtitle: Text('X Trading Password',
                          style: TextStyle(color: Colors.black)),
                      // leading: Radio(
                      //   value: BestTutorSite.tutorialandexample,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog5(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 300),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'Please note that payment must be completed within this time window Are you sure that you want to save the page?:'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('No',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog6(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 200),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title:
                          Text('Please  complete the KYC verification first:'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Verify Now',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showSimpleModalDialog6(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 400),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('NEW VERSION',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text('Version updte:'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Version updte:1'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Version updte:2'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Version updte:3'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Update Now',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showSimpleModalDialog7(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'Only merchants can create and manage ads .You  can apply to become a merchant by submitting the following materials'),
                      subtitle: Column(
                        children: [
                          Text(
                              "An ID in the same name as your identity verification"),
                          Text("A personal cash flow statement")
                        ],
                      ),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Apply Now',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog8(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'Are you sure you want to return to the previous page/ Your submitted information will be cleared'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog12(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 200),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'To configure a Touch ID enable Touch ID on phone through Settins > Touch ID first'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog13(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 500),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Verfifcation',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'You must meet the following the requirements to post an ad'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Identity Verfification'),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('check now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Link Your email address'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('check now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Link your mobile number'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('check now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    ListTile(
                      title:
                          Text('Posiiton value(fnuding account>=100.0 usdt)'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('check now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                          'No of P2P orders(no of buy orders within 30 days >=5(0/5),No of counterparties >=3(0/3))'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('check now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Select another ad',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog10(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 400),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'The advertiser has set the following requirements and you must fufill them first to place an roder on this ad.'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Identity Verfification'),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('1.45%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Link Your email address'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('1.45%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Link your mobile number'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('1.45%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Sleect another ad',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog14(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 400),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text('Confirm order(BTC/USDT MakerBuy'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Order Amount'),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('1.45%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Available Balance'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('1.45%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Auto Borrow'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('1.45%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Reference Day Rate'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('1.45%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Sleect another ad',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog11(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'Your payment method does not match the required by the buyer Select another payment methdo or trade with anothr buyer'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
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
        elevation: 0.5,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: Text('Modals',
            style: TextStyle(fontSize: 15 * textScale, color: Colors.black87)),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: screenHeight * 1.9,
            color: theme.backgroundColor,
            child: Column(
              children: <Widget>[
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog1(context);
                        },
                        child: Text("p2p trading",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15 * textScale)),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog2(context);
                        },
                        child: Text("p2p trading",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15 * textScale)),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog3(context);
                        },
                        child: Text("Trading",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog4(context);
                        },
                        child: Text("edit paymemt method",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog5(context);
                        },
                        child: Text("fwrw",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog6(context);
                        },
                        child: Text("payment",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          showSimpleModalDialog7(context);
                        },
                        child: Text(" Clear Cache",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog8(context);
                        },
                        child: Text("modals",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog10(context);
                        },
                        child: Text("modals",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog11(context);
                        },
                        child: Text("modals",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog12(context);
                        },
                        child: Text("modals",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog13(context);
                        },
                        child: Text("modals",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
              ],
            )),
      ),
    );
  }

  fetchSession() {}
}

class _ModalsMobile extends StatefulWidget {
  @override
  _ModalsMobileState createState() => _ModalsMobileState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class _ModalsMobileState extends State<_ModalsMobile> {
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
    super.dispose();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context);

    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  _showSimpleModalDialog1(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 300),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'To protect your assets,please complete the following security settings before you start the P2P trading'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('X Bind Phone Number'),
                      // leading: Radio(
                      //   value: BestTutorSite.tutorialandexample,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog2(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'You will nedd to pay USD for the purchase. Do you have a USD account?'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('No',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 16 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog3(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text('Please set the trading password'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog4(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 300),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'To protect your assets,please complete the following settings before editing your payment methods:'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('X Bind Phone Number',
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                      subtitle: Text('X Trading Password',
                          style: TextStyle(color: Colors.black)),
                      // leading: Radio(
                      //   value: BestTutorSite.tutorialandexample,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog5(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'Please note that payment must be completed within this time window Are you sure that you want to save the page?:'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('No',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog6(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 200),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title:
                          Text('Please  complete the KYC verification first:'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Verify Now',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showSimpleModalDialog6(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 400),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('NEW VERSION',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text('Version updte:'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Version updte:1'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Version updte:2'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Version updte:3'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Update Now',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showSimpleModalDialog7(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'Only merchants can create and manage ads .You  can apply to become a merchant by submitting the following materials'),
                      subtitle: Column(
                        children: [
                          Text(
                              "An ID in the same name as your identity verification"),
                          Text("A personal cash flow statement")
                        ],
                      ),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Apply Now',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog8(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'Are you sure you want to return to the previous page/ Your submitted information will be cleared'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog12(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 200),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'To configure a Touch ID enable Touch ID on phone through Settins > Touch ID first'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog13(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 550, minHeight: 500),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Verfifcation',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'You must meet the following the requirements to post an ad'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Identity Verfification'),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('check now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Link Your email address'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('check now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Link your mobile number'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('check now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    ListTile(
                      title:
                          Text('Posiiton value(fnuding account>=100.0 usdt)'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('check now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                          'No of P2P orders(no of buy orders within 30 days >=5(0/5),No of counterparties >=3(0/3))'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('check now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Select another ad',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog10(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 400),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'The advertiser has set the following requirements and you must fufill them first to place an roder on this ad.'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Identity Verfification'),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('1.45%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    ListTile(
                      title: Text('Link Your email address'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('1.45%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Link your mobile number'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                      trailing: Container(
                        height: screenHeight * 0.048,
                        width: screenWidth * 0.198,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('1.45%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Sleect another ad',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog11(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 250),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                        ],
                      ),
                      // leading: Radio(
                      //   value: BestTutorSite.javatpoint,
                      //   groupValue: _site,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    ListTile(
                      title: Text(
                          'Your payment method does not match the required by the buyer Select another payment methdo or trade with anothr buyer'),
                      // leading: Radio(
                      //     value: BestTutorSite.w3schools,
                      //     groupValue: _site,
                      //     onChanged: (value) {}),
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth * 0.750,
                            height: screenHeight * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: theme.scaffoldBackgroundColor),
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: InkWell(
                                // onTap: _signUp,
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    // Navigator.of(context,rootNavigator: true).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) {
                                    //   return Convert();
                                    // }));
                                  },
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ]),
                    SizedBox(
                      height: screenWidth * 0.020,
                    ),
                    Row(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.030,

                          // color: Colors.grey,
                          child: InkWell(
                              onTap: () {},
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14 * textScale))),
                        ),
                      ))
                    ]),
                  ],
                ),
              ),
            ),
          );
        });
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
        elevation: 0.5,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: Text('Modals',
            style: TextStyle(fontSize: 15 * textScale, color: Colors.black87)),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: screenHeight * 1.9,
            color: theme.backgroundColor,
            child: Column(
              children: <Widget>[
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog1(context);
                        },
                        child: Text("p2p trading",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15 * textScale)),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog2(context);
                        },
                        child: Text("p2p trading",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15 * textScale)),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog3(context);
                        },
                        child: Text("Trading",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog4(context);
                        },
                        child: Text("edit paymemt method",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog5(context);
                        },
                        child: Text("fwrw",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog6(context);
                        },
                        child: Text("payment",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          showSimpleModalDialog7(context);
                        },
                        child: Text(" Clear Cache",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog8(context);
                        },
                        child: Text("modals",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog10(context);
                        },
                        child: Text("modals",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog11(context);
                        },
                        child: Text("modals",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog12(context);
                        },
                        child: Text("modals",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          _showSimpleModalDialog13(context);
                        },
                        child: Text("modals",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
