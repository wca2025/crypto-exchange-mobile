// import 'package:cx/Widgets/Contactusdetail.dart';
import 'package:flutter/services.dart';
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
import 'package:flutter/cupertino.dart';

class Contactus extends StatefulWidget {
  @override
  ContactusState createState() => ContactusState();
}

class ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: ContactusMobile(),
          tablet: ContactusTablet(),
        ),
      ),
    );
  }
}

class ContactusTablet extends StatefulWidget {
  @override
  ContactusTabletState createState() => ContactusTabletState();
}

class ContactusTabletState extends State<ContactusTablet> {
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
                      title: const Text('Contactus'),
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
                                //   return ContactusDetail();
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
                                //   return ContactusDetail();
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
          backgroundColor: theme.primaryColor,
          automaticallyImplyLeading: false,
          title: const Text(' messages'),
        ),
        body: ListView(
          // padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: screenHeight * 0.060,
              // color: Colors.blueGrey,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context,rootNavigator: true)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return CreateProfile();
                  // }));
                },
                child: Row(
                  children: [
                    Container(
                        height: screenHeight * 0.060,
                        // color: Colors.grey,
                        child: InkWell(
                            onTap: () {
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return ContactusDetail();
                              // }));
                            },
                            child: Row(
                              children: [
                                Container(
                                    child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(CupertinoIcons.square_split_1x2),
                                )),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Contactus"),
                                          SizedBox(
                                            width: screenWidth * 0.50,
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "ghdfsj",
                                            style: TextStyle(fontSize: 10.0),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.60,
                                            height: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )))
                  ],
                ),
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
                  // Navigator.of(context,rootNavigator: true)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return ContactusDetail();
                  // }));
                },
                child: Row(
                  children: [
                    Container(
                        height: screenHeight * 0.060,
                        // color: Colors.grey,
                        child: InkWell(
                            onTap: () {
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return ContactusDetail();
                              // }));
                            },
                            child: Row(
                              children: [
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(CupertinoIcons.square_split_1x2),
                                )),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("login notices"),
                                          SizedBox(
                                            width: screenWidth * 0.50,
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "ghdfsj",
                                            style: TextStyle(fontSize: 10.0),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.60,
                                            height: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )))
                  ],
                ),
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
                  // Navigator.of(context,rootNavigator: true)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return ContactusDetail();
                  // }));
                },
                child: Row(
                  children: [
                    Container(
                        height: screenHeight * 0.060,
                        // color: Colors.grey,
                        child: InkWell(
                            onTap: () {
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return ContactusDetail();
                              // }));
                            },
                            child: Row(
                              children: [
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(CupertinoIcons.square_split_1x2),
                                )),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "market alert",
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.50,
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "ghdfsj",
                                            style: TextStyle(fontSize: 10.0),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.60,
                                            height: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )))
                  ],
                ),
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
                  // Navigator.of(context,rootNavigator: true)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return ContactusDetail();
                  // }));
                },
                child: Row(
                  children: [
                    Container(
                        height: screenHeight * 0.060,
                        // color: Colors.grey,
                        child: InkWell(
                            onTap: () {
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return ContactusDetail();
                              // }));
                            },
                            child: Row(
                              children: [
                                Container(
                                    child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(CupertinoIcons.square_split_1x2),
                                )),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "assets alert",
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.50,
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "ghdfsj",
                                            style: TextStyle(fontSize: 10.0),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.60,
                                            height: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )))
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.blueGrey[100],
              height: 2,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
          ],
        ));
  }

  fetchSession() {}
}

class ContactusMobile extends StatefulWidget {
  @override
  ContactusMobileState createState() => ContactusMobileState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class ContactusMobileState extends State<ContactusMobile> {
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
                      title: const Text('Contactus'),
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
                                //   return ContactusDetail();
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
                                //   return ContactusDetail();
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
          backgroundColor: theme.primaryColor,
          automaticallyImplyLeading: false,
          title: const Text(' messages'),
        ),
        body: ListView(
          // padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: screenHeight * 0.060,
              // color: Colors.blueGrey,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context,rootNavigator: true)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return CreateProfile();
                  // }));
                },
                child: Row(
                  children: [
                    Container(
                        height: screenHeight * 0.060,
                        // color: Colors.grey,
                        child: InkWell(
                            onTap: () {
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return ContactusDetail();
                              // }));
                            },
                            child: Row(
                              children: [
                                Container(
                                    child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(CupertinoIcons.square_split_1x2),
                                )),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Contactus"),
                                          SizedBox(
                                            width: screenWidth * 0.50,
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "ghdfsj",
                                            style: TextStyle(fontSize: 10.0),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.60,
                                            height: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )))
                  ],
                ),
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
                  // Navigator.of(context,rootNavigator: true)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return ContactusDetail();
                  // }));
                },
                child: Row(
                  children: [
                    Container(
                        height: screenHeight * 0.060,
                        // color: Colors.grey,
                        child: InkWell(
                            onTap: () {
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return ContactusDetail();
                              // }));
                            },
                            child: Row(
                              children: [
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(CupertinoIcons.square_split_1x2),
                                )),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("login notices"),
                                          SizedBox(
                                            width: screenWidth * 0.50,
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "ghdfsj",
                                            style: TextStyle(fontSize: 10.0),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.60,
                                            height: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )))
                  ],
                ),
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
                  // Navigator.of(context,rootNavigator: true)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return ContactusDetail();
                  // }));
                },
                child: Row(
                  children: [
                    Container(
                        height: screenHeight * 0.060,
                        // color: Colors.grey,
                        child: InkWell(
                            onTap: () {
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return ContactusDetail();
                              // }));
                            },
                            child: Row(
                              children: [
                                Container(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(CupertinoIcons.square_split_1x2),
                                )),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "market alert",
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.50,
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "ghdfsj",
                                            style: TextStyle(fontSize: 10.0),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.60,
                                            height: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )))
                  ],
                ),
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
                  // Navigator.of(context,rootNavigator: true)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return ContactusDetail();
                  // }));
                },
                child: Row(
                  children: [
                    Container(
                        height: screenHeight * 0.060,
                        // color: Colors.grey,
                        child: InkWell(
                            onTap: () {
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return ContactusDetail();
                              // }));
                            },
                            child: Row(
                              children: [
                                Container(
                                    child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(CupertinoIcons.square_split_1x2),
                                )),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "assets alert",
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.50,
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "ghdfsj",
                                            style: TextStyle(fontSize: 10.0),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.60,
                                            height: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )))
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.blueGrey[100],
              height: 2,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
          ],
        ));
  }

  fetchSession() {}
}
