import 'modals.dart';
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
import 'verificationbusiness.dart';
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

import '../widgets/responsive.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
// import 'stream.dart';
import 'package:share/share.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _SettingsMobile(),
          tablet: _SettingsTablet(),
        ),
      ),
    );
  }
}

class _SettingsTablet extends StatefulWidget {
  @override
  __SettingsTabletState createState() => __SettingsTabletState();
}

class __SettingsTabletState extends State<_SettingsTablet> {
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
        title: Text('Settings',
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
                            return AccProfile();
                          }));
                        },
                        child: Text("Profile",
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
                              return Language();
                            }));
                          },
                          child: Row(
                            children: [
                              Text("Language ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15 * textScale)),
                            ],
                          )),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),

                //         Container(
                //             color: theme.backgroundColor,
                //             height: screenHeight * 0.06,
                //             // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                //             child: ListTile(
                //               title: InkWell(
                //                   onTap: () {
                //                     Navigator.of(context,rootNavigator: true)
                //                         .push(MaterialPageRoute(builder: (context) {
                //                       return Language();
                //                     }));
                //                   },
                //                   child: Row(
                //                     children: [
                //                       Text("Language ",
                //                           style: TextStyle(
                //                               fontWeight: FontWeight.w500,
                //                               fontSize: 15 * textScale)),
                //                     ],
                //                   )),
                //               trailing: const Icon(
                //                 Icons.keyboard_arrow_right,
                //                 size: 18,
                //                 color: Colors.black,
                //               ),
                //             )),    Container(
                //             color: theme.backgroundColor,
                //             height: screenHeight * 0.06,
                //             // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                //             child: ListTile(
                //               title: InkWell(
                //                 onTap: () {
                //                   Navigator.of(context,rootNavigator: true)
                //                       .push(MaterialPageRoute(builder: (context) {
                //                     return disableAccount();
                //                   }));
                //                 },
                //                 child: Text("Freeze Account",
                //                     style: TextStyle(
                //                         fontWeight: FontWeight.w500,
                //                         fontSize: 15 * textScale)),
                //               ),
                //               trailing: const Icon(
                //                 Icons.keyboard_arrow_right,
                //                 size: 18,
                //                 color: Colors.black,
                //               ),
                //             )),
                //         Container(
                //             color: theme.backgroundColor,
                //             height: screenHeight * 0.06,
                //             // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                //             child: ListTile(
                //               title: InkWell(
                //                 onTap: () {
                //                   Navigator.of(context,rootNavigator: true)
                //                       .push(MaterialPageRoute(builder: (context) {
                //                     return disableAccount();
                //                   }));
                //                 },
                //                 child: Text("Disable Account",
                //                     style: TextStyle(
                //                         fontWeight: FontWeight.w500,
                //                         fontSize: 15 * textScale)),
                //               ),
                //               trailing: const Icon(
                //                 Icons.keyboard_arrow_right,
                //                 size: 18,
                //                 color: Colors.black,
                //               ),
                //             )),
                //         Container(
                //             color: theme.backgroundColor,
                //             height: screenHeight * 0.06,
                //             // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                //             child: ListTile(
                //               title: InkWell(
                //                 onTap: () {
                //                   Navigator.of(context,rootNavigator: true)
                //                       .push(MaterialPageRoute(builder: (context) {
                //                     return deleteAccount();
                //                   }));
                //                 },
                //                 child: Text("Delete Account",
                //                     style: TextStyle(
                //                         fontWeight: FontWeight.w500,
                //                         fontSize: 15 * textScale)),
                //               ),
                //               trailing: const Icon(
                //                 Icons.keyboard_arrow_right,
                //                 size: 18,
                //                 color: Colors.black,
                //               ),
                //             )),

                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return Messages();
                          }));
                        },
                        child: Text("Notifications",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
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
                        onTap: () {},
                        child: Text("Currency Display",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
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
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return About();
                          }));
                        },
                        child: Text("About",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
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
                          // Navigator.of(context,rootNavigator: true)
                          //     .push(MaterialPageRoute(builder: (context) {
                          //   return Help();
                          // }));
                        },
                        child: Text(" Clear Cache",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
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
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return Modals();
                          }));
                        },
                        child: Text("modals",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
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

class _SettingsMobile extends StatefulWidget {
  @override
  _SettingsMobileState createState() => _SettingsMobileState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class _SettingsMobileState extends State<_SettingsMobile> {
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
        title: Text('Settings',
            style: TextStyle(fontSize: 15 * textScale, color: Colors.black87)),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: screenHeight * 1.90,
            color: theme.backgroundColor,
            child: Column(
              children: <Widget>[
                //  (state is AuthAuthenticatedState)
                // ?
//                 Container(
//                     color: theme.backgroundColor,
//                     height: screenHeight * 0.06,
//                     // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
//                     child: ListTile(
//                       title: InkWell(
//                         onTap: () {
//                           Navigator.of(context, rootNavigator: true)
//                               .push(MaterialPageRoute(builder: (context) {
//                             return AccProfile();
//                           }));
//                         },
//                         child: Text("Profile",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 15 * textScale)),
//                       ),
//                       trailing: const Icon(
//                         Icons.keyboard_arrow_right,
//                         size: 18,
//                         color: Colors.black,
//                       ),
//                     )),
// :
//  Container(),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(builder: (context) {
                              return Language();
                            }));
                          },
                          child: Row(
                            children: [
                              Text("Language ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15 * textScale)),
                            ],
                          )),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                //  (state is AuthAuthenticatedState)
                // ?
                // Container(
                //     color: theme.backgroundColor,
                //     height: screenHeight * 0.06,
                //     // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                //     child: ListTile(
                //       title: InkWell(
                //         onTap: () {
                //           Navigator.of(context, rootNavigator: true)
                //               .push(MaterialPageRoute(builder: (context) {
                //             return Messages();
                //           }));
                //         },
                //         child: Text("Notifications",
                //             style: TextStyle(
                //               fontWeight: FontWeight.w500,
                //               fontSize: 15 * textScale,
                //             )),
                //       ),
                //       trailing: const Icon(
                //         Icons.keyboard_arrow_right,
                //         size: 18,
                //         color: Colors.black,
                //       ),
                //     )),

                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                        onTap: () {},
                        child: Text("Currency Display",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
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
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return About();
                          }));
                        },
                        child: Text("About",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15 * textScale,
                            )),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                        color: Colors.black,
                      ),
                    )),
                //  (state is AuthAuthenticatedState)
                // ?
                // Container(
                //     color: theme.backgroundColor,
                //     height: screenHeight * 0.06,
                //     // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                //     child: ListTile(
                //       title: InkWell(
                //         onTap: () {
                //           // Navigator.of(context,rootNavigator: true)
                //           //     .push(MaterialPageRoute(builder: (context) {
                //           //   return Help();
                //           // }));
                //         },
                //         child: Text(" Clear Cache",
                //             style: TextStyle(
                //               fontWeight: FontWeight.w500,
                //               fontSize: 15 * textScale,
                //             )),
                //       ),
                //       trailing: const Icon(
                //         Icons.keyboard_arrow_right,
                //         size: 18,
                //         color: Colors.black,
                //       ),
                //     )),
              ],
            )),
      ),
    );
  }

  fetchSession() {}
}
