import 'dart:ui';

import '../../data/models/coin.dart';
import '../pro/selectaccounts.dart';
import '../pro/selecttoken.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import 'orders.dart';
import 'selectaccountsdeposit.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import '../../main.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';

class Deposit extends StatefulWidget {
  String? token;
  String? accounttype;
  Deposit({Key? key, this.token, this.accounttype}) : super(key: key);
  @override
  _DepositState createState() =>
      _DepositState(token: this.token, accounttype: this.accounttype);
}

class _DepositState extends State<Deposit> {
  String? token;
  String? accounttype;

  _DepositState({this.token, this.accounttype});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _DepositMobile(token: token, accounttype: accounttype),
          tablet: _DepositTablet(),
        ),
      ),
    );
  }
}

class _DepositTablet extends StatefulWidget {
  _DepositTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __DepositTabletState createState() => __DepositTabletState();
}

class __DepositTabletState extends State<_DepositTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  // final _formKey = GlobalKey<FormBuilderState>();
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
  late ScrollController scrollController;

  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();

  ///The controller of sliding up panel
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.expand();
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.anchor();
      } else {}
    });
    super.initState();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
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
    // final _formKey = GlobalKey<FormBuilderState>();
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0.5,
          title: Text("Deposit",
              style:
                  TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
          actions: [
            Container(
                width: screenWidth * 0.40,
                height: screenHeight * 0.35,
                // color: Colors.grey[400],
                child: Row(
                  children: [
                    Container(
                      width: screenWidth * 0.250,
                      height: screenHeight * 0.35,
                      // color: Colors.grey[400],
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 18,
                      icon: const Icon(
                        Icons.history,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          // return DetailPage(bean);
                          return Order();
                        }));
                      },
                    ),
                  ],
                )),
          ],
        ),
        body: ListView(
          // controller: _controller,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: <Widget>[
            // Row(
            //   children: const [
            //     Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 50),
            //       child: Text(
            //         'Reset Password',
            //         textAlign: TextAlign.left,
            //         style: TextStyle(
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            // Row(
            //   children: const [
            //     Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 50),
            //       child: Text(
            //         '12scdvfa',
            //         textAlign: TextAlign.left,
            //         style: TextStyle(
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      Row(children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 1,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            color: theme.scaffoldBackgroundColor,
                            height: screenHeight * 0.060,
                            width: screenWidth * 0.55,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return SearchListDeposit();
                                }));
                              },
                              child: TextField(
                                // controller: usernameController,
                                obscureText: false,

                                decoration: InputDecoration(
                                  disabledBorder: InputBorder.none,
                                  enabled: false,
                                  labelText: 'Coin',
                                  suffixIcon: const Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                      ]),

                      // SizedBox(
                      //   height: screenHeight * 0.010,
                      // ),

                      SizedBox(
                        height: screenWidth * 0.020,
                      ),

                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 1,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              height: screenHeight * 0.055,
                              color: theme.scaffoldBackgroundColor,
                              width: screenWidth * 0.750,
                              child: InkWell(
                                onTap: () {
                                  if (SlidingUpPanelStatus.anchored ==
                                      panelController.status) {
                                    // panelController.hide();
                                    panelController.hide();
                                  } else {
                                    panelController.anchor();
                                  }
                                },
                                child: TextField(
                                  // controller: usernameController,
                                  obscureText: false,

                                  decoration: InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    enabled: false,
                                    labelText: 'Network',
                                    suffixIcon: const Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),

                      SizedBox(
                        height: screenWidth * 0.020,
                      ),

                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 1,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              height: screenHeight * 0.055,
                              color: theme.scaffoldBackgroundColor,
                              width: screenWidth * 0.750,
                              child: const TextField(
                                // controller: usernameController,
                                obscureText: false,

                                decoration: InputDecoration(
                                  disabledBorder: InputBorder.none,
                                  enabled: false,
                                  labelText: 'Memo',
                                  //                 suffixIcon: const Icon(
                                  //   Icons.keyboard_arrow_right,
                                  //   size: 20,
                                  //   color: Colors.black,
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),

                      SizedBox(
                        height: screenWidth * 0.020,
                      ),

                      // SizedBox(
                      //   height: screenHeight * 0.010,
                      // ),

                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 1,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              height: screenHeight * 0.055,
                              color: theme.scaffoldBackgroundColor,
                              width: screenWidth * 0.750,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    // return DetailPage(bean);
                                    return SearchAccountsDeposits();
                                  }));
                                },
                                child: TextField(
                                  // controller: usernameController,
                                  obscureText: false,

                                  decoration: InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    enabled: false,
                                    labelText: 'Account type',
                                    suffixIcon: const Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),

                      SizedBox(
                        height: screenWidth * 0.020,
                      ), //               Container(
                      //   height: screenHeight*0.030,
                      //   // color: Colors.grey,
                      //   child:  InkWell(
                      //     // onTap: ,
                      //     child: Center(child: Text('Forgot Password')),
                      //   ),
                      // ),

                      // Divider(
                      //   color: Colors.blueGrey[100],
                      //   height: 2,
                      //   thickness: 1,
                      //   indent: 0,
                      //   endIndent: 0,
                      // ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1),
                        child: Container(
                            color: theme.backgroundColor,
                            width: screenWidth * 1.2,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            // height: screenHeight * 0.350,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    "Wallet Address",
                                    style: TextStyle(color: theme.hoverColor),
                                    // onTap: _signUp,
                                  ),
                                ),
                                SizedBox(
                                  height: screenWidth * 0.015,
                                ),
                                Container(
                                  height: screenHeight * 0.200,
                                  width: screenWidth * 0.400,
                                  child: Card(
                                    // child: Text('DropdownSelect'),
                                    child: InkWell(
                                      onTap: () {},
                                      child: FadeInImage.assetNetwork(
                                        alignment:
                                            Alignment.topCenter, // add this
                                        placeholder: 'dummy image',
                                        image:
                                            'https://pngimg.com/uploads/qr_code/qr_code_PNG24.png',
                                        fit: BoxFit.fitWidth,
                                        height: screenHeight * 0.120,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    "1PTv13DZJPTgLpcSEGCb8zbZxTZZhuKKrj  ",
                                    style: TextStyle(color: theme.hoverColor),
                                    // onTap: _signUp,
                                  ),
                                ),
                                SizedBox(
                                  height: screenWidth * 0.065,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: GestureDetector(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: screenWidth * 0.750,
                                            height: screenHeight * 0.055,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              color: theme.primaryColor,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(1.0),
                                              child: InkWell(
                                                // onTap: _signUp,
                                                child: Center(
                                                  child: Text(
                                                    'Save Picture',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
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
                                          horizontal: 12,
                                        ),
                                        child: GestureDetector(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: screenWidth * 0.750,
                                            height: screenHeight * 0.055,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              color: theme.primaryColor,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(1.0),
                                              child: InkWell(
                                                // onTap: _signUp,
                                                child: Center(
                                                  child: Text(
                                                    'Copy Address',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                    ]),
                                SizedBox(
                                  height: screenWidth * 0.065,
                                ),
                              ],
                            )),
                      ),

                      SizedBox(
                        height: screenWidth * 0.020,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          // height: screenHeight * 0.150,
                          color: theme.scaffoldBackgroundColor,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: InkWell(
                              // onTap: _signUp,
                              child: Column(children: [
                                Center(
                                  child: Text(
                                    '-Important Notice: The minimunm withdrawal amount is 0.001BTC' +
                                        '',
                                    style: TextStyle(
                                      // ignore: deprecated_member_use
                                      color: theme.highlightColor,
                                      fontSize: 12 * textScale,
                                      // fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '- Please note that we processes withdrawal requests three times a day at 08:00 UTC 16:00UTC and 24:00 UTC hte cutoff time for withdrawal requests will be 30mins before the scheduled withdrawal processing time' +
                                        '' +
                                        '',
                                    style: TextStyle(
                                      // ignore: deprecated_member_use
                                      color: theme.highlightColor,
                                      fontSize: 12 * textScale,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '  - Withdrawals will be performed directly via the Spot Account' +
                                        '  Please manually trasnfer your funds to the Spot Account first' +
                                        '',
                                    style: TextStyle(
                                      color: theme.highlightColor,
                                      fontSize: 12 * textScale,
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
      SlidingUpPanelWidget(
        panelStatus: SlidingUpPanelStatus.hidden,
        child: Container(
          height: screenHeight * 0.0,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shadows: [
              BoxShadow(
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  color: const Color(0x11000000))
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      // Text(
                      //   'click or drag',
                      // )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: screenHeight * 0.02,
                ),
                // Divider(
                //   height: 0.5,
                //   color: Colors.grey[300],
                // ),
                Container(
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Select Network",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Column(children: [
                          Row(
                            children: [
                              Text(
                                  "Ensure that the selected network is consistet with your   ",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "method of withdrawal Otherwise you are aat risk of losing",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("your assets",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                        ]),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text("ETH",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text("Ethereum(ERC20)",
                                style: TextStyle(fontSize: 12 * textScale)),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text("cx",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text("cx Community Chain",
                                style: TextStyle(fontSize: 12 * textScale)),
                          ],
                        ),
                      ),
                    ],
                  )),
                  color: Colors.white,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
        ),
        controlHeight: screenHeight * 0.35,
        anchor: 0.35,
        panelController: panelController,
        onTap: () {
          ///Customize the processing logic
        },
        dragStart: (details) {
          panelController.collapse();
        },

        dragUpdate: (details) {
          panelController.collapse();
        },
        enableOnTap: false, //Enable the onTap callback for control bar.
      ),
    ]);
  }
}

class _DepositMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _DepositMobile({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _DepositMobileState createState() =>
      _DepositMobileState(token: this.token, accounttype: this.accounttype);
}

class _DepositMobileState extends State<_DepositMobile> {
  String? token;
  String? tokenlabel = 'Coin';
  String? accounttype;

  _DepositMobileState({this.token, this.accounttype});
  SlidingUpPanelController panelController1 = SlidingUpPanelController();
  SlidingUpPanelController panelController2 = SlidingUpPanelController();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  // final _formKey = GlobalKey<FormBuilderState>();
  static const genderOptions = ['1', '2', '3'];
  late String setvalue = "";
  late String setvalue2 = "";
  final ScrollController _controller = ScrollController();

  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  String? network;
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
  late ScrollController scrollController;

  ///The controller of sliding up panel

  ///The controller of sliding up panel
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController1.expand();
        panelController2.expand();
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController2.anchor();
        panelController2.anchor();
      } else {}
    });
    super.initState();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
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
    // final _formKey = GlobalKey<FormBuilderState>();
    final theme = Theme.of(context);

    final textScale = MediaQuery.of(context).textScaleFactor;
    return Stack(children: [
      Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0.5,
          title: Text("Deposit",
              style:
                  TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
          actions: [
            Container(
                width: screenWidth * 0.40,
                height: screenHeight * 0.35,
                // color: Colors.grey[400],
                child: Row(
                  children: [
                    Container(
                      width: screenWidth * 0.250,
                      height: screenHeight * 0.35,
                      // color: Colors.grey[400],
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 18,
                      icon: const Icon(
                        Icons.history,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          // return DetailPage(bean);
                          return Order();
                        }));
                      },
                    ),
                  ],
                )),
          ],
        ),
        body:
            // BlocConsumer<TransactionBloc, TransactionState>(
            //   listener: (context, state) {
            // TODO: implement listener
            //    if (state is _SuccessTransactionState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' succeess ', textScaleFactor: 1.5),
            //     ),
            //   );
            // } else if (state is _ErrorTransactionState) {
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
            ListView(
          controller: _controller,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: <Widget>[
            // Row(
            //   children: const [
            //     Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 50),
            //       child: Text(
            //         'Reset Password',
            //         textAlign: TextAlign.left,
            //         style: TextStyle(
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            // Row(
            //   children: const [
            //     Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 50),
            //       child: Text(
            //         '12scdvfa',
            //         textAlign: TextAlign.left,
            //         style: TextStyle(
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      Row(children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 1,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            color: theme.scaffoldBackgroundColor,
                            height: screenHeight * 0.060,
                            width: screenWidth * 0.55,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return SearchListDeposit();
                                }));
                              },
                              child: TextField(
                                // controller: usernameController,
                                obscureText: false,
                                readOnly: true,
                                decoration: InputDecoration(
                                  disabledBorder: InputBorder.none,
                                  enabled: false,
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                  labelText: token != null
                                      ? 'Coin:                                                                     ${token} '
                                      : null,
                                  suffixIcon: Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                      ]),

                      // SizedBox(
                      //   height: screenHeight * 0.010,
                      // ),

                      SizedBox(
                        height: screenWidth * 0.020,
                      ),

                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 1,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              height: screenHeight * 0.055,
                              color: theme.scaffoldBackgroundColor,
                              width: screenWidth * 0.750,
                              child: InkWell(
                                onTap: () {
                                  if (SlidingUpPanelStatus.anchored ==
                                      panelController1.status) {
                                    // panelController.hide();
                                    panelController1.hide();
                                  } else {
                                    panelController1.anchor();
                                  }
                                },
                                child: FormBuilderTextField(
                                  readOnly: true,
                                  name: 'network',
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        if (SlidingUpPanelStatus.anchored ==
                                            panelController1.status) {
                                          // panelController.hide();
                                          panelController1.hide();
                                        } else {
                                          panelController1.anchor();
                                        }
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    labelStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                    labelText:
                                        'Network:                                                           ' +
                                            setvalue,
                                    border: InputBorder.none,
                                    // prefix: const Text('Name: '),
                                    enabled: false,
                                    // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                    // errorText: _emailError,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),

                      SizedBox(
                        height: screenWidth * 0.020,
                      ),

                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 1,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              height: screenHeight * 0.055,
                              color: theme.scaffoldBackgroundColor,
                              width: screenWidth * 0.750,
                              child: FormBuilderTextField(
                                name: 'memo',
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                  labelText: "Memo",
                                  border: InputBorder.none,
                                  // prefix: const Text('Name: '),
                                  enabled: false,
                                  // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                  // errorText: _emailError,
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ]),

                      SizedBox(
                        height: screenWidth * 0.020,
                      ),

                      // SizedBox(
                      //   height: screenHeight * 0.010,
                      // ),

                      Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 1,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              height: screenHeight * 0.055,
                              color: theme.scaffoldBackgroundColor,
                              width: screenWidth * 0.750,
                              child: InkWell(
                                onTap: () {},
                                child: FormBuilderTextField(
                                  readOnly: true,
                                  name: 'accounttype',
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        if (SlidingUpPanelStatus.anchored ==
                                            panelController2.status) {
                                          // panelController.hide();
                                          panelController2.hide();
                                        } else {
                                          panelController2.anchor();
                                        }
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    labelStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                    labelText:
                                        'Accounttype:                                    ' +
                                            setvalue2,
                                    border: InputBorder.none,
                                    // prefix: const Text('Name: '),
                                    enabled: false,
                                    // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                    // errorText: _emailError,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                  ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),

                      SizedBox(
                        height: screenWidth * 0.020,
                      ), //               Container(
                      //   height: screenHeight*0.030,
                      //   // color: Colors.grey,
                      //   child:  InkWell(
                      //     // onTap: ,
                      //     child: Center(child: Text('Forgot Password')),
                      //   ),
                      // ),

                      // Divider(
                      //   color: Colors.blueGrey[100],
                      //   height: 2,
                      //   thickness: 1,
                      //   indent: 0,
                      //   endIndent: 0,
                      // ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1),
                        child: Container(
                            color: theme.backgroundColor,
                            width: screenWidth * 1.2,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            // height: screenHeight * 0.350,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    "Wallet Address",
                                    style: TextStyle(color: theme.hoverColor),
                                    // onTap: _signUp,
                                  ),
                                ),
                                SizedBox(
                                  height: screenWidth * 0.015,
                                ),
                                Container(
                                  height: screenHeight * 0.200,
                                  width: screenWidth * 0.400,
                                  child: Card(
                                    // child: Text('DropdownSelect'),
                                    child: InkWell(
                                      onTap: () {},
                                      child: FadeInImage.assetNetwork(
                                        alignment:
                                            Alignment.topCenter, // add this
                                        placeholder: 'dummy image',
                                        image:
                                            'https://pngimg.com/uploads/qr_code/qr_code_PNG24.png',
                                        fit: BoxFit.fitWidth,
                                        height: screenHeight * 0.120,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    "1PTv13DZJPTgLpcSEGCb8zbZxTZZhuKKrj  ",
                                    style: TextStyle(color: theme.hoverColor),
                                    // onTap: _signUp,
                                  ),
                                ),
                                SizedBox(
                                  height: screenWidth * 0.065,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                        child: GestureDetector(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: screenWidth * 0.750,
                                            height: screenHeight * 0.055,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              color: theme.primaryColor,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(1.0),
                                              child: InkWell(
                                                // onTap: _signUp,
                                                child: Center(
                                                  child: Text(
                                                    'Save Picture',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
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
                                          horizontal: 12,
                                        ),
                                        child: GestureDetector(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: screenWidth * 0.750,
                                            height: screenHeight * 0.055,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              color: theme.primaryColor,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(1.0),
                                              child: InkWell(
                                                // onTap: _signUp,
                                                child: Center(
                                                  child: Text(
                                                    'Copy Address',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                    ]),
                                SizedBox(
                                  height: screenWidth * 0.065,
                                ),
                              ],
                            )),
                      ),

                      SizedBox(
                        height: screenWidth * 0.020,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          // height: screenHeight * 0.150,
                          color: theme.scaffoldBackgroundColor,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: InkWell(
                              // onTap: _signUp,
                              child: Column(children: [
                                Center(
                                  child: Text(
                                    '-Important Notice: The minimunm withdrawal amount is 0.001BTC' +
                                        '',
                                    style: TextStyle(
                                      // ignore: deprecated_member_use
                                      color: theme.highlightColor,
                                      fontSize: 12 * textScale,
                                      // fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '- Please note that we processes withdrawal requests three times a day at 08:00 UTC 16:00UTC and 24:00 UTC hte cutoff time for withdrawal requests will be 30mins before the scheduled withdrawal processing time' +
                                        '' +
                                        '',
                                    style: TextStyle(
                                      // ignore: deprecated_member_use
                                      color: theme.highlightColor,
                                      fontSize: 12 * textScale,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '  - Withdrawals will be performed directly via the Spot Account' +
                                        '  Please manually trasnfer your funds to the Spot Account first' +
                                        '',
                                    style: TextStyle(
                                      color: theme.highlightColor,
                                      fontSize: 12 * textScale,
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
          // );
          // },
        ),
      ),
      SlidingUpPanelWidget(
        panelStatus: SlidingUpPanelStatus.hidden,
        child: Container(
          height: screenHeight * 0.0,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shadows: [
              const BoxShadow(
                  blurRadius: 5.0, spreadRadius: 2.0, color: Color(0x11000000))
            ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      // Text(
                      //   'click or drag',
                      // )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: screenHeight * 0.02,
                ),
                // Divider(
                //   height: 0.5,
                //   color: Colors.grey[300],
                // ),
                Container(
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Select Network",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Column(children: [
                          Row(
                            children: [
                              Text(
                                  "Ensure that the selected network is consistet with your   ",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "method of withdrawal Otherwise you are aat risk of losing",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("your assets",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                        ]),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            setvalue = 'ETH';
                          });
                        },
                        title: Row(
                          children: [
                            Text("ETH",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text("Ethereum(ERC20)",
                                style: TextStyle(fontSize: 12 * textScale)),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text("cx",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text("cx Community Chain",
                                style: TextStyle(fontSize: 12 * textScale)),
                          ],
                        ),
                      ),
                    ],
                  )),
                  color: Colors.white,
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ),
        controlHeight: screenHeight * 0.35,
        anchor: 0.35,
        panelController: panelController1,
        onTap: () {
          ///Customize the processing logic
        },
        dragStart: (details) {
          panelController1.collapse();
        },

        dragUpdate: (details) {
          panelController1.collapse();
        },
        enableOnTap: false, //Enable the onTap callback for control bar.
      ),
      SlidingUpPanelWidget(
        panelStatus: SlidingUpPanelStatus.hidden,
        child: Container(
          height: screenHeight * 0.0,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shadows: [
              const BoxShadow(
                  blurRadius: 5.0, spreadRadius: 2.0, color: Color(0x11000000))
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      // Text(
                      //   'click or drag',
                      // )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: screenHeight * 0.02,
                ),
                // Divider(
                //   height: 0.5,
                //   color: Colors.grey[300],
                // ),
                Container(
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Select Account",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Column(children: [
                          Row(
                            children: [
                              Text(
                                  "Ensure that the selected network is consistet with your   ",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "method of withdrawal Otherwise you are aat risk of losing",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("your assets",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                        ]),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            setvalue2 = 'Main Account';
                          });
                        },
                        title: Row(
                          children: [
                            Text('Main Account',
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text("",
                                style: TextStyle(fontSize: 12 * textScale)),
                          ],
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            setvalue2 = 'Margins Account';
                          });
                        },
                        title: Row(
                          children: [
                            Text('Margins Account',
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text('',
                                style: TextStyle(fontSize: 12 * textScale)),
                          ],
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            setvalue2 = 'Futures Account';
                          });
                        },
                        title: Row(
                          children: [
                            Text('Futures Account',
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text('',
                                style: TextStyle(fontSize: 12 * textScale)),
                          ],
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            setvalue2 = 'Margins Account';
                          });
                        },
                        title: Row(
                          children: [
                            Text('Earns Account',
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text('',
                                style: TextStyle(fontSize: 12 * textScale)),
                          ],
                        ),
                      ),
                    ],
                  )),
                  color: Colors.white,
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ),
        controlHeight: screenHeight * 0.35,
        anchor: 0.35,
        panelController: panelController2,
        onTap: () {
          ///Customize the processing logic
        },
        dragStart: (details) {
          panelController2.collapse();
        },

        dragUpdate: (details) {
          panelController2.collapse();
        },
        enableOnTap: false, //Enable the onTap callback for control bar.
      ),
    ]);
  }
}
