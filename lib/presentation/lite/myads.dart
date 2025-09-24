import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/p2p/p2p_bloc.dart';
import 'addaddress.dart';
import 'editad.dart';
import 'postad.dart';
import 'verificationbusiness.dart';
import 'package:flutter/services.dart';

import 'editaddress.dart';
// /import 'sign_in.dart';
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

import 'travel_bean.dart';

class MyAds extends StatefulWidget {
  @override
  MyAdsState createState() => MyAdsState();
}

class MyAdsState extends State<MyAds> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: MyAdsMobile(),
          tablet: MyAdsTablet(),
        ),
      ),
    );
  }
}

class MyAdsTablet extends StatefulWidget {
  @override
  MyAdsTabletState createState() => MyAdsTabletState();
}

class MyAdsTabletState extends State<MyAdsTablet> {
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
                      title: const Text('MyAds'),
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

    final ScrollController _controller = ScrollController();

    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
            elevation: 0.5,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            title: const Text('MyAds',
                style: TextStyle(fontSize: 14, color: Colors.black87)),
            actions: [
              Container(
                width: screenWidth * 0.50,
                height: screenHeight * 0.35,
                // color: Colors.grey[400],
                child: Row(
                  children: [
                    Expanded(child: Container(width: screenWidth * 0.025)),
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      iconSize: 18,
                      icon: Icon(
                        Icons.add_box_sharp,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return PostAd();
                        }));
                      },
                    ),
                  ],
                ),
              )
            ]),
        body: ListView.builder(
            controller: _controller,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.vertical,
            itemCount: 8,
            padding: const EdgeInsets.all(0.0),
            itemBuilder: (context, index) {
              var _list;
              var bean = _list[index];

              return Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: screenWidth * 0.95,
                  color: theme.backgroundColor,
                  height: screenHeight * 0.32,
                  //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),

                  child: Card(
                    color: theme.backgroundColor,
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Row(children: [
                            Text('Info'),
                          ]),
                          trailing: PopupMenuButton<int>(
                            color: theme.scaffoldBackgroundColor,
                            itemBuilder: (context) => [
                              PopupMenuItem<int>(
                                value: 0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) {
                                      return EditAd();
                                    }));
                                  },
                                  child: Text("Change"),
                                ),
                              ),
                              PopupMenuItem<int>(
                                  value: 1,
                                  child: InkWell(
                                      onTap: () {
                                        // Navigator.of(context,rootNavigator: true)
                                        //     .push(MaterialPageRoute(builder: (context) {
                                        //   return help2();
                                        // }));
                                      },
                                      child: Text("view"))),
                            ],
                            onSelected: (item) => SelectedItem(context, item),
                          ),
                        ),
                        Divider(
                          color: Colors.blueGrey[100],
                          height: 2,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "User:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: theme.hoverColor,
                                  ),
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
                                    top: 5, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "Price:",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: theme.hoverColor,
                                  ),
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
                                    top: 5, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "Quantity ",
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
                                    top: 5, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "Transaction Limits ",
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
                                    top: 5, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "Payment Method:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: theme.hoverColor,
                                  ),
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
                                    top: 5, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "Momo ",
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
                                    top: 5, bottom: 1, left: 12, right: 12),
                                child: Text(
                                  "Bank Transfer ",
                                  style: TextStyle(
                                      fontSize: 12, color: theme.hoverColor),
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.65)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}

class MyAdsMobile extends StatefulWidget {
  @override
  MyAdsMobileState createState() => MyAdsMobileState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class MyAdsMobileState extends State<MyAdsMobile> {
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
                          const Padding(padding: EdgeInsets.only(left: 3.0)),
                          Text('Verification',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                          Expanded(child: Container(width: screenWidth * 0.05)),
                          Container(
                            height: screenHeight * 0.020,
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.close_rounded, size: 22),
                            ),
                          ),
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
                      onTap: () {},
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
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Center(
                                    child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Color(0xFFf5f7fa),
                                  )),
                                  onPressed: () {
                                    Navigator.pop(context);
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
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
            elevation: 0.5,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            title: const Text('MyAds',
                style: TextStyle(fontSize: 14, color: Colors.black87)),
            actions: [
              Container(
                width: screenWidth * 0.50,
                height: screenHeight * 0.35,
                // color: Colors.grey[400],
                child: Row(
                  children: [
                    Expanded(child: Container(width: screenWidth * 0.025)),
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      iconSize: 18,
                      icon: Icon(
                        Icons.add_box_sharp,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                        _showSimpleModalDialog13(context);
                      },
                    ),
                  ],
                ),
              )
            ]),
        body:
        //  BlocConsumer<P2pBloc, P2pState>(
        //   listener: (context, state) {
        //     // TODO: implement listener
        //   },
        //   builder: (context, state) {
        //     return 
            ListView.builder(
                controller: _controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.vertical,
                // itemCount: state.p2ps.length,
                padding: const EdgeInsets.all(0.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child:
                    
                   
                    
                                  Container(
                                      color: theme.backgroundColor,
                                      height: screenHeight * 0.40,
                                      width: screenWidth * 0.900,

                                      // color: Colors.grey,
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.of(context,rootNavigator: true)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   return help2();
                                          // }));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                         
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 4.0,
                                                  horizontal: 4),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.35,
                                                //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),

                                                child: Card(
                                                  color: theme
                                                      .scaffoldBackgroundColor,
                                                  elevation: 0,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      ListTile(
                                                        title: Row(children: [
                                                          Text(
                                                              'Info',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        ]),
                                                      ),
                                                      Divider(
                                                        color: Colors
                                                            .blueGrey[100],
                                                        height: 2,
                                                        thickness: 1,
                                                        indent: 0,
                                                        endIndent: 0,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "User ",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "Price:",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),              Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "Quantity:",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),
                                                     Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "Transaction Limits:",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),
                                                                 Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "Payment Method:",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),

                                                                    Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "Momo:",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),

                                                                                           Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "Bank Transfer :",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                          ],
                                        ),
                                      )) 
         
             
               
                  );
              
          },
        ));
  }

  fetchSession() {}
}
