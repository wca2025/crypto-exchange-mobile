import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/addresss/addresss_bloc.dart';

import '../../data/extra/extra.dart';
import 'add_address.dart';
import 'editaddress.dart';
import 'package:flutter/services.dart';
// import 'sign_in.dart';
// import 'travel_bean.dart';
// import 'download2.dart';
// import 'downloads.dart';
//
import '../widgets/responsive.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
// import 'stream.dart';
import 'package:share/share.dart';

class AddressList extends StatefulWidget {
  @override
  AddressListState createState() => AddressListState();
}

class AddressListState extends State<AddressList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: AddressListMobile(),
          tablet: AddressListTablet(),
        ),
      ),
    );
  }
}

class AddressListTablet extends StatefulWidget {
  @override
  AddressListTabletState createState() => AddressListTabletState();
}

class AddressListTabletState extends State<AddressListTablet> {
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    _showSimpleModalDialog(context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              child: Container(
                constraints: const BoxConstraints(maxHeight: 350),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: const Text('Security Verification'),
                        leading: Radio(
                          value: BestTutorSite.javatpoint,
                          groupValue: _site,
                          onChanged: (value) {},
                        ),
                        trailing: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close_rounded, size: 30),
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
                        title: Text("To protoect your funds please"),
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

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            title: Text(' Addresses',
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            actions: [
              Container(
                width: screenWidth * 0.50,
                height: screenHeight * 0.35,
                // color: Colors.grey[400],
                child: Row(
                  children: [
                    Expanded(child: Container(width: screenWidth * 0.99)),
                    IconButton(
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 18,
                      icon: const Icon(Icons.add_box_sharp,
                          color: Colors.black87),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return AddAddress();
                        }));
                      },
                    ),
                  ],
                ),
              )
            ]),
        body: Scaffold(
            backgroundColor: theme.backgroundColor,
            body: SingleChildScrollView(
                child: Container(
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
                                  _showSimpleModalDialog(context);
                                  // Navigator.of(context,rootNavigator: true)
                                  //     .push(MaterialPageRoute(builder: (context) {
                                  //   return Security();
                                  // }));
                                },
                                child: Text("Lorem ipsum",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    )),
                              ),
                              trailing: IconButton(
                                padding: const EdgeInsets.all(0.0),
                                iconSize: 18,
                                icon: const Icon(Icons.draw_rounded),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return EditAddress();
                                  }));
                                },
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
                                  //   return Settings();
                                  // }));
                                },
                                child: Text("Lorem ipsum",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    )),
                              ),
                              trailing: IconButton(
                                padding: const EdgeInsets.all(0.0),
                                iconSize: 18,
                                icon: const Icon(Icons.draw_rounded),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return EditAddress();
                                  }));
                                },
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
                                child: Text("Lorem ipsum",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    )),
                              ),
                              trailing: IconButton(
                                padding: const EdgeInsets.all(0.0),
                                iconSize: 18,
                                icon: const Icon(Icons.draw_rounded),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return EditAddress();
                                  }));
                                },
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
                                  //   return About(
                                  //     passedColor: Colors.pink,
                                  //     passedColorName: 'Pink',
                                  //   );
                                  // }));
                                },
                                child: Text("Lorem ipsum",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    )),
                              ),
                              trailing: IconButton(
                                padding: const EdgeInsets.all(0.0),
                                iconSize: 18,
                                icon: const Icon(Icons.draw_rounded),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return EditAddress();
                                  }));
                                },
                              ),
                            )),
                        Container(
                          color: theme.backgroundColor,
                          height: screenHeight * 0.06,
                          // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: ListTile(
                            title: Text("Lorem ipsum",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                )),
                            trailing: IconButton(
                              padding: const EdgeInsets.all(0.0),
                              iconSize: 18,
                              icon: const Icon(Icons.draw_rounded),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return EditAddress();
                                }));
                              },
                            ),
                          ),
                        ),
                        Container(
                            color: theme.backgroundColor,
                            height: screenHeight * 0.06,
                            // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: ListTile(
                              title: Text("Lorem ipsum",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  )),
                              trailing: IconButton(
                                padding: const EdgeInsets.all(0.0),
                                iconSize: 18,
                                icon: const Icon(Icons.draw_rounded),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return EditAddress();
                                  }));
                                },
                              ),
                            )),
                      ],
                    )))));
  }

  fetchSession() {}
}

class AddressListMobile extends StatefulWidget {
  @override
  AddressListMobileState createState() => AddressListMobileState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class AddressListMobileState extends State<AddressListMobile> {
  BestTutorSite _site = BestTutorSite.javatpoint;
  bool isSwitched = false;

  String authState = "User not signed in";
  String hubEvent = "";
  String error = "";
  List<String> exceptions = [];
  var addresses;
  @override
  void initState() {
    super.initState();

    addresses = addressesdata;

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

  final controller = TextEditingController();

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    _showSimpleModalDialog(context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              child: Container(
                constraints: const BoxConstraints(maxHeight: 350),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: const Text('Security Verification'),
                        leading: Radio(
                          value: BestTutorSite.javatpoint,
                          groupValue: _site,
                          onChanged: (value) {},
                        ),
                        trailing: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close_rounded, size: 30),
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
                        title: Text("To protoect your funds please"),
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

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            title: Text(' Addresses',
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            actions: [
              Container(
                width: screenWidth * 0.50,
                height: screenHeight * 0.35,
                // color: Colors.grey[400],
                child: Row(
                  children: [
                    Expanded(child: Container(width: screenWidth * 0.99)),
                    IconButton(
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 18,
                      icon: const Icon(Icons.add_box_sharp,
                          color: Colors.black87),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return AddAddress();
                        }));
                      },
                    ),
                  ],
                ),
              )
            ]),
        body:
             BlocConsumer<AddresssBloc, AddresssState>(
              listener: (context, state) {
                
              // TODO: implement listener
            //        if (state is _SuccessAddresssState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' succeess ', textScaleFactor: 1.5),
            //     )),
            //   );
            // } else if (state is _ErrorAddresssState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' error ', textScaleFactor: 1.5),
            //     )),
            //   );
            // }
            },
            builder: (context, state) {
            return
            Scaffold(
                backgroundColor: theme.backgroundColor,
                body: SingleChildScrollView(
                    child: ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        itemCount: addresses.length,
                        padding: const EdgeInsets.all(1.0),
                        itemBuilder: (context, index) {
                          var address = addresses[index];
                          return Container(
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
                                            _showSimpleModalDialog(context);
                                            // Navigator.of(context,rootNavigator: true)
                                            //     .push(MaterialPageRoute(builder: (context) {
                                            //   return Security();
                                            // }));
                                          },
                                          child: Text("Lorem ipsum",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                              )),
                                        ),
                                        trailing: IconButton(
                                          padding: const EdgeInsets.all(0.0),
                                          iconSize: 18,
                                          icon: const Icon(Icons.draw_rounded),
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              return EditAddress();
                                            }));
                                          },
                                        ),
                                      )),
                                ],
                              ));
                        })));
          },
        )
        );
  }

  fetchSession() {}
}
