import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/auth/auth_bloc.dart';
import 'about.dart';
import 'address_list.dart';
import 'change_password.dart';
import 'delete_account.dart';
import 'disable_account.dart';
import 'language.dart';
import 'nickname.dart';
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
// import 'travel_bean.dart';
// import 'download2.dart';
// import 'downloads.dart';
//
import '../widgets/responsive.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
// import 'stream.dart';
import 'package:share/share.dart';

class AccProfile extends StatefulWidget {
  @override
  _AccProfileState createState() => _AccProfileState();
}

class _AccProfileState extends State<AccProfile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _AccProfileMobile(),
          tablet: _AccProfileTablet(),
        ),
      ),
    );
  }
}

class _AccProfileTablet extends StatefulWidget {
  @override
  __AccProfileTabletState createState() => __AccProfileTabletState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class __AccProfileTabletState extends State<_AccProfileTablet> {
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
        title: Text('Profile',
            style: TextStyle(fontSize: 15 * textScale, color: Colors.black87)),
      ),
      body: Container(
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
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Changepassword();
                        // }));
                      },
                      child: Text("Profile Picture",
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
                          //   return Changepassword();
                          // }));
                        },
                        child: Row(
                          children: [
                            Text("UID:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12 * textScale,
                                )),
                            Text(
                                "                                                                                      ID56434",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black38,
                                  fontSize: 12 * textScale,
                                )),
                          ],
                        )),
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
                          return Nickname();
                        }));
                      },
                      child: Text("Nickname",
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
    );
  }
}

class _AccProfileMobile extends StatefulWidget {
  @override
  _AccProfileMobileState createState() => _AccProfileMobileState();
}

class _AccProfileMobileState extends State<_AccProfileMobile> {
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
          title: Text('Profile',
              style:
                  TextStyle(fontSize: 15 * textScale, color: Colors.black87)),
        ),
        body:
            //  BlocConsumer<AuthBloc, AuthState>(
            //   listener: (context, state) {
            // TODO: implement listener
            //  if (state is _SuccessAuthState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' succeess ', textScaleFactor: 1.5),
            //     ),
            //   );
            // } else if (state is _ErrorAuthState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' error ', textScaleFactor: 1.5),
            //     ),
            //   );
            // }
            // },
            // builder: (context, state) {
            // return
            Container(
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
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return Changepassword();
                              // }));
                            },
                            child: Text("Profile Picture",
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
                                //   return Changepassword();
                                // }));
                              },
                              child: Row(
                                children: [
                                  Text("UID:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12 * textScale,
                                      )),
                                  Text(
                                      "                                                                                      ID56434",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black38,
                                        fontSize: 12 * textScale,
                                      )),
                                ],
                              )),
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
                                return Nickname();
                              }));
                            },
                            child: Text("Nickname",
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
                ))

        // },
        // ),
        );
  }
}
