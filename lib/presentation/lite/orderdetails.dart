import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../businesslogic/blocs/p2p/p2p_bloc.dart';
import 'buy.dart';
import '../widgets/responsive.dart';
import 'sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderDetails extends StatefulWidget {
  String? token;
  String? accounttype;
  OrderDetails({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _OrderDetailsState createState() =>
      _OrderDetailsState(token: this.token, accounttype: this.accounttype);
}

class _OrderDetailsState extends State<OrderDetails> {
  String? token;
  String? accounttype;
  _OrderDetailsState({this.token, this.accounttype});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _OrderDetailsMobile(token: token, accounttype: accounttype),
          tablet: _OrderDetailsTablet(),
        ),
      ),
    );
  }
}

class _OrderDetailsTablet extends StatefulWidget {
  _OrderDetailsTablet();

  @override
  __OrderDetailsTabletState createState() => __OrderDetailsTabletState();
}

class __OrderDetailsTabletState extends State<_OrderDetailsTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
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
          elevation: 0.2,
          bottomOpacity: 1.0,
          actions: [
            IconButton(
              padding: const EdgeInsets.all(0.0),
              iconSize: 18,
              icon: const Icon(
                Icons.keyboard_return_outlined,
                color: Colors.black87,
              ),
              onPressed: () {
                //   Navigator.of(context,rootNavigator: true)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return P2P();
                // }));
              },
            ),
          ],
          shadowColor: theme.scaffoldBackgroundColor,
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: Text("Order Details",
              style:
                  TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
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
                            "ETH",
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
                            "12",
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
                            "oid2134535",
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
                            "23",
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
                            "32",
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
                            "Mtn mobile money",
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
        floatingActionButton: Stack(fit: StackFit.expand, children: [
          // Positioned(
          //    height: screenHeight*0.060,

          //    width: screenWidth*0.260,

          //   left: 30,
        ]));
  }
}

class _OrderDetailsMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _OrderDetailsMobile({Key? key, this.token, this.accounttype})
      : super(key: key);

  @override
  _OrderDetailsMobileState createState() => _OrderDetailsMobileState(
      token: this.token, accounttype: this.accounttype);
}

class _OrderDetailsMobileState extends State<_OrderDetailsMobile> {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _OrderDetailsMobileState({this.token, this.accounttype});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
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
          elevation: 0.2,
          bottomOpacity: 1.0,
          actions: [
            IconButton(
              padding: const EdgeInsets.all(0.0),
              iconSize: 18,
              icon: const Icon(
                Icons.keyboard_return_outlined,
                color: Colors.black87,
              ),
              onPressed: () {
                //   Navigator.of(context,rootNavigator: true)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return P2P();
                // }));
              },
            ),
          ],
          shadowColor: theme.scaffoldBackgroundColor,
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: Text("Order Details",
              style:
                  TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        ),
        body: 
        // BlocConsumer<P2pBloc, P2pState>(
        //   listener: (context, state) {
            // TODO: implement listener
            //     if (state is SuccessP2pState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' succeess ', textScaleFactor: 1.5),
            //     ),
            //   );
            // }         else if (state is ErrorP2pState) {

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
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              Text(
                                "ETH",
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
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              Text(
                                "12",
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
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              Text(
                                "oid2134535",
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
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              Text(
                                "23",
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
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
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
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              Text(
                                "32",
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
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
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
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              Text(
                                "Mtn mobile money",
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
          //   );
          // },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack(fit: StackFit.expand, children: [
          // Positioned(
          //    height: screenHeight*0.060,

          //    width: screenWidth*0.260,

          //   left: 30,
        ]));
  }
}
