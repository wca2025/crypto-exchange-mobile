import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../businesslogic/blocs/p2p/p2p_bloc.dart';
import 'p2pappeal.dart';
import 'p2pordercompleted.dart';
import '../widgets/responsive.dart';
import 'sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'transfer.dart';

class P2pPending extends StatefulWidget {
  String? token;
  String? accounttype;
  P2pPending({Key? key, this.token, this.accounttype});

  @override
  _P2pPendingState createState() =>
      _P2pPendingState(token: this.token, accounttype: this.accounttype);
}

class _P2pPendingState extends State<P2pPending> {
  // Function showResult;
  String? token;
  String? accounttype;

  _P2pPendingState({this.token, this.accounttype});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _P2pPendingMobile(token: token, accounttype: accounttype),
          tablet: _P2pPendingTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _P2pPendingTablet extends StatefulWidget {
  //  final Function showResult;

  _P2pPendingTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __P2pPendingTabletState createState() => __P2pPendingTabletState();
}

class __P2pPendingTabletState extends State<_P2pPendingTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

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
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: Text("P2p Pending ",
            style: TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        elevation: 0.2,
        actions: [
          IconButton(
            padding: const EdgeInsets.all(0.0),
            iconSize: 18,
            icon: const Icon(
              Icons.qr_code_scanner,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .push(MaterialPageRoute(builder: (context) {
                return P2pAppeal();
              }));
            },
          ),
        ],
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          color: theme.backgroundColor,
          height: screenHeight * 1.4,
          // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: ListView(
            controller: _controller,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
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
                          "Buy",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "BTC",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "Amount",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "43",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "OrderID",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "oid564",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "Price",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "56",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "Created Time",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "12/3/22",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "Quantity",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "56",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "Nickname",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "edemgbk",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "Payment Method",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "Mtn Mobile Money",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        '-Please complete your payment within 15:00  Otherwise the order will be automatically cancelled',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: theme.hoverColor,
                          fontSize: 12 * textScale,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.035,
              ),

              // Expanded(child: Container(height: screenHeight*0.40,)),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: GestureDetector(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFFf5f7fa),
                  )),
                  onPressed: () {
                    // Navigator.of(context,rootNavigator: true).push(
                    //     MaterialPageRoute(
                    //         builder: (context) {
                    //   return Deposit();
                    // }));
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 14 * textScale,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            )),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: GestureDetector(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFFf5f7fa),
                  )),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .push(MaterialPageRoute(builder: (context) {
                      return P2pOrderCompleted();
                    }));
                  },
                  child: Text(
                    'Pending',
                    style: TextStyle(
                        fontSize: 14 * textScale,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            )),
            SizedBox(
              width: 5.0,
            ),
          ]),
    );
  }
}

class _P2pPendingMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _P2pPendingMobile({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _P2pPendingMobileState createState() =>
      _P2pPendingMobileState(token: this.token, accounttype: this.accounttype);
}

class _P2pPendingMobileState extends State<_P2pPendingMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String? token;
  String? tokenlabel = 'Coin';
  _P2pPendingMobileState({this.token, this.accounttype});

  String? accounttype;
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
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: Text("P2p Pending ",
            style: TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        elevation: 0.2,
        actions: [
          IconButton(
            padding: const EdgeInsets.all(0.0),
            iconSize: 18,
            icon: const Icon(
              Icons.qr_code_scanner,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .push(MaterialPageRoute(builder: (context) {
                return P2pAppeal();
              }));
            },
          ),
        ],
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body:
          //  BlocConsumer<P2pBloc, P2pState>(
          //   listener: (context, state) {
          // TODO: implement listener
          //   if (state is _SuccessP2pState) {
          //   ScaffoldMessenger.of(context).showSnackBar((
          //     const SnackBar(
          //       duration: Duration(seconds: 2),
          //       content: Text(' succeess ', textScaleFactor: 1.5),
          //     ),
          //   );
          // }         else if (state is _ErrorP2pState) {

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
          DefaultTabController(
        length: 2,
        child: Container(
          color: theme.backgroundColor,
          height: screenHeight * 1.4,
          // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: ListView(
            controller: _controller,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
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
                          "Buy",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "BTC",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "Amount",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "43",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "OrderID",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "oid564",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "Price",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "56",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "Created Time",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "12/3/22",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "Quantity",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "56",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "Nickname",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "edemgbk",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
                          "Payment Method",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "Mtn Mobile Money",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        '-Please complete your payment within 15:00  Otherwise the order will be automatically cancelled',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: theme.hoverColor,
                          fontSize: 12 * textScale,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.035,
              ),

              // Expanded(child: Container(height: screenHeight*0.40,)),
            ],
          ),
        ),
        //   );
        // },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: GestureDetector(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFFf5f7fa),
                  )),
                  onPressed: () {
                    // Navigator.of(context,rootNavigator: true).push(
                    //     MaterialPageRoute(
                    //         builder: (context) {
                    //   return Deposit();
                    // }));
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 14 * textScale,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            )),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: GestureDetector(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFFf5f7fa),
                  )),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .push(MaterialPageRoute(builder: (context) {
                      return P2pOrderCompleted();
                    }));
                  },
                  child: Text(
                    'Pending',
                    style: TextStyle(
                        fontSize: 14 * textScale,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            )),
            SizedBox(
              width: 5.0,
            ),
          ]),
    );
  }
}
