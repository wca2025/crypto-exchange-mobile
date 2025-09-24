import 'dart:ui';

import '../../data/models/coin.dart';
import '../pro/selectaccounts.dart';
import '../pro/selecttoken.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../businesslogic/blocs/auth/auth_bloc.dart';
import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import 'orders.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import '../../main.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';

class Repay extends StatefulWidget {
  String? token;
  String? repaymentaccount;
  Repay({Key? key, this.token, this.repaymentaccount}) : super(key: key);
  @override
  _RepayState createState() =>
      _RepayState(token: this.token, repaymentaccount: this.repaymentaccount);
}

class _RepayState extends State<Repay> {
  String? token;
  String? repaymentaccount;

  _RepayState({this.token, this.repaymentaccount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:
              _RepayMobile(token: token, repaymentaccount: repaymentaccount),
          tablet: _RepayTablet(),
        ),
      ),
    );
  }
}

class _RepayTablet extends StatefulWidget {
  _RepayTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __RepayTabletState createState() => __RepayTabletState();
}

class __RepayTabletState extends State<_RepayTablet> {
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
          title: Text("Repay",
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
                                  return SearchListRepay();
                                }));
                              },
                              child: TextField(
                                // controller: usernameController,
                                obscureText: false,

                                decoration: InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    enabled: false,
                                    labelText: 'Coin',
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return SearchListRepay();
                                        }));
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    )),
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
                                        labelText: 'Repayment Priority',
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              // return DetailPage(bean);
                                              return SearchListRepay();
                                            }));
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )))
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
                                  labelText: 'Available',
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
                                  // Navigator.of(context, rootNavigator: true)
                                  //     .push(
                                  //         MaterialPageRoute(builder: (context) {
                                  //   // return DetailPage(bean);
                                  //   // return SearchAccountsRepay();
                                  // }));
                                },
                                child: TextField(
                                  // controller: usernameController,
                                  obscureText: false,

                                  decoration: InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      enabled: false,
                                      labelText: 'Account type',
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .push(MaterialPageRoute(
                                                  builder: (context) {
                                            // return DetailPage(bean);
                                            return SearchListRepay();
                                          }));
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      )),
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

                      SizedBox(
                        height: screenWidth * 0.020,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
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
                            Text("Select Repayment Priority",
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
                                  "Ensure that the selected repayment priority is consistet with your   ",
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

class _RepayMobile extends StatefulWidget {
  String? token;
  String? repaymentaccount;

  _RepayMobile({Key? key, this.token, this.repaymentaccount}) : super(key: key);

  @override
  _RepayMobileState createState() => _RepayMobileState(
      token: this.token, repaymentaccount: this.repaymentaccount);
}

class _RepayMobileState extends State<_RepayMobile> {
  String? token;
  String? tokenlabel = 'Coin';
  String? repaymentaccount;

  _RepayMobileState({this.token, this.repaymentaccount});
  SlidingUpPanelController panelController1 = SlidingUpPanelController();
  SlidingUpPanelController panelController2 = SlidingUpPanelController();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  static const genderOptions = ['1', '2', '3'];
  late String setvalue = "";
  late String setvalue2 = "";

  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  String? repaymentpriority;
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
          title: Text("Repay",
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
            //   return
            ListView(
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
              child: FormBuilder(
                key: _formKey,
                skipDisabled: true,
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
                                  // Navigator.of(context, rootNavigator: true)
                                  //     .push(MaterialPageRoute(
                                  //         builder: (context) {
                                  //   // return DetailPage(bean);
                                  //   return SearchListRepay();
                                  // }));
                                },
                                child: FormBuilderTextField(
                                  name: 'coin',
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        // Navigator.of(context, rootNavigator: true)
                                        //     .push(MaterialPageRoute(builder: (context) {
                                        //   // return DetailPage(bean);
                                        //   return SearchListRepay();
                                        // }));
                                      },
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    labelStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                    labelText: token != null
                                        ? 'Coin:                                                                   ${token} '
                                        : null,
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
                                  child: FormBuilderTextField(
                                    name: 'repaymentpriority',
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
                                          'Repayment Priority:                                ' +
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
                                child: FormBuilderTextField(
                                  name: 'available',
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    labelStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                    labelText: "Available",
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
                                  onTap: () {
                                    // Navigator.of(context, rootNavigator: true)
                                    //     .push(MaterialPageRoute(
                                    //         builder: (context) {
                                    //   // return DetailPage(bean);
                                    //   // return SearchAccountsRepays();
                                    // }));
                                  },
                                  child: FormBuilderTextField(
                                    name: 'repaymentaccount',
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
                                          'RepaymentAccount:    ' + setvalue2,
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
                                  name: 'amount',
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    labelStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                    labelText: "Amount",
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
                        ]), //

                        SizedBox(
                          height: screenHeight * 0.030,
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
                                  color: theme.primaryColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: InkWell(
                                    onTap: () async {
                                      // Get textfield input value
                                      final validationSuccess =
                                          _formKey.currentState!.validate();

                                      if (validationSuccess) {
                                        //
                                        // Save only when validation passed
                                        _formKey.currentState!.save();
                                        //
                                        // Get form data
                                        final formData =
                                            _formKey.currentState!.value;
                                        final validationSuccess =
                                            _formKey.currentState!.validate();

                                        if (validationSuccess) {
                                          //
                                          // Save only when validation passed
                                          _formKey.currentState!.save();

                                          // Get form data
                                          final formData =
                                              _formKey.currentState!.value;

// context.read<TransactionBloc>().add(

//                                 RepayTransactionEvent(
//                                 repaymentpriority: _formKey.currentState!.fields['repaymentpriority']?.value,
// available: _formKey.currentState!.fields['available']?.value,
// repaymentaccount: _formKey.currentState!.fields['repaymentaccount']?.value,
//                              amount: _formKey.currentState!.fields['amount']?.value,

//                                 ),
//                               );
                                          // Reset form
                                          _formKey.currentState!.reset();
                                          // Optional: unfocus keyboard
                                          FocusScope.of(context).unfocus();
                                          // Optional: Show snackbar
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration: Duration(seconds: 2),
                                              content: Text(
                                                  'Validation succeeded -> Data: $formData',
                                                  textScaleFactor: 1.5),
                                            ),
                                          );
                                        } else {
                                          // Get form data
                                          final formData =
                                              _formKey.currentState!.value;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration: Duration(seconds: 2),
                                              content: Text(
                                                  'Validation failed! -> Data: $formData',
                                                  textScaleFactor: 1.5),
                                            ),
                                          );
                                        }

                                        // Optional: unfocus keyboard
                                        FocusScope.of(context)
                                            .unfocus(); // Reset form
                                        _formKey.currentState!.reset();
                                        // Optional: unfocus keyboard
                                        FocusScope.of(context).unfocus();
                                        // Optional: Show snackbar
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 2),
                                            content: Text(
                                                'Validation succeeded -> Data: $formData',
                                                textScaleFactor: 1.5),
                                          ),
                                        );
                                      } else {
                                        // Get form data
                                        final formData =
                                            _formKey.currentState!.value;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 2),
                                            content: Text(
                                                'Validation failed! -> Data: $formData',
                                                textScaleFactor: 1.5),
                                          ),
                                        );
                                      }

                                      // Optional: unfocus keyboard
                                      FocusScope.of(context).unfocus();
                                    },
                                    child: Center(
                                      child: Text(
                                        'Repay',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0 * textScale,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))
                        ]),

                        //   Container(
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
                      ]),
                ),
              ),
            ),
          ],
          //     );
          //   },
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
                            Text(
                                "For partial repayment the sytem will repay the ",
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
                                  "loans with the nearest maturity date first ",
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
                            Text("Rate Priority",
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
                        title: Row(
                          children: [
                            Text("",
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
                                  "Ensure that the selected repayment priority is consistet with your   ",
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
