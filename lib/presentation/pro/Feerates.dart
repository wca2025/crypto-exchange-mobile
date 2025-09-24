import 'profile.dart';

import 'about.dart';
import 'accountprofile.dart';
import 'address_list.dart';
import 'change_password.dart';
import 'delete_account.dart';
import 'disable_account.dart';
import 'language.dart';
import 'orders.dart';
import 'paymentmethodlist.dart';
import 'phoneverification.dart';
import 'trading_password.dart';
import 'verificationpersonal.dart';
import 'verificationbusiness.dart';
import 'verificationpersonal.dart';
import 'package:flutter/services.dart';
import 'account.dart';
import 'antiphishing.dart';
import 'emailverification.dart';
import 'emailverification2.dart';
import 'twofa.dart';
import 'home_view.dart';
import 'homepage.dart';
import 'trade.dart';
import 'market.dart';
import 'sign_in.dart';
import 'Device_management.dart';
// import 'travel_bean.dart';
// import 'download2.dart';
// import 'downloads.dart';
//
import '../widgets/responsive.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
// import 'stream.dart';
import 'package:share/share.dart';

class FeeRates extends StatefulWidget {
  @override
  _FeeRatesState createState() => _FeeRatesState();
}

class _FeeRatesState extends State<FeeRates> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _FeeRatesMobile(),
          tablet: _FeeRatesTablet(),
        ),
      ),
    );
  }
}

class _FeeRatesTablet extends StatefulWidget {
  @override
  __FeeRatesTabletState createState() => __FeeRatesTabletState();
}

class __FeeRatesTabletState extends State<_FeeRatesTablet> {
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
                      title: const Text('best'),
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
                      title: const Text('better'),
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
                      title: const Text('good'),
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
                              child: Text('lorem ipsum '),
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
        title: Text('FeeRates',
            style: TextStyle(fontSize: 15 * textScale, color: Colors.black87)),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: screenHeight * 1.90,
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
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return Changepassword();
                          }));
                        },
                        child: Text("Login Password",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
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
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return Tradingpassword();
                          }));
                        },
                        child: Text("Trading Password",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
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
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return EmailPhoneVerification2();
                          }));
                        },
                        child: Text("Email",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
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
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return PhoneVerification();
                          }));
                        },
                        child: Text("Phone",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
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
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return Twofa();
                          }));
                        },
                        child: Text("Google Verification",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
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
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return Antiphishing();
                          }));
                        },
                        child: Text("Anti Phishing Safety Phrase ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
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
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return Devicemanagement();
                          }));
                        },
                        child: Text("Device  Management",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
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
                            // Navigator.of(context,rootNavigator: true)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return Language();
                            // }));
                          },
                          child: Row(
                            children: [
                              Text("FingerPrint Lock",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15 * textScale)),
                            ],
                          )),
                      trailing: InkWell(
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
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                          onTap: () {
                            // Navigator.of(context,rootNavigator: true)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return Language();
                            // }));
                          },
                          child: Row(
                            children: [
                              Text("Pattern Lock ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15 * textScale)),
                            ],
                          )),
                      trailing: InkWell(
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
                    )),
              ],
            )),
      ),
    );
  }

  fetchSession() {}
}

class _FeeRatesMobile extends StatefulWidget {
  @override
  _FeeRatesMobileState createState() => _FeeRatesMobileState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class _FeeRatesMobileState extends State<_FeeRatesMobile> {
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
                      title: const Text('best'),
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
                      title: const Text('better'),
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
                      title: const Text('good'),
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
                              child: Text('lorem ipsum '),
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
        title: Text('FeeRates',
            style: TextStyle(fontSize: 15 * textScale, color: Colors.black87)),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: screenHeight * 1.90,
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
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return Devicemanagement();
                          }));
                        },
                        child: Text("My Trading Level",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale)),
                      ),
                      trailing: Text("Regular",
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w500,
                              fontSize: 15 * textScale)),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.08,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return Devicemanagement();
                          }));
                        },
                        child: Text("Use CX to  pay Fees ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale)),
                      ),
                      trailing: InkWell(
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
                      subtitle: Text("Enojy 25% discount when trading",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12 * textScale)),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.08,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return Devicemanagement();
                          }));
                        },
                        child: Text("Use CX to pay margin Interests",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale)),
                      ),
                      trailing: InkWell(
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
                      subtitle: Text("Enojy 5% discount when trading",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12 * textScale)),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          // Navigator.of(context, rootNavigator: true)
                          //     .push(MaterialPageRoute(builder: (context) {
                          //   return Devicemanagement();
                          // }));
                        },
                        child: Text("Learn more",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale)),
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
