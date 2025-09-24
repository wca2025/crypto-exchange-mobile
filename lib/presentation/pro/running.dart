import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../businesslogic/blocs/p2p/p2p_bloc.dart';
import 'orderdetails.dart';
import '../widgets/responsive.dart';
import 'sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'transfer.dart';

class Running extends StatefulWidget {
  String? token;
  String? accounttype;
  Running({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _RunningState createState() =>
      _RunningState(token: this.token, accounttype: this.accounttype);
}

class _RunningState extends State<Running> {
  // Function showResult;
  String? token;
  String? accounttype;
  _RunningState({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _RunningMobile(token: token, accounttype: accounttype),
          tablet: _RunningTablet(),
        ),
      ),
    );
  }
}

class _RunningTablet extends StatefulWidget {
  //  final Function showResult;

  _RunningTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _RunningTabletState createState() => _RunningTabletState();
}

class _RunningTabletState extends State<_RunningTablet> {
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
        title: Text("Running",
            style: TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        automaticallyImplyLeading: false,
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        actions: [
          Container(
              width: screenWidth * 0.40,
              height: screenHeight * 0.35,
              // color: Colors.grey[400],
              child: Row(
                children: [
                  IconButton(
                    iconSize: 18,
                    icon: const Icon(
                      Icons.headphones_rounded,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      // handle the press
                    },
                  ),
                  IconButton(
                    padding: const EdgeInsets.all(0.0),
                    iconSize: 18,
                    icon: const Icon(
                      Icons.qr_code_scanner,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      // handle the press
                      // showSearch(
                      //     context: context, delegate: SearchList(widget.list));
                    },
                  ),
                  //          (state is AuthAuthenticatedState)
                  // ?
                  IconButton(
                    padding: const EdgeInsets.all(0.0),
                    iconSize: 18,
                    icon: const Icon(
                      Icons.mail_outline_outlined,
                      color: Colors.black87,
                    ),
                    onPressed: () {},
                  )
                  //         :
                  // IconButton(
                  //   padding: const EdgeInsets.all(0.0),
                  //   iconSize: 18,
                  //   icon: const Icon(
                  //     Icons.mail_outline_outlined,
                  //     color: Colors.black87,
                  //   ),
                  //   onPressed: () {
                  //     Navigator.of(context, rootNavigator: true)
                  //         .push(MaterialPageRoute(builder: (context) {
                  //       // return DetailPage(bean);
                  //       return SignIn();
                  //     }));
                  //   },
                  // )
                ],
              )),
        ],
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
                          "45",
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
                          "oid6534",
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
                          "45",
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
                          "04/06/22",
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
                          "36",
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
                    //   return Cancel();
                    // }));
                  },
                  child: Text(
                    'Create',
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
                      return OrderDetails();
                    }));
                  },
                  child: Text(
                    'Running',
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

class _RunningMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _RunningMobile({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _RunningMobileState createState() =>
      _RunningMobileState(token: this.token, accounttype: this.accounttype);
}

class _RunningMobileState extends State<_RunningMobile> {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _RunningMobileState({this.token, this.accounttype});
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
        title: Text("Running",
            style: TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        automaticallyImplyLeading: false,
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        actions: [
          Container(
              width: screenWidth * 0.40,
              height: screenHeight * 0.35,
              // color: Colors.grey[400],
              child: Row(
                children: [
                  IconButton(
                    padding: const EdgeInsets.all(0.0),
                    iconSize: 18,
                    icon: const Icon(
                      Icons.edit_note_outlined,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      // handle the press
                      // showSearch(
                      //     context: context, delegate: SearchList(widget.list));
                    },
                  ),
                  //          (state is AuthAuthenticatedState)
                  // ?
                  IconButton(
                    padding: const EdgeInsets.all(0.0),
                    iconSize: 18,
                    icon: const Icon(
                      Icons.ios_share_outlined,
                      color: Colors.black87,
                    ),
                    onPressed: () {},
                  )
                  //         :
                  // IconButton(
                  //   padding: const EdgeInsets.all(0.0),
                  //   iconSize: 18,
                  //   icon: const Icon(
                  //     Icons.mail_outline_outlined,
                  //     color: Colors.black87,
                  //   ),
                  //   onPressed: () {
                  //     Navigator.of(context, rootNavigator: true)
                  //         .push(MaterialPageRoute(builder: (context) {
                  //       // return DetailPage(bean);
                  //       return SignIn();
                  //     }));
                  //   },
                  // )
                ],
              )),
        ],
      ),
      body:
          // BlocConsumer<P2pBloc, P2pState>(
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
                          "BTC/USDT",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 16 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "",
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
                          "Investment (USDT)",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "45",
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
                          "TotalProfit (USDT)",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "oid6534",
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
                          "Unealized PNL",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "45",
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
                          "04/06/22",
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
                          "Invest & Earn",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "36",
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
                          "Grid number",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "36",
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
                          " Quantity per Order",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "36",
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
                          "Total Mathed Trades",
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
                          "Duration",
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
             
//

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
                          "Take Profit",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "",
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
                          "Stop loss",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "",
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
                          " Trigger Price",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "34",
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
                          "Strategy number",
                          style: TextStyle(
                              color: theme.hoverColor,
                              fontSize: 12 * textScale),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.08)),
                        Text(
                          "4",
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
                height: screenHeight * 0.035,
              ),
              // Expanded(child: Container(height: screenHeight*0.40,)),
            ],
          ),
        ),
      ), // ;
      //   },
      // ),
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
                    //   return Cancel();
                    // }));
                  },
                  child: Text(
                    'Create',
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
                      return OrderDetails();
                    }));
                  },
                  child: Text(
                    'Running',
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
                      return OrderDetails();
                    }));
                  },
                  child: Text(
                    'End',
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
