import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import 'confirmorder.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

class Usercenter extends StatefulWidget {
  Usercenter();

  @override
  _UsercenterState createState() => _UsercenterState();
}

class _UsercenterState extends State<Usercenter> {
  // Function showResult;

  // Function setError;

  // Function changeDisplay;

  // Function _signOut;

  // Function _showCreateUser;

  // Function _getCurrentUser;

  // Function _fetchSession;

  // Function _backToSignIn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _UsercenterMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _UsercenterTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _UsercenterTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _UsercenterTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __UsercenterTabletState createState() => __UsercenterTabletState();
}

class __UsercenterTabletState extends State<_UsercenterTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  static const genderOptions = ['1', '2', '3'];
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  @override
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Padding(
        padding: EdgeInsets.only(right: 270),
        child: Text(
          item,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
      ));

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
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
          toolbarHeight: screenHeight * 0.15,
          elevation: 0.2,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              // color: theme.backgroundColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 0.0, top: 30.0, right: screenWidth * 0.0),
                    child: Icon(
                      Icons.person_pin,
                      color: Colors.black,
                      size: 45.0,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0.0, top: 35.0, right: screenWidth * 2.7),
                            child: Text(
                              " Username",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0 * textScale,
                                  color: Colors.black),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0.0,
                                  top: 15.0,
                                  right: screenWidth * 2.5),
                              child: Text(
                                "Email ,SMS ,Identity Verification",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0 * textScale,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  // InkWell(
                  //   child: Text(
                  //     "unverified",
                  //     style: TextStyle(
                  //         fontSize: 12 * textScale,
                  //         color: theme.backgroundColor),
                  //   ),
                  //   onTap: () {
                  //     Navigator.of(context,rootNavigator: true)
                  //         .push(MaterialPageRoute(builder: (context) {
                  //       // return DetailPage(bean);
                  //       return VerificationPersonal();
                  //     }));
                  //   },
                  // ),
                ],
              ),
            )
          ],
          backgroundColor: theme.scaffoldBackgroundColor,
        ),
        body: DefaultTabController(
            length: 4,
            child: Container(
                color: theme.scaffoldBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      color: theme.scaffoldBackgroundColor,

                      // child: const Align(
                      //   alignment: Alignment.centerRight,
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: TabBar(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.grey),
                                indicatorColor: Colors.white,
                                labelColor: Colors.black87,
                                automaticIndicatorColorAdjustment: true,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                isScrollable: true,
                                unselectedLabelColor: Colors.grey,
                                tabs: <Widget>[
                                  Tab(
                                    child: Text('Info',
                                        style: TextStyle(
                                            fontSize: 12 * textScale)),
                                  ),
                                  Tab(
                                    child: Text('Ads',
                                        style: TextStyle(
                                            fontSize: 12 * textScale)),
                                  ),
                                  Tab(
                                    child: Text('Following',
                                        style: TextStyle(
                                            fontSize: 12 * textScale)),
                                  ),
                                  Tab(
                                    child: Text('Blocked',
                                        style: TextStyle(
                                            fontSize: 12 * textScale)),
                                  ),
                                ],
                              )),
                            ]),
                      ),
                      // ),
                    ),
                    Expanded(
                        child: Container(
                            child: TabBarView(
                      children: [
                        ListView(
                          // controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          children: <Widget>[
                            Container(
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Container(
                                    color: theme.backgroundColor,
                                    height: screenHeight * 1.4,
                                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                                    child: ListView(
                                      controller: _controller,
                                      physics: const BouncingScrollPhysics(
                                          parent:
                                              AlwaysScrollableScrollPhysics()),
                                      // padding: const EdgeInsets.all(8),
                                      children: <Widget>[
                                        Container(
                                          height: screenHeight * 0.050,
                                          // color: Colors.blueGrey,
                                          child: InkWell(
                                            onTap: () {
                                              // Navigator.of(context,rootNavigator: true)
                                              //     .push(MaterialPageRoute(builder: (context) {
                                              //   return Security();
                                              // }));
                                            },
                                            child: ListTile(
                                              title: Row(
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                    left: 5,
                                                  )),
                                                  Text(
                                                    "No. of Orders within 30 days",
                                                    style: TextStyle(
                                                        color: theme.hoverColor,
                                                        fontSize:
                                                            12 * textScale),
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.08)),
                                                  Text(
                                                    "65",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            12 * textScale),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 5,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: screenHeight * 0.050,
                                          // color: Colors.blueGrey,
                                          child: InkWell(
                                            onTap: () {
                                              // Navigator.of(context,rootNavigator: true)
                                              //     .push(MaterialPageRoute(builder: (context) {
                                              //   return Security();
                                              // }));
                                            },
                                            child: ListTile(
                                              title: Row(
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                    left: 5,
                                                  )),
                                                  Text(
                                                    "Completion Rate within 30 days",
                                                    style: TextStyle(
                                                        color: theme.hoverColor,
                                                        fontSize:
                                                            12 * textScale),
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.08)),
                                                  Text(
                                                    "23",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            12 * textScale),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 5,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Divider(
                                        //   color: Colors.blueGrey[100],
                                        //   height: 2,
                                        //   thickness: 1,
                                        //   indent: 0,
                                        //   endIndent: 0,
                                        // ),
                                        Container(
                                          height: screenHeight * 0.050,
                                          // color: Colors.blueGrey,
                                          child: InkWell(
                                            onTap: () {
                                              // Navigator.of(context,rootNavigator: true)
                                              //     .push(MaterialPageRoute(builder: (context) {
                                              //   return Security();
                                              // }));
                                            },
                                            child: ListTile(
                                              title: Row(
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                    left: 5,
                                                  )),
                                                  Text(
                                                    "Total No of Orders",
                                                    style: TextStyle(
                                                        color: theme.hoverColor,
                                                        fontSize:
                                                            12 * textScale),
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.08)),
                                                  Text(
                                                    "43",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            12 * textScale),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 5,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Divider(
                                        //   color: Colors.blueGrey[100],
                                        //   height: 2,
                                        //   thickness: 1,
                                        //   indent: 0,
                                        //   endIndent: 0,
                                        // ),
                                        SizedBox(
                                          height: screenHeight * 0.030,
                                        ),

                                        Divider(
                                          color: Colors.blueGrey[100],
                                          height: 2,
                                          thickness: 1,
                                          indent: 0,
                                          endIndent: 0,
                                        ),

                                        SizedBox(
                                          height: screenHeight * 0.035,
                                        ),

                                        // Expanded(child: Container(height: screenHeight*0.40,)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Container(
                            //   height: screenHeight * 0.60,
                            //   child: Row(
                            //     children: [

                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        ListView.builder(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: 8,
                            padding: const EdgeInsets.all(0.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];

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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        ListTile(
                                            title: Row(children: [
                                          Text('Info'),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 237.0, bottom: 300)),
                                        ])),
                                        Divider(
                                          color: Colors.blueGrey[100],
                                          height: 2,
                                          thickness: 1,
                                          indent: 0,
                                          endIndent: 0,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "User:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: theme.hoverColor,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Price:",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: theme.hoverColor,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Quantity ",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: theme.hoverColor),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Transaction Limits ",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: theme.hoverColor),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Payment Method:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: theme.hoverColor,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Momo ",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: theme.hoverColor),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Bank Transfer ",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: theme.hoverColor),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                        ListView(
                          // controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          children: <Widget>[
                            Container(
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Container(
                                    color: theme.backgroundColor,
                                    height: screenHeight * 0.30,
                                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                                    child: Card(
                                      color: theme.backgroundColor,
                                      elevation: 0,
                                      child: ListView(
                                        controller: _controller,
                                        // physics: const BouncingScrollPhysics(
                                        //     parent: AlwaysScrollableScrollPhysics()),
                                        // padding: const EdgeInsets.all(8),
                                        children: <Widget>[
                                          Container(
                                            // color: theme.backgroundColor,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15.0,
                                                      top: 3.0,
                                                      right: 100),
                                                  child: InkWell(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 0.0,
                                                                    top: 5.0,
                                                                    right: 120),
                                                            child: Text(
                                                              " Username",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 15.0 *
                                                                      textScale,
                                                                  color: Colors
                                                                      .black38),
                                                            ),
                                                          ),
                                                        ]),
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 0.0,
                                                                      top: 5.0,
                                                                      right:
                                                                          10),
                                                              child: Text(
                                                                "Email ,SMS ,Identity Verification",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize: 12.0 *
                                                                        textScale,
                                                                    color: Colors
                                                                        .black38),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      // Navigator.of(context,rootNavigator: true)
                                                      //     .push(MaterialPageRoute(builder: (context) {
                                                      //   // return DetailPage(bean);
                                                      //   return SignIn();
                                                      // }));
                                                    },
                                                  ),
                                                ),

                                                // InkWell(
                                                //   child: Text(
                                                //     "unverified",
                                                //     style: TextStyle(
                                                //         fontSize: 12 * textScale,
                                                //         color: theme.backgroundColor),
                                                //   ),
                                                //   onTap: () {
                                                //     Navigator.of(context,rootNavigator: true)
                                                //         .push(MaterialPageRoute(builder: (context) {
                                                //       // return DetailPage(bean);
                                                //       return VerificationPersonal();
                                                //     }));
                                                //   },
                                                // ),
                                              ],
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
                                            height: screenHeight * 0.050,
                                            // color: Colors.blueGrey,
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.of(context,rootNavigator: true)
                                                //     .push(MaterialPageRoute(builder: (context) {
                                                //   return Security();
                                                // }));
                                              },
                                              child: ListTile(
                                                title: Row(
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                      left: 5,
                                                    )),
                                                    Text(
                                                      "No. of Orders within 30 days",
                                                      style: TextStyle(
                                                          color:
                                                              theme.hoverColor,
                                                          fontSize:
                                                              12 * textScale),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.08)),
                                                    Text(
                                                      "65",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              12 * textScale),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: screenHeight * 0.050,
                                            // color: Colors.blueGrey,
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.of(context,rootNavigator: true)
                                                //     .push(MaterialPageRoute(builder: (context) {
                                                //   return Security();
                                                // }));
                                              },
                                              child: ListTile(
                                                title: Row(
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                      left: 5,
                                                    )),
                                                    Text(
                                                      "Completion Rate within 30 days",
                                                      style: TextStyle(
                                                          color:
                                                              theme.hoverColor,
                                                          fontSize:
                                                              12 * textScale),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.08)),
                                                    Text(
                                                      "23",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              12 * textScale),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Divider(
                                          //   color: Colors.blueGrey[100],
                                          //   height: 2,
                                          //   thickness: 1,
                                          //   indent: 0,
                                          //   endIndent: 0,
                                          // ),
                                          Container(
                                            height: screenHeight * 0.050,
                                            // color: Colors.blueGrey,
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.of(context,rootNavigator: true)
                                                //     .push(MaterialPageRoute(builder: (context) {
                                                //   return Security();
                                                // }));
                                              },
                                              child: ListTile(
                                                title: Row(
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                      left: 5,
                                                    )),
                                                    Text(
                                                      "Total No of Orders",
                                                      style: TextStyle(
                                                          color:
                                                              theme.hoverColor,
                                                          fontSize:
                                                              12 * textScale),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.08)),
                                                    Text(
                                                      "43",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              12 * textScale),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Divider(
                                          //   color: Colors.blueGrey[100],
                                          //   height: 2,
                                          //   thickness: 1,
                                          //   indent: 0,
                                          //   endIndent: 0,
                                          // ),

                                          // Expanded(child: Container(height: screenHeight*0.40,)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Container(
                            //   height: screenHeight * 0.60,
                            //   child: Row(
                            //     children: [

                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        ListView(
                          // controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          children: <Widget>[
                            Container(
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Container(
                                    color: theme.backgroundColor,
                                    height: screenHeight * 0.30,
                                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                                    child: Card(
                                      color: theme.backgroundColor,
                                      elevation: 0,
                                      child: ListView(
                                        controller: _controller,
                                        // physics: const BouncingScrollPhysics(
                                        //     parent: AlwaysScrollableScrollPhysics()),
                                        // padding: const EdgeInsets.all(8),
                                        children: <Widget>[
                                          Container(
                                            // color: theme.backgroundColor,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15.0,
                                                      top: 3.0,
                                                      right: 100),
                                                  child: InkWell(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 0.0,
                                                                    top: 5.0,
                                                                    right: 120),
                                                            child: Text(
                                                              " Username",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 15.0 *
                                                                      textScale,
                                                                  color: Colors
                                                                      .black38),
                                                            ),
                                                          ),
                                                        ]),
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 0.0,
                                                                      top: 5.0,
                                                                      right:
                                                                          10),
                                                              child: Text(
                                                                "Email ,SMS ,Identity Verification",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize: 12.0 *
                                                                        textScale,
                                                                    color: Colors
                                                                        .black38),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      // Navigator.of(context,rootNavigator: true)
                                                      //     .push(MaterialPageRoute(builder: (context) {
                                                      //   // return DetailPage(bean);
                                                      //   return SignIn();
                                                      // }));
                                                    },
                                                  ),
                                                ),

                                                // InkWell(
                                                //   child: Text(
                                                //     "unverified",
                                                //     style: TextStyle(
                                                //         fontSize: 12 * textScale,
                                                //         color: theme.backgroundColor),
                                                //   ),
                                                //   onTap: () {
                                                //     Navigator.of(context,rootNavigator: true)
                                                //         .push(MaterialPageRoute(builder: (context) {
                                                //       // return DetailPage(bean);
                                                //       return VerificationPersonal();
                                                //     }));
                                                //   },
                                                // ),
                                              ],
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
                                            height: screenHeight * 0.050,
                                            // color: Colors.blueGrey,
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.of(context,rootNavigator: true)
                                                //     .push(MaterialPageRoute(builder: (context) {
                                                //   return Security();
                                                // }));
                                              },
                                              child: ListTile(
                                                title: Row(
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                      left: 5,
                                                    )),
                                                    Text(
                                                      "No. of Orders within 30 days",
                                                      style: TextStyle(
                                                          color:
                                                              theme.hoverColor,
                                                          fontSize:
                                                              12 * textScale),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.08)),
                                                    Text(
                                                      "65",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              12 * textScale),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: screenHeight * 0.050,
                                            // color: Colors.blueGrey,
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.of(context,rootNavigator: true)
                                                //     .push(MaterialPageRoute(builder: (context) {
                                                //   return Security();
                                                // }));
                                              },
                                              child: ListTile(
                                                title: Row(
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                      left: 5,
                                                    )),
                                                    Text(
                                                      "Completion Rate within 30 days",
                                                      style: TextStyle(
                                                          color:
                                                              theme.hoverColor,
                                                          fontSize:
                                                              12 * textScale),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.08)),
                                                    Text(
                                                      "23",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              12 * textScale),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Divider(
                                          //   color: Colors.blueGrey[100],
                                          //   height: 2,
                                          //   thickness: 1,
                                          //   indent: 0,
                                          //   endIndent: 0,
                                          // ),
                                          Container(
                                            height: screenHeight * 0.050,
                                            // color: Colors.blueGrey,
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.of(context,rootNavigator: true)
                                                //     .push(MaterialPageRoute(builder: (context) {
                                                //   return Security();
                                                // }));
                                              },
                                              child: ListTile(
                                                title: Row(
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                      left: 5,
                                                    )),
                                                    Text(
                                                      "Total No of Orders",
                                                      style: TextStyle(
                                                          color:
                                                              theme.hoverColor,
                                                          fontSize:
                                                              12 * textScale),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.08)),
                                                    Text(
                                                      "43",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              12 * textScale),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        right: 5,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Divider(
                                          //   color: Colors.blueGrey[100],
                                          //   height: 2,
                                          //   thickness: 1,
                                          //   indent: 0,
                                          //   endIndent: 0,
                                          // ),
                                          SizedBox(
                                            height: screenHeight * 0.030,
                                          ),

                                          // Expanded(child: Container(height: screenHeight*0.40,)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Container(
                            //   height: screenHeight * 0.60,
                            //   child: Row(
                            //     children: [

                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    )))
                  ],
                ))));
  }
}

class _UsercenterMobile extends StatefulWidget {
  // final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _UsercenterMobile(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _UsercenterMobileState createState() => _UsercenterMobileState();
}

class _UsercenterMobileState extends State<_UsercenterMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  static const genderOptions = ['1', '2', '3'];
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  @override
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Padding(
        padding: EdgeInsets.only(right: 270),
        child: Text(
          item,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
      ));

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    final ScrollController _controller = ScrollController();

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          toolbarHeight: screenHeight * 0.15,
          elevation: 0.2,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              // color: theme.backgroundColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50.0, left: 0.0, right: 10),
                    child: Icon(
                      Icons.person_pin,
                      color: Colors.black,
                      size: 45.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.0, top: 30.0, right: 180),
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0.0, top: 25.0, right: 120),
                              child: Text(
                                " Username",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0 * textScale,
                                    color: Colors.black),
                              ),
                            ),
                          ]),
                          Row(
                            children: [
                              Text(
                                "Email ,SMS ,Identity Verification",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0 * textScale,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   // return DetailPage(bean);
                        //   return SignIn();
                        // }));
                      },
                    ),
                  ),

                  // InkWell(
                  //   child: Text(
                  //     "unverified",
                  //     style: TextStyle(
                  //         fontSize: 12 * textScale,
                  //         color: theme.backgroundColor),
                  //   ),
                  //   onTap: () {
                  //     Navigator.of(context,rootNavigator: true)
                  //         .push(MaterialPageRoute(builder: (context) {
                  //       // return DetailPage(bean);
                  //       return VerificationPersonal();
                  //     }));
                  //   },
                  // ),
                ],
              ),
            )
          ],
          backgroundColor: theme.scaffoldBackgroundColor,
        ),
        body: Container(
          width: screenWidth,
            child:
                //  BlocConsumer<TransactionBloc, TransactionState>(
                //   listener: (context, state) {
                // TODO: implement listener
                //     if (state is _SuccessTransactionState) {
                //   ScaffoldMessenger.of(context).showSnackBar((
                //     const SnackBar(
                //       duration: Duration(seconds: 2),
                //       content: Text(' succeess ', textScaleFactor: 1.5),
                //     ),
                //   );
                // }         else if (state is _ErrorTransactionState) {

                // ScaffoldMessenger.of(context).showSnackBar((
                //   const SnackBar(
                //     duration: Duration(seconds: 2),
                //     content: Text(' error ', textScaleFactor: 1.5),
                //   ),
                // );
                // }
                // },
                // builder: (context, state) {
                // return
                DefaultTabController(
                    length: 4,
                    child: Container(
          width: screenWidth,
                        color: theme.backgroundColor,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                color: theme.backgroundColor,
                                width:screenWidth,
height: screenHeight*0.05,
                                // child: const Align(
                                //   alignment: Alignment.centerRight,
                                child: SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                            child: TabBar(
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.grey),
                                          indicatorColor: Colors.white,
                                          labelColor: Colors.black87,
                                          automaticIndicatorColorAdjustment:
                                              true,
                                          physics: const BouncingScrollPhysics(
                                              parent:
                                                  AlwaysScrollableScrollPhysics()),
                                          isScrollable: true,
                                          unselectedLabelColor: Colors.grey,
                                          tabs: <Widget>[
                                            Tab(
                                              child: Text('Info',
                                                  style: TextStyle(
                                                      fontSize:
                                                          12 * textScale)),
                                            ),
                                            Tab(
                                              child: Text('Ads',
                                                  style: TextStyle(
                                                      fontSize:
                                                          12 * textScale)),
                                            ),
                                            Tab(
                                              child: Text('Following',
                                                  style: TextStyle(
                                                      fontSize:
                                                          12 * textScale)),
                                            ),
                                            Tab(
                                              child: Text('Blocked',
                                                  style: TextStyle(
                                                      fontSize:
                                                          12 * textScale)),
                                            ),
                                          ],
                                        )),
                                      ]),
                                ),
                                // ),
                              ),
                              Container(
                                height: screenHeight,
                                width: screenWidth,
                                      child: TabBarView(
                                children: [
                                  ListView(
                                      controller: _controller,

                                      // scrollDirection: Axis.vertical,
                                      // itemCount: state.p2p.length,
                                      padding: const EdgeInsets.all(0.0),
                                      children: [
                                       Container(
                                                color: theme.backgroundColor,
                                                height: screenHeight * 0.25,
                                                width: screenWidth ,

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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 0.0,
                                                                horizontal: 12),
                                                        child: Container(
                                                          width:
                                                              screenWidth * 1.2,
                                                          // color: theme.backgroundColor,
                                                          height: screenHeight *
                                                              0.22,
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
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                ListTile(
                                                                  title: Row(
                                                                      children: [
                                                                        Text('',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.w600)),
                                                                      ]),
                                                                ),
                                                                Divider(
                                                                  color: Colors
                                                                          .blueGrey[
                                                                      100],
                                                                  height: 2,
                                                                  thickness: 1,
                                                                  indent: 0,
                                                                  endIndent: 0,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "No of Orders within 30 days ",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "65 ",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "Completion Rate within 30 days",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "23",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          " Total No of Orders",
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "43 ",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0,
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                      ]),

                                  ListView.builder(
                                      controller: _controller,
                                      physics: const BouncingScrollPhysics(
                                          parent:
                                              AlwaysScrollableScrollPhysics()),
                                      scrollDirection: Axis.vertical,
                                      // itemCount: state.p2p.length,
                                      padding: const EdgeInsets.all(0.0),
                                      itemBuilder: (context, index) {
                                        // var bean = _list[index];

                                        return  Container(
                                                color: theme.backgroundColor,
                                                height: screenHeight * 0.25,
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 0.0,
                                                                horizontal: 12),
                                                        child: Container(
                                                          width:
                                                              screenWidth * 1.2,
                                                          // color: theme.backgroundColor,
                                                          height: screenHeight *
                                                              0.22,
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
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                           
                                                                Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsets.only(left: 15.0, top: 5.0, right: 120),
                                                                              child: Text(
                                                                                " Username",
                                                                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0 * textScale, color: Colors.black),
                                                                              ),
                                                                            ),
                                                                          ]),
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsets.only(
                                                                                left: 20.0,
                                                                                top: 5.0,
                                                                                right: 10),
                                                                            child:
                                                                                Text(
                                                                              "Email ,SMS ,Identity Verification",
                                                                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.0 * textScale, color: Colors.black),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                             
                                                             
                                                           
                                                                Divider(
                                                                  color: Colors
                                                                          .blueGrey[
                                                                      100],
                                                                  height: 2,
                                                                  thickness: 1,
                                                                  indent: 0,
                                                                  endIndent: 0,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "Price",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "65 ",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "Quantity",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "23",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          " Transaction limit",
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "43 ",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                           
                                                           
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          " Payment Method",
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "43 ",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                           
                                                           
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0,
                                                      ),
                                                    ],
                                                  ),
                                                ));

                                        // Padding(
                                        //   padding: EdgeInsets.all(8),
                                        //   child: Container(
                                        //     child: Container(
                                        //       child: SingleChildScrollView(
                                        //         child: Container(
                                        //           color: theme.scaffoldBackgroundColor,
                                        //           height: screenHeight * 0.35,
                                        //           // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                                        //           child: Card(
                                        //             color:
                                        //                 theme.scaffoldBackgroundColor,
                                        //             elevation: 0,
                                        //             child: ListView(
                                        //               controller: _controller,
                                        //               // physics: const BouncingScrollPhysics(
                                        //               //     parent: AlwaysScrollableScrollPhysics()),
                                        //               // padding: const EdgeInsets.all(8),
                                        //               children: <Widget>[
                                        //                 Container(
                                        //                   // color: theme.backgroundColor,
                                        //                   child: Row(
                                        //                     crossAxisAlignment:
                                        //                         CrossAxisAlignment
                                        //                             .start,
                                        //                     mainAxisAlignment:
                                        //                         MainAxisAlignment
                                        //                             .start,
                                        //                     children: [
                                        //                       Padding(
                                        //                         padding: EdgeInsets
                                        //                             .only(
                                        //                                 left:
                                        //                                     15.0,
                                        //                                 top:
                                        //                                     3.0,
                                        //                                 right:
                                        //                                     100),
                                        //                         child: InkWell(
                                        //                           child: Column(
                                        //                             mainAxisAlignment:
                                        //                                 MainAxisAlignment
                                        //                                     .start,
                                        //                             children: [
                                        //                               Row(
                                        //                                   children: [
                                        //                                     Padding(
                                        //                                       padding: EdgeInsets.only(left: 0.0, top: 5.0, right: 120),
                                        //                                       child: Text(
                                        //                                         " Info",
                                        //                                         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0 * textScale, color: Colors.black,),
                                        //                                       ),
                                        //                                     ),
                                        //                                   ]),

                                        //                             ],
                                        //                           ),
                                        //                           onTap: () {
                                        //                             // Navigator.of(context,rootNavigator: true)
                                        //                             //     .push(MaterialPageRoute(builder: (context) {
                                        //                             //   // return DetailPage(bean);
                                        //                             //   return SignIn();
                                        //                             // }));
                                        //                           },
                                        //                         ),
                                        //                       ),

                                        //                       // InkWell(
                                        //                       //   child: Text(
                                        //                       //     "unverified",
                                        //                       //     style: TextStyle(
                                        //                       //         fontSize: 12 * textScale,
                                        //                       //         color: theme.backgroundColor),
                                        //                       //   ),
                                        //                       //   onTap: () {
                                        //                       //     Navigator.of(context,rootNavigator: true)
                                        //                       //         .push(MaterialPageRoute(builder: (context) {
                                        //                       //       // return DetailPage(bean);
                                        //                       //       return VerificationPersonal();
                                        //                       //     }));
                                        //                       //   },
                                        //                       // ),
                                        //                     ],
                                        //                   ),
                                        //                 ),

                                        //                 Container(
                                        //                   height: screenHeight *
                                        //                       0.050,
                                        //                   // color: Colors.blueGrey,
                                        //                   child: InkWell(
                                        //                     onTap: () {
                                        //                       // Navigator.of(context,rootNavigator: true)
                                        //                       //     .push(MaterialPageRoute(builder: (context) {
                                        //                       //   return Security();
                                        //                       // }));
                                        //                     },
                                        //                     child: ListTile(
                                        //                       title: Row(
                                        //                         children: [
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .only(
                                        //                             left: 5,
                                        //                           )),
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .all(
                                        //                              0,
                                        //                           ),child:Text(
                                        //                             "User",
                                        //                                                                                                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0 * textScale, color: Colors.black,),

                                        //                           ),
                                        //                           ),

                                        //                           Expanded(
                                        //                               child: Container(
                                        //                                   width:
                                        //                                       screenWidth * 0.08)),
                                        //                           Text(
                                        //                             "hgjchvk65",
                                        //                                                                                                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0 * textScale, color: Colors.black,),

                                        //                           ),
                                        //                           Padding(
                                        //                             padding:
                                        //                                 EdgeInsets
                                        //                                     .only(
                                        //                               right: 5,
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),

                                        //              Divider(
                                        //                   color: Colors
                                        //                       .blueGrey[100],
                                        //                   height: 2,
                                        //                   thickness: 1,
                                        //                   indent: 0,
                                        //                   endIndent: 0,
                                        //                 ),
                                        //                 Container(
                                        //                   height: screenHeight *
                                        //                       0.040,
                                        //                   // color: Colors.blueGrey,
                                        //                   child: InkWell(
                                        //                     onTap: () {
                                        //                       // Navigator.of(context,rootNavigator: true)
                                        //                       //     .push(MaterialPageRoute(builder: (context) {
                                        //                       //   return Security();
                                        //                       // }));
                                        //                     },
                                        //                     child: ListTile(
                                        //                       title: Row(
                                        //                         children: [
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .only(
                                        //                             left: 5,
                                        //                           )),
                                        //                           Text(
                                        //                             "Price",
                                        //                             style: TextStyle(
                                        //                                 color: Colors.black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Expanded(
                                        //                               child: Container(
                                        //                                   width:
                                        //                                       screenWidth * 0.08)),
                                        //                           Text(
                                        //                             "23",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Padding(
                                        //                             padding:
                                        //                                 EdgeInsets
                                        //                                     .only(
                                        //                               right: 5,
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //                 // Divider(
                                        //                 //   color: Colors.blueGrey[100],
                                        //                 //   height: 2,
                                        //                 //   thickness: 1,
                                        //                 //   indent: 0,
                                        //                 //   endIndent: 0,
                                        //                 // ),

                                        //                 Container(
                                        //                   height: screenHeight *
                                        //                       0.040,
                                        //                   // color: Colors.blueGrey,
                                        //                   child: InkWell(
                                        //                     onTap: () {
                                        //                       // Navigator.of(context,rootNavigator: true)
                                        //                       //     .push(MaterialPageRoute(builder: (context) {
                                        //                       //   return Security();
                                        //                       // }));
                                        //                     },
                                        //                     child: ListTile(
                                        //                       title: Row(
                                        //                         children: [
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .only(
                                        //                             left: 5,
                                        //                           )),
                                        //                           Text(
                                        //                             "Quantity",
                                        //                             style: TextStyle(
                                        //                                 color: Colors.black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Expanded(
                                        //                               child: Container(
                                        //                                   width:
                                        //                                       screenWidth * 0.08)),
                                        //                           Text(
                                        //                             "43",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Padding(
                                        //                             padding:
                                        //                                 EdgeInsets
                                        //                                     .only(
                                        //                               right: 5,
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),                                  Container(
                                        //                   height: screenHeight *
                                        //                       0.040,
                                        //                   // color: Colors.blueGrey,
                                        //                   child: InkWell(
                                        //                     onTap: () {
                                        //                       // Navigator.of(context,rootNavigator: true)
                                        //                       //     .push(MaterialPageRoute(builder: (context) {
                                        //                       //   return Security();
                                        //                       // }));
                                        //                     },
                                        //                     child: ListTile(
                                        //                       title: Row(
                                        //                         children: [
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .only(
                                        //                             left: 5,
                                        //                           )),
                                        //                           Text(
                                        //                             "Transaction Limits",
                                        //                             style: TextStyle(
                                        //                                 color: Colors.black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Expanded(
                                        //                               child: Container(
                                        //                                   width:
                                        //                                       screenWidth * 0.08)),
                                        //                           Text(
                                        //                             "43",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Padding(
                                        //                             padding:
                                        //                                 EdgeInsets
                                        //                                     .only(
                                        //                               right: 5,
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),

                                        //                         Container(
                                        //                   height: screenHeight *
                                        //                       0.040,
                                        //                   // color: Colors.blueGrey,
                                        //                   child: InkWell(
                                        //                     onTap: () {
                                        //                       // Navigator.of(context,rootNavigator: true)
                                        //                       //     .push(MaterialPageRoute(builder: (context) {
                                        //                       //   return Security();
                                        //                       // }));
                                        //                     },
                                        //                     child: ListTile(
                                        //                       title: Row(
                                        //                         children: [
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .only(
                                        //                             left: 5,
                                        //                           )),
                                        //                           Text(
                                        //                             "payment method",
                                        //                             style: TextStyle(
                                        //                                 color: Colors.black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Expanded(
                                        //                               child: Container(
                                        //                                   width:
                                        //                                       screenWidth * 0.08)),
                                        //                           Text(
                                        //                             "43",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Padding(
                                        //                             padding:
                                        //                                 EdgeInsets
                                        //                                     .only(
                                        //                               right: 5,
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),                                  Container(
                                        //                   height: screenHeight *
                                        //                       0.040,
                                        //                   // color: Colors.blueGrey,
                                        //                   child: InkWell(
                                        //                     onTap: () {
                                        //                       // Navigator.of(context,rootNavigator: true)
                                        //                       //     .push(MaterialPageRoute(builder: (context) {
                                        //                       //   return Security();
                                        //                       // }));
                                        //                     },
                                        //                     child: ListTile(
                                        //                       title: Row(
                                        //                         children: [
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .only(
                                        //                             left: 5,
                                        //                           )),
                                        //                           Text(
                                        //                             "momo",
                                        //                             style: TextStyle(
                                        //                                 color: Colors.black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Expanded(
                                        //                               child: Container(
                                        //                                   width:
                                        //                                       screenWidth * 0.08)),
                                        //                           Text(
                                        //                             "43",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Padding(
                                        //                             padding:
                                        //                                 EdgeInsets
                                        //                                     .only(
                                        //                               right: 5,
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //                 // Divider(
                                        //                 //   color: Colors.blueGrey[100],
                                        //                 //   height: 2,
                                        //                 //   thickness: 1,
                                        //                 //   indent: 0,
                                        //                 //   endIndent: 0,
                                        //                 // ),

                                        //                 // Expanded(child: Container(height: screenHeight*0.40,)),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // );
                                      }),

                                  ListView.builder(
                                      controller: _controller,
                                      physics: const BouncingScrollPhysics(
                                          parent:
                                              AlwaysScrollableScrollPhysics()),
                                      scrollDirection: Axis.vertical,
                                      // itemCount: state.p2p.length,
                                      padding: const EdgeInsets.all(0.0),
                                      itemBuilder: (context, index) {
                                        // var bean = _list[index];

                                        return  Container(
                                                color: theme.backgroundColor,
                                                height: screenHeight * 0.25,
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 0.0,
                                                                horizontal: 12),
                                                        child: Container(
                                                          width:
                                                              screenWidth * 1.2,
                                                          // color: theme.backgroundColor,
                                                          height: screenHeight *
                                                              0.22,
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
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[


                                                                Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsets.only(left: 15.0, top: 5.0, right: 120),
                                                                              child: Text(
                                                                                " Username",
                                                                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0 * textScale, color: Colors.black),
                                                                              ),
                                                                            ),
                                                                          ]),
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsets.only(
                                                                                left: 20.0,
                                                                                top: 5.0,
                                                                                right: 10),
                                                                            child:
                                                                                Text(
                                                                              "Email ,SMS ,Identity Verification",
                                                                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.0 * textScale, color: Colors.black),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                             
                                                             
                                                                Divider(
                                                                  color: Colors
                                                                          .blueGrey[
                                                                      100],
                                                                  height: 2,
                                                                  thickness: 1,
                                                                  indent: 0,
                                                                  endIndent: 0,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "No of Orders within 30 days ",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "65 ",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "Completion Rate within 30 days",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "23",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          " Total No of Orders",
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "43 ",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0,
                                                      ),
                                                    ],
                                                  ),
                                                ));

                                        // Padding(
                                        //   padding: EdgeInsets.all(8),
                                        //   child: Container(
                                        //     child: Container(
                                        //       child: SingleChildScrollView(
                                        //         child: Container(
                                        //           color: theme
                                        //               .scaffoldBackgroundColor,
                                        //           height: screenHeight * 0.30,
                                        //           // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                                        //           child: Card(
                                        //             color: theme
                                        //                 .scaffoldBackgroundColor,
                                        //             elevation: 0,
                                        //             child: ListView(
                                        //               controller: _controller,
                                        //               // physics: const BouncingScrollPhysics(
                                        //               //     parent: AlwaysScrollableScrollPhysics()),
                                        //               // padding: const EdgeInsets.all(8),
                                        //               children: <Widget>[
                                        //                 Container(
                                        //                   // color: theme.backgroundColor,
                                        //                   child: Row(
                                        //                     crossAxisAlignment:
                                        //                         CrossAxisAlignment
                                        //                             .start,
                                        //                     mainAxisAlignment:
                                        //                         MainAxisAlignment
                                        //                             .start,
                                        //                     children: [
                                        //                       Padding(
                                        //                         padding: EdgeInsets
                                        //                             .only(
                                        //                                 left:
                                        //                                     15.0,
                                        //                                 top:
                                        //                                     3.0,
                                        //                                 right:
                                        //                                     100),
                                        //                         child: InkWell(
                                        //                           child: Column(
                                        //                             mainAxisAlignment:
                                        //                                 MainAxisAlignment
                                        //                                     .start,
                                        //                             children: [
                                        //                               Row(
                                        //                                   children: [
                                        //                                     Padding(
                                        //                                       padding: EdgeInsets.only(left: 0.0, top: 5.0, right: 120),
                                        //                                       child: Text(
                                        //                                         " Username",
                                        //                                         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0 * textScale, color: Colors.black),
                                        //                                       ),
                                        //                                     ),
                                        //                                   ]),
                                        //                               Row(
                                        //                                 children: [
                                        //                                   Padding(
                                        //                                     padding: EdgeInsets.only(
                                        //                                         left: 0.0,
                                        //                                         top: 5.0,
                                        //                                         right: 10),
                                        //                                     child:
                                        //                                         Text(
                                        //                                       "Email ,SMS ,Identity Verification",
                                        //                                       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.0 * textScale, color: Colors.black),
                                        //                                     ),
                                        //                                   ),
                                        //                                 ],
                                        //                               ),
                                        //                             ],
                                        //                           ),
                                        //                           onTap: () {
                                        //                             // Navigator.of(context,rootNavigator: true)
                                        //                             //     .push(MaterialPageRoute(builder: (context) {
                                        //                             //   // return DetailPage(bean);
                                        //                             //   return SignIn();
                                        //                             // }));
                                        //                           },
                                        //                         ),
                                        //                       ),

                                        //                       // InkWell(
                                        //                       //   child: Text(
                                        //                       //     "unverified",
                                        //                       //     style: TextStyle(
                                        //                       //         fontSize: 12 * textScale,
                                        //                       //         color: theme.backgroundColor),
                                        //                       //   ),
                                        //                       //   onTap: () {
                                        //                       //     Navigator.of(context,rootNavigator: true)
                                        //                       //         .push(MaterialPageRoute(builder: (context) {
                                        //                       //       // return DetailPage(bean);
                                        //                       //       return VerificationPersonal();
                                        //                       //     }));
                                        //                       //   },
                                        //                       // ),
                                        //                     ],
                                        //                   ),
                                        //                 ),
                                        //                 Divider(
                                        //                   color: Colors
                                        //                       .blueGrey[100],
                                        //                   height: 2,
                                        //                   thickness: 1,
                                        //                   indent: 0,
                                        //                   endIndent: 0,
                                        //                 ),
                                        //                 Container(
                                        //                   height: screenHeight *
                                        //                       0.050,
                                        //                   // color: Colors.blueGrey,
                                        //                   child: InkWell(
                                        //                     onTap: () {
                                        //                       // Navigator.of(context,rootNavigator: true)
                                        //                       //     .push(MaterialPageRoute(builder: (context) {
                                        //                       //   return Security();
                                        //                       // }));
                                        //                     },
                                        //                     child: ListTile(
                                        //                       title: Row(
                                        //                         children: [
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .only(
                                        //                             left: 5,
                                        //                           )),
                                        //                           Text(
                                        //                             "No. of Orders within 30 days",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Expanded(
                                        //                               child: Container(
                                        //                                   width:
                                        //                                       screenWidth * 0.08)),
                                        //                           Text(
                                        //                             "65",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Padding(
                                        //                             padding:
                                        //                                 EdgeInsets
                                        //                                     .only(
                                        //                               right: 5,
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //                 Container(
                                        //                   height: screenHeight *
                                        //                       0.050,
                                        //                   // color: Colors.blueGrey,
                                        //                   child: InkWell(
                                        //                     onTap: () {
                                        //                       // Navigator.of(context,rootNavigator: true)
                                        //                       //     .push(MaterialPageRoute(builder: (context) {
                                        //                       //   return Security();
                                        //                       // }));
                                        //                     },
                                        //                     child: ListTile(
                                        //                       title: Row(
                                        //                         children: [
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .only(
                                        //                             left: 5,
                                        //                           )),
                                        //                           Text(
                                        //                             "Completion Rate within 30 days",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Expanded(
                                        //                               child: Container(
                                        //                                   width:
                                        //                                       screenWidth * 0.08)),
                                        //                           Text(
                                        //                             "23",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Padding(
                                        //                             padding:
                                        //                                 EdgeInsets
                                        //                                     .only(
                                        //                               right: 5,
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //                 // Divider(
                                        //                 //   color: Colors.blueGrey[100],
                                        //                 //   height: 2,
                                        //                 //   thickness: 1,
                                        //                 //   indent: 0,
                                        //                 //   endIndent: 0,
                                        //                 // ),
                                        //                 Container(
                                        //                   height: screenHeight *
                                        //                       0.050,
                                        //                   // color: Colors.blueGrey,
                                        //                   child: InkWell(
                                        //                     onTap: () {
                                        //                       // Navigator.of(context,rootNavigator: true)
                                        //                       //     .push(MaterialPageRoute(builder: (context) {
                                        //                       //   return Security();
                                        //                       // }));
                                        //                     },
                                        //                     child: ListTile(
                                        //                       title: Row(
                                        //                         children: [
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .only(
                                        //                             left: 5,
                                        //                           )),
                                        //                           Text(
                                        //                             "Total No of Orders",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Expanded(
                                        //                               child: Container(
                                        //                                   width:
                                        //                                       screenWidth * 0.08)),
                                        //                           Text(
                                        //                             "43",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Padding(
                                        //                             padding:
                                        //                                 EdgeInsets
                                        //                                     .only(
                                        //                               right: 5,
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //                 // Divider(
                                        //                 //   color: Colors.blueGrey[100],
                                        //                 //   height: 2,
                                        //                 //   thickness: 1,
                                        //                 //   indent: 0,
                                        //                 //   endIndent: 0,
                                        //                 // ),

                                        //                 // Expanded(child: Container(height: screenHeight*0.40,)),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // );
                                      }),

                                  ListView.builder(
                                      controller: _controller,
                                      physics: const BouncingScrollPhysics(
                                          parent:
                                              AlwaysScrollableScrollPhysics()),
                                      scrollDirection: Axis.vertical,
                                      // itemCount: state.p2p.length,
                                      padding: const EdgeInsets.all(0.0),
                                      itemBuilder: (context, index) {
                                        // var bean = _list[index];

                                        return  Container(
                                                color: theme.backgroundColor,
                                                height: screenHeight * 0.25,
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 0.0,
                                                                horizontal: 12),
                                                        child: Container(
                                                          width:
                                                              screenWidth * 1.2,
                                                          // color: theme.backgroundColor,
                                                          height: screenHeight *
                                                              0.22,
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
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsets.only(left: 15.0, top: 5.0, right: 120),
                                                                              child: Text(
                                                                                " Username",
                                                                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0 * textScale, color: Colors.black),
                                                                              ),
                                                                            ),
                                                                          ]),
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsets.only(
                                                                                left: 20.0,
                                                                                top: 5.0,
                                                                                right: 10),
                                                                            child:
                                                                                Text(
                                                                              "Email ,SMS ,Identity Verification",
                                                                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.0 * textScale, color: Colors.black),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                             
                                                                Divider(
                                                                  color: Colors
                                                                          .blueGrey[
                                                                      100],
                                                                  height: 2,
                                                                  thickness: 1,
                                                                  indent: 0,
                                                                  endIndent: 0,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "No of Orders within 30 days ",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "65 ",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "Completion Rate within 30 days",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "23",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          " Total No of Orders",
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                    Expanded(
                                                                        child: Container(
                                                                            width:
                                                                                screenWidth * 0.65)),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                1,
                                                                            left:
                                                                                12,
                                                                            right:
                                                                                12),
                                                                        child:
                                                                            Text(
                                                                          "43 ",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0,
                                                      ),
                                                    ],
                                                  ),
                                                ));

                                        // Padding(
                                        //   padding: EdgeInsets.all(8),
                                        //   child: Container(
                                        //     child: Container(
                                        //       child: SingleChildScrollView(
                                        //         child: Container(
                                        //           color: theme
                                        //               .scaffoldBackgroundColor,
                                        //           height: screenHeight * 0.30,
                                        //           // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                                        //           child: Card(
                                        //             color: theme
                                        //                 .scaffoldBackgroundColor,
                                        //             elevation: 0,
                                        //             child: ListView(
                                        //               controller: _controller,
                                        //               // physics: const BouncingScrollPhysics(
                                        //               //     parent: AlwaysScrollableScrollPhysics()),
                                        //               // padding: const EdgeInsets.all(8),
                                        //               children: <Widget>[
                                        //                 Container(
                                        //                   // color: theme.backgroundColor,
                                        //                   child: Row(
                                        //                     crossAxisAlignment:
                                        //                         CrossAxisAlignment
                                        //                             .start,
                                        //                     mainAxisAlignment:
                                        //                         MainAxisAlignment
                                        //                             .start,
                                        //                     children: [
                                        //                       Padding(
                                        //                         padding: EdgeInsets
                                        //                             .only(
                                        //                                 left:
                                        //                                     15.0,
                                        //                                 top:
                                        //                                     3.0,
                                        //                                 right:
                                        //                                     100),
                                        //                         child: InkWell(
                                        //                           child: Column(
                                        //                             mainAxisAlignment:
                                        //                                 MainAxisAlignment
                                        //                                     .start,
                                        //                             children: [
                                        //                               Row(
                                        //                                   children: [
                                        //                                     Padding(
                                        //                                       padding: EdgeInsets.only(left: 0.0, top: 5.0, right: 120),
                                        //                                       child: Text(
                                        //                                         " Username",
                                        //                                         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0 * textScale, color: Colors.black),
                                        //                                       ),
                                        //                                     ),
                                        //                                   ]),
                                        //                               Row(
                                        //                                 children: [
                                        //                                   Padding(
                                        //                                     padding: EdgeInsets.only(
                                        //                                         left: 0.0,
                                        //                                         top: 5.0,
                                        //                                         right: 10),
                                        //                                     child:
                                        //                                         Text(
                                        //                                       "Email ,SMS ,Identity Verification",
                                        //                                       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.0 * textScale, color: Colors.black),
                                        //                                     ),
                                        //                                   ),
                                        //                                 ],
                                        //                               ),
                                        //                             ],
                                        //                           ),
                                        //                           onTap: () {
                                        //                             // Navigator.of(context,rootNavigator: true)
                                        //                             //     .push(MaterialPageRoute(builder: (context) {
                                        //                             //   // return DetailPage(bean);
                                        //                             //   return SignIn();
                                        //                             // }));
                                        //                           },
                                        //                         ),
                                        //                       ),

                                        //                       // InkWell(
                                        //                       //   child: Text(
                                        //                       //     "unverified",
                                        //                       //     style: TextStyle(
                                        //                       //         fontSize: 12 * textScale,
                                        //                       //         color: theme.backgroundColor),
                                        //                       //   ),
                                        //                       //   onTap: () {
                                        //                       //     Navigator.of(context,rootNavigator: true)
                                        //                       //         .push(MaterialPageRoute(builder: (context) {
                                        //                       //       // return DetailPage(bean);
                                        //                       //       return VerificationPersonal();
                                        //                       //     }));
                                        //                       //   },
                                        //                       // ),
                                        //                     ],
                                        //                   ),
                                        //                 ),
                                        //                 Divider(
                                        //                   color: Colors
                                        //                       .blueGrey[100],
                                        //                   height: 2,
                                        //                   thickness: 1,
                                        //                   indent: 0,
                                        //                   endIndent: 0,
                                        //                 ),
                                        //                 Container(
                                        //                   height: screenHeight *
                                        //                       0.050,
                                        //                   // color: Colors.blueGrey,
                                        //                   child: InkWell(
                                        //                     onTap: () {
                                        //                       // Navigator.of(context,rootNavigator: true)
                                        //                       //     .push(MaterialPageRoute(builder: (context) {
                                        //                       //   return Security();
                                        //                       // }));
                                        //                     },
                                        //                     child: ListTile(
                                        //                       title: Row(
                                        //                         children: [
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .only(
                                        //                             left: 5,
                                        //                           )),
                                        //                           Text(
                                        //                             "No. of Orders within 30 days",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Expanded(
                                        //                               child: Container(
                                        //                                   width:
                                        //                                       screenWidth * 0.08)),
                                        //                           Text(
                                        //                             "65",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Padding(
                                        //                             padding:
                                        //                                 EdgeInsets
                                        //                                     .only(
                                        //                               right: 5,
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //                 Container(
                                        //                   height: screenHeight *
                                        //                       0.050,
                                        //                   // color: Colors.blueGrey,
                                        //                   child: InkWell(
                                        //                     onTap: () {
                                        //                       // Navigator.of(context,rootNavigator: true)
                                        //                       //     .push(MaterialPageRoute(builder: (context) {
                                        //                       //   return Security();
                                        //                       // }));
                                        //                     },
                                        //                     child: ListTile(
                                        //                       title: Row(
                                        //                         children: [
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .only(
                                        //                             left: 5,
                                        //                           )),
                                        //                           Text(
                                        //                             "Completion Rate within 30 days",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Expanded(
                                        //                               child: Container(
                                        //                                   width:
                                        //                                       screenWidth * 0.08)),
                                        //                           Text(
                                        //                             "23",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Padding(
                                        //                             padding:
                                        //                                 EdgeInsets
                                        //                                     .only(
                                        //                               right: 5,
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //                 // Divider(
                                        //                 //   color: Colors.blueGrey[100],
                                        //                 //   height: 2,
                                        //                 //   thickness: 1,
                                        //                 //   indent: 0,
                                        //                 //   endIndent: 0,
                                        //                 // ),
                                        //                 Container(
                                        //                   height: screenHeight *
                                        //                       0.050,
                                        //                   // color: Colors.blueGrey,
                                        //                   child: InkWell(
                                        //                     onTap: () {
                                        //                       // Navigator.of(context,rootNavigator: true)
                                        //                       //     .push(MaterialPageRoute(builder: (context) {
                                        //                       //   return Security();
                                        //                       // }));
                                        //                     },
                                        //                     child: ListTile(
                                        //                       title: Row(
                                        //                         children: [
                                        //                           Padding(
                                        //                               padding:
                                        //                                   EdgeInsets
                                        //                                       .only(
                                        //                             left: 5,
                                        //                           )),
                                        //                           Text(
                                        //                             "Total No of Orders",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Expanded(
                                        //                               child: Container(
                                        //                                   width:
                                        //                                       screenWidth * 0.08)),
                                        //                           Text(
                                        //                             "43",
                                        //                             style: TextStyle(
                                        //                                 color: Colors
                                        //                                     .black,
                                        //                                 fontSize:
                                        //                                     12 *
                                        //                                         textScale),
                                        //                           ),
                                        //                           Padding(
                                        //                             padding:
                                        //                                 EdgeInsets
                                        //                                     .only(
                                        //                               right: 5,
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //                 // Divider(
                                        //                 //   color: Colors.blueGrey[100],
                                        //                 //   height: 2,
                                        //                 //   thickness: 1,
                                        //                 //   indent: 0,
                                        //                 //   endIndent: 0,
                                        //                 // ),

                                        //                 // Expanded(child: Container(height: screenHeight*0.40,)),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // );
                                     
                                     
                                     
                                      })

                                  // Container(
                                  //   height: screenHeight * 0.60,
                                  //   child: Row(
                                  //     children: [

                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ))
                            ])))
            // },

            ));
  }
}
