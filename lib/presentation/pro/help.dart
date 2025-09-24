import 'faq.dart';
import 'privacy.dart';
import 'terms.dart';
import 'version.dart';

import 'Chat.dart';
import 'collection.dart';
import 'followus.dart';

import '../widgets/responsive.dart';
import 'package:flutter/material.dart';

import 'package:back_button_interceptor/back_button_interceptor.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HelpMobile(),
          tablet: _HelpTablet(),
        ),
      ),
    );
  }
}

class _HelpTablet extends StatefulWidget {
  @override
  __HelpTabletState createState() => __HelpTabletState();
}

class __HelpTabletState extends State<_HelpTablet> {
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    // BackButtonInterceptor.remove(myInterceptor);
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
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,

      resizeToAvoidBottomInset: false, //new line
      appBar: AppBar(
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: const Text('Help & Support',
            style: TextStyle(color: Colors.black87)),
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
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Chat();
                        }));
                      },
                      child: Text("Chat",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
                          return Faq();
                        }));
                      },
                      child: Text("FAQ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
                          return FollowUs();
                        }));
                      },
                      child: Text(" Follow Us",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
                          return Terms();
                        }));
                      },
                      child: Text(" Terms Of Use",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
                          return Privacy();
                        }));
                      },
                      child: Text("Privacy Policy",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
                          return Version();
                        }));
                      },
                      child: Text("Version",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
    );
  }
}

class _HelpMobile extends StatefulWidget {
  @override
  _HelpMobileState createState() => _HelpMobileState();
}

class _HelpMobileState extends State<_HelpMobile> {
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    // BackButtonInterceptor.remove(myInterceptor);
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
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,

      resizeToAvoidBottomInset: false, //new line
      appBar: AppBar(
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: const Text('Help & Support',
            style: TextStyle(color: Colors.black87)),
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
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Chat();
                        }));
                      },
                      child: Text("Chat",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
                          return Faq();
                        }));
                      },
                      child: Text("FAQ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
                          return FollowUs();
                        }));
                      },
                      child: Text(" Follow Us",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
                          return Terms();
                        }));
                      },
                      child: Text(" Terms Of Use",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
                          return Privacy();
                        }));
                      },
                      child: Text("Privacy Policy",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
                          return Version();
                        }));
                      },
                      child: Text("Version",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
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
    );
  }
}
