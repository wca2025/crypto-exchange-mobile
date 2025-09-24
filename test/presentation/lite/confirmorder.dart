import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../businesslogic/blocs/p2p/p2p_bloc.dart';
import '../widgets/responsive.dart';
import 'sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfirmOrder extends StatefulWidget {
  String? token;
  String? accounttype;
  ConfirmOrder({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _ConfirmOrderState createState() =>
      _ConfirmOrderState(token: this.token, accounttype: this.accounttype);
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  // Function showResult;
  String? token;
  String? accounttype;
  _ConfirmOrderState({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _ConfirmOrderMobile(token: token, accounttype: accounttype),
          tablet: _ConfirmOrderTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _ConfirmOrderTablet extends StatefulWidget {
  //  final Function showResult;

  _ConfirmOrderTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __ConfirmOrderTabletState createState() => __ConfirmOrderTabletState();
}

class __ConfirmOrderTabletState extends State<_ConfirmOrderTablet> {
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
        title: Text("Confirm Order",
            style: TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        elevation: 0.2,
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
                          "oid6453",
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
                          "65",
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
                          "03/6/22",
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
                    // Navigator.of(context,rootNavigator: true).push(
                    //     MaterialPageRoute(
                    //         builder: (context) {
                    //   return Confirm();
                    // }));
                  },
                  child: Text(
                    'Confirm',
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

class _ConfirmOrderMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _ConfirmOrderMobile({Key? key, this.token, this.accounttype})
      : super(key: key);

  @override
  _ConfirmOrderMobileState createState() => _ConfirmOrderMobileState(
      token: this.token, accounttype: this.accounttype);
}

class _ConfirmOrderMobileState extends State<_ConfirmOrderMobile> {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _ConfirmOrderMobileState({this.token, this.accounttype});

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
        title: Text("Confirm Order",
            style: TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body:
          // BlocConsumer<P2pBloc, P2pState>(
          //   listener: (context, state) {
          // TODO: implement listener
          //  if (state is SuccessP2pState) {
          //   ScaffoldMessenger.of(context).showSnackBar((
          //     const SnackBar(
          //       duration: Duration(seconds: 2),
          //       content: Text(' succeess ', textScaleFactor: 1.5),
          //     ),
          //   );
          // } else if (state is ErrorP2pState) {
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
                          "oid6453",
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
                          "65",
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
                          "03/6/22",
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
      //  },
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
                    // Navigator.of(context,rootNavigator: true).push(
                    //     MaterialPageRoute(
                    //         builder: (context) {
                    //   return Confirm();
                    // }));
                  },
                  child: Text(
                    'Confirm',
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
