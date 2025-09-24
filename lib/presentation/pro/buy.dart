import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import 'p2pbuy.dart';
import 'selecttoken.dart';
import 'usercenter.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

import 'countrycode.dart';
import 'myads.dart';
import 'orders.dart';
import 'p2psell.dart';
import 'p2pMerchant.dart';
import 'add_payment_method.dart';
import 'paymentmethodlist.dart';
import 'travel_bean.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import '../../main.dart';


class FastTrade extends StatefulWidget {
  const FastTrade({Key? key}) : super(key: key);

  @override
  _FastTradeState createState() => _FastTradeState();
}

class _FastTradeState extends State<FastTrade> with TickerProviderStateMixin {
  List<TravelBean> _list = TravelBean.generateMostPopularBean();
  String? value;
  String text = '';
  late TabController _nestedTabController;

  late ScrollController scrollController;

  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();

  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);

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
  }

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final ScrollController _controller = ScrollController();
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];

  @override
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      Scaffold(
          backgroundColor: theme.backgroundColor,
          body:
              // BlocConsumer<TransactionBloc, TransactionState>(
              //     listener: (context, state) {
              // TODO: implement listener
              // if (state is _SuccessTransactionState) {
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
              // }, builder: (context, state) {
              //   return
              SingleChildScrollView(
                  child: Container(
                      color: theme.backgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            color: theme.scaffoldBackgroundColor,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TabBar(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.grey),
                                controller: _nestedTabController,
                                indicatorColor: Colors.white,
                                labelColor: Colors.black87,
                                automaticIndicatorColorAdjustment: true,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                isScrollable: true,
                                unselectedLabelColor: Colors.grey,
                                tabs: const <Widget>[
                                  Tab(
                                    child: Text(
                                      'Buy',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Sell',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: theme.backgroundColor,

                            height: screenHeight * 1.90,
                            // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: TabBarView(
                              controller: _nestedTabController,
                              children: <Widget>[
                                ListView(
                                  scrollDirection: Axis.vertical,
                                  controller: _controller,
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  children: <Widget>[
                                    Container(
                                      child: Container(
                                        child: SingleChildScrollView(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                AppBar(
                                                    elevation: 0,
                                                    backgroundColor:
                                                        theme.backgroundColor,
                                                    automaticallyImplyLeading:
                                                        false,
                                                    title: Row(children: [
                                                      InkWell(
                                                        onTap: () {
                                                          if (SlidingUpPanelStatus
                                                                  .anchored ==
                                                              panelController
                                                                  .status) {
                                                            // panelController.hide();
                                                            panelController
                                                                .hide();
                                                          } else {
                                                            panelController
                                                                .anchor();
                                                          }
                                                        },
                                                        child: Center(
                                                          child: Text(
                                                            "pay with",
                                                            style: TextStyle(
                                                                color: theme
                                                                    .hoverColor,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 70),
                                                      ),
                                                      Row(children: [
                                                        Text(
                                                          "Buy BTC",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20 *
                                                                  textScale,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Container(
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context,
                                                                      rootNavigator:
                                                                          true)
                                                                  .push(MaterialPageRoute(
                                                                      builder:
                                                                          (context) {
                                                                // return DetailPage(bean);
                                                                return SearchListBuy();
                                                              }));
                                                            },
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .caretDown,
                                                              color:
                                                                  Colors.black,
                                                              size: 17,
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                    ]),
                                                    actions: [
                                                      IconButton(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        iconSize: 18,
                                                        icon: const Icon(
                                                          Icons.history,
                                                          color: Colors.black87,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            // return DetailPage(bean);
                                                            return Order();
                                                          }));
                                                        },
                                                      ),
                                                    ]),
                                                SizedBox(
                                                  height: screenHeight * 0.050,
                                                ),
                                                Center(
                                                  child: Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontSize:
                                                            28 * textScale,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    "0.0000 USD Available",
                                                    style: TextStyle(
                                                        fontSize:
                                                            16 * textScale,
                                                        color:
                                                            theme.hoverColor),
                                                  ),
                                                ),
                                                Container(
                                                  child: NumericKeyboard(
                                                    onKeyboardTap:
                                                        _onKeyboardTap,
                                                    textColor: Colors.black,
                                                    rightButtonFn: () {
                                                      setState(() {
                                                        text = text.substring(
                                                            0, text.length - 1);
                                                      });
                                                    },
                                                    rightIcon: Icon(
                                                      Icons.backspace,
                                                      color: Colors.black,
                                                    ),
                                                    leftButtonFn: () {
                                                      print(
                                                          'left button clicked');
                                                    },
                                                    leftIcon: Icon(
                                                      Icons.check,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.030,
                                                ),
                                                Row(children: [
                                                  Expanded(
                                                      child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 32,
                                                    ),
                                                    child: GestureDetector(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width:
                                                            screenWidth * 0.750,
                                                        height: screenHeight *
                                                            0.055,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                          color: theme
                                                              .primaryColor,
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  1.0),
                                                          child: InkWell(
                                                            // onTap: _signUp,
                                                            child: Center(
                                                              child: Text(
                                                                ' Buy ',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ))
                                                ]),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ListView(
                                  scrollDirection: Axis.vertical,
                                  controller: _controller,
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  children: <Widget>[
                                    Container(
                                      child: Container(
                                        child: SingleChildScrollView(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                AppBar(
                                                    elevation: 0,
                                                    backgroundColor:
                                                        theme.backgroundColor,
                                                    automaticallyImplyLeading:
                                                        false,
                                                    title: Row(children: [
                                                      InkWell(
                                                        onTap: () {
                                                          if (SlidingUpPanelStatus
                                                                  .anchored ==
                                                              panelController
                                                                  .status) {
                                                            // panelController.hide();
                                                            panelController
                                                                .hide();
                                                          } else {
                                                            panelController
                                                                .anchor();
                                                          }
                                                        },
                                                        child: Center(
                                                          child: Text(
                                                            "pay with",
                                                            style: TextStyle(
                                                                color: theme
                                                                    .hoverColor,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 70),
                                                      ),
                                                      Row(children: [
                                                        Text(
                                                          "Sell BTC",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20 *
                                                                  textScale,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Container(
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context,
                                                                      rootNavigator:
                                                                          true)
                                                                  .push(MaterialPageRoute(
                                                                      builder:
                                                                          (context) {
                                                                // return DetailPage(bean);
                                                                return SearchListBuy();
                                                              }));
                                                            },
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .caretDown,
                                                              color:
                                                                  Colors.black,
                                                              size: 17,
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                    ]),
                                                    actions: [
                                                      IconButton(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        iconSize: 18,
                                                        icon: const Icon(
                                                          Icons.history,
                                                          color: Colors.black87,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            // return DetailPage(bean);
                                                            return Order();
                                                          }));
                                                        },
                                                      ),
                                                    ]),
                                                SizedBox(
                                                  height: screenHeight * 0.050,
                                                ),
                                                Center(
                                                  child: Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontSize:
                                                            28 * textScale,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    "0.0000 USD Available",
                                                    style: TextStyle(
                                                        fontSize:
                                                            16 * textScale,
                                                        color:
                                                            theme.hoverColor),
                                                  ),
                                                ),
                                                Container(
                                                  child: NumericKeyboard(
                                                    onKeyboardTap:
                                                        _onKeyboardTap,
                                                    textColor: Colors.black,
                                                    rightButtonFn: () {
                                                      setState(() {
                                                        text = text.substring(
                                                            0, text.length - 1);
                                                      });
                                                    },
                                                    rightIcon: Icon(
                                                      Icons.backspace,
                                                      color: Colors.black,
                                                    ),
                                                    leftButtonFn: () {
                                                      print(
                                                          'left button clicked');
                                                    },
                                                    leftIcon: Icon(
                                                      Icons.check,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.030,
                                                ),
                                                Row(children: [
                                                  Expanded(
                                                      child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 32,
                                                    ),
                                                    child: GestureDetector(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width:
                                                            screenWidth * 0.750,
                                                        height: screenHeight *
                                                            0.055,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                          color: theme
                                                              .primaryColor,
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  1.0),
                                                          child: InkWell(
                                                            // onTap: _signUp,
                                                            child: Center(
                                                              child: Text(
                                                                ' Sell ',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ))
                                                ]),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ))

                  // }
                  )),
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
                            Text("Select Payment Method",
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
                            Text("Bank Transfer",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text("Mtn Mtn Mobile Money ",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text("Flutterwave ",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
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

class P2P extends StatefulWidget {
  const P2P({Key? key}) : super(key: key);

  @override
  _P2PState createState() => _P2PState();
}

class _P2PState extends State<P2P> with TickerProviderStateMixin {
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  late TabController _nestedTabController;
  late TabController _nestedTabController2;

  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    _nestedTabController2 = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final ScrollController _controller = ScrollController();
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  @override
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

  _showSimpleModalDialog10(context) {
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
              constraints: const BoxConstraints(maxHeight: 400),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Text('Note',
                              style: (TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
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
                          'The advertiser has set the following requirements and you must fufill them first to place an roder on this ad.'),
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
                          child: Text('1.45%',
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
                          child: Text('1.45%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14 * textScale,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                    ListTile(
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
                          child: Text('1.45%',
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

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AppBar(
                    elevation: 0.0,
                    backgroundColor: theme.scaffoldBackgroundColor,
                    automaticallyImplyLeading: false,
                    title: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                            overlayColor:
                                MaterialStateProperty.all<Color>(Colors.grey),
                            controller: _nestedTabController,
                            indicatorColor: Colors.white,
                            labelColor: Colors.black87,
                            automaticIndicatorColorAdjustment: true,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            isScrollable: true,
                            unselectedLabelColor: Colors.grey,
                            tabs: const <Widget>[
                              Tab(
                                child: Text(
                                  "Buy",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Sell",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ])),
                    actions: [
                      PopupMenuButton<int>(
                        constraints: BoxConstraints(
                          minWidth: screenWidth * 0.030 * screenWidth * 0.030,
                          maxWidth: screenWidth * 0.030 * screenWidth * 0.030,
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          size: 20,
                          color: Colors.black,
                        ),
                        // iconSize: 20,
                        color: theme.scaffoldBackgroundColor,
                        itemBuilder: (context) => [
                          PopupMenuItem<int>(
                            value: 0,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Order();
                                }));
                              },
                              child: Text("Orders"),
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return MyAds();
                                }));
                              },
                              child: Text("Ads"),
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return PaymentMethodList();
                                }));
                              },
                              child: Text("Payment Methods"),
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Usercenter();
                                }));
                              },
                              child: Text("User Center"),
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return P2pMerchant();
                                }));
                              },
                              child: Text("Apply as Merchant"),
                            ),
                          ),
                        ],
                        onSelected: (item) => SelectedItem(context, item),
                      ),
                    ],
                  ),
                  Container(
                      color: theme.backgroundColor,
                      height: screenHeight * 0.96,
                      // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child:
                          //  BlocConsumer<TransactionBloc, TransactionState>(
                          //   listener: (context, state) {
                          // TODO: implement listener

                          //                 if (state is _SuccessTransactionState) {
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
                          TabBarView(
                        controller: _nestedTabController,
                        children: <Widget>[
                          Scaffold(
                            backgroundColor: theme.backgroundColor,
                            appBar: AppBar(
                              elevation: 0,
                              backgroundColor: theme.backgroundColor,
                              automaticallyImplyLeading: false,
                              title: Align(
                                  alignment: Alignment.centerLeft,
                                  child: TabBar(
                                      automaticIndicatorColorAdjustment: true,
                                      // indicatorWeight:1.0,
                                      controller: _nestedTabController2,
                                      indicatorColor: Colors.grey[400],
                                      labelColor: Colors.teal,
                                      unselectedLabelColor: Colors.black54,
                                      isScrollable: true,
                                      tabs: <Widget>[
                                        Tab(
                                          text: "BTC",
                                        ),
                                        Tab(text: "ETH"),
                                        Tab(
                                          text: "USDT",
                                        ),
                                        Tab(text: "SHIBA"),
                                      ])),
                              actions: [],
                            ),
                            body: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              scrollDirection: Axis.vertical,
                              child: Column(children: [
                                Container(
                                  height: screenHeight * 0.060,
                                  color: theme.backgroundColor,
                                  child: ListTile(
                                      title: Row(
                                        children: [
                                          Text("Amount",
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500,
                                              )),
                                        ],
                                      ),
                                      trailing: Text(
                                          "Payment Method                  Filter",
                                          style: TextStyle(
                                            fontSize: 12 * textScale,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                          ))),
                                ),
                                Container(
                                  //  color:theme.backgroundColor,
                                  height: screenHeight * 0.82,
                                  // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                                  child: Container(
                                      height: screenHeight * 1.0,
                                      child:
                                          //            (state is _ErrorP2PState)
                                          // ?

                                          //         Container(
                                          //             color: theme.backgroundColor,
                                          //             child: Column(
                                          //               mainAxisAlignment: MainAxisAlignment.center,
                                          //               crossAxisAlignment: CrossAxisAlignment.center,
                                          //               children: [
                                          //                 // const SizedBox(height: 0.50),
                                          //                 Center(
                                          //                   child: Text(
                                          //                     "Network Error ",
                                          //                     style: TextStyle(
                                          //                         fontSize: 14 * textScale,
                                          //                         fontWeight: FontWeight.w500,
                                          //                         color: Colors.black38),
                                          //                   ),
                                          //                 ),
                                          //                 Center(
                                          //                   child: Text(
                                          //                     "Please refresh the page and try again",
                                          //                     style: TextStyle(
                                          //                         fontSize: 12 * textScale,
                                          //                         fontWeight: FontWeight.w500,
                                          //                         color: Colors.black38),
                                          //                   ),
                                          //                 ),
                                          //                 SizedBox(
                                          //                   height: screenHeight * 0.01,
                                          //                 ),
                                          //                 Row(
                                          //                   children: [
                                          //                     // const Padding(
                                          //                     // padding: EdgeInsets.only(
                                          //                     //   left: 10,
                                          //                     // ),
                                          //                     // ),
                                          //                     const Padding(
                                          //                       padding: EdgeInsets.only(
                                          //                         left: 50,
                                          //                       ),
                                          //                     ),
                                          //                     Expanded(
                                          //                       child: Container(
                                          //                           child: Center(
                                          //                               child: SizedBox(
                                          //                                   width: screenWidth * 0.25,
                                          //                                   child: TextButton(
                                          //                                     style: ButtonStyle(
                                          //                                         backgroundColor:
                                          //                                             MaterialStateProperty
                                          //                                                 .all<Color>(
                                          //                                       const Color(0xFFf5f7fa),
                                          //                                     )),
                                          //                                     onPressed: () {
                                          //                                       // Navigator.of(context,
                                          //                                       //         rootNavigator:
                                          //                                       //             true)
                                          //                                       //     .push(MaterialPageRoute(
                                          //                                       //         builder:
                                          //                                       //             (context) {
                                          //                                       //   return Buy();
                                          //                                       // }));
                                          //                                     },
                                          //                                     child: Text(
                                          //                                       'Refresh',
                                          //                                       style: TextStyle(
                                          //                                           fontSize:
                                          //                                               14 * textScale,
                                          //                                           fontWeight:
                                          //                                               FontWeight.w600,
                                          //                                           color:
                                          //                                               Colors.black),
                                          //                                     ),
                                          //                                   )))),
                                          //                     ),
                                          //                     // const Padding(
                                          //                     //   padding: EdgeInsets.only(
                                          //                     //     left: 4,
                                          //                     //   ),
                                          //                     // ),

                                          //                     const Padding(
                                          //                       padding: EdgeInsets.only(
                                          //                         left: 50,
                                          //                       ),
                                          //                     ),
                                          //                   ],
                                          //                 )

                                          //               ],
                                          //             )

                                          //
                                          // :

                                          TabBarView(
                                              controller: _nestedTabController2,
                                              children: <Widget>[
                                            ListView.builder(
                                              controller: _controller,
                                              physics: const BouncingScrollPhysics(
                                                  parent:
                                                      AlwaysScrollableScrollPhysics()),
                                              scrollDirection: Axis.vertical,
                                              itemCount: 8,
                                              // itemCount: state.p2p.length,
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              itemBuilder: (context, index) {
                                                var bean = _list[index];
                                                return Container(
                                                  color: Colors.white70,
                                                  // width: screenWidth * 0.880,
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Navigator.of(context,rootNavigator: true)
                                                      //     .push(MaterialPageRoute(builder: (context) {
                                                      //   // return DetailPage(bean);
                                                      //   return NftDetailsPage();
                                                      // }));
                                                    },
                                                    child: Column(children: [
                                                      ListTile(
                                                        isThreeLine: true,
                                                        title: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text("User:"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4)),
                                                                  Text("lorem"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4))
                                                                  // Expanded(child: Container(width: screenWidth * 0.08)),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  // Row(children: [
                                                                  //   Text("data"),   Text("data")
                                                                  // ],),
                                                                ],
                                                              )
                                                              // Expanded(child: Container(width: screenWidth * 0.08)),
                                                            ],
                                                          ),
                                                        ),
                                                        subtitle: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Price:",
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "324",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Quantity:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "34",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Transaction Limits:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "23",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Orders:18,",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Text(
                                                                      " 50%",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                            // Expanded(child: Container(width: screenWidth * 0.08)),
                                                          ],
                                                        ),
                                                        trailing: Container(
                                                          height: screenHeight *
                                                              0.040,
                                                          width: screenWidth *
                                                              0.180,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3.0),
                                                            color: theme
                                                                .primaryColor,
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                  return _showSimpleModalDialog10(
                                                                      context);
                                                                }));
                                                              },
                                                              child: Text(
                                                                "Buy",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ),
                                                );
                                              },
                                            ),
                                            ListView.builder(
                                              controller: _controller,
                                              physics: const BouncingScrollPhysics(
                                                  parent:
                                                      AlwaysScrollableScrollPhysics()),
                                              scrollDirection: Axis.vertical,
                                              itemCount: 8,
                                              // itemCount: state.p2p.length,
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              itemBuilder: (context, index) {
                                                var bean = _list[index];
                                                return Container(
                                                  color: Colors.white70,
                                                  // width: screenWidth * 0.880,
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Navigator.of(context,rootNavigator: true)
                                                      //     .push(MaterialPageRoute(builder: (context) {
                                                      //   // return DetailPage(bean);
                                                      //   return NftDetailsPage();
                                                      // }));
                                                    },
                                                    child: Column(children: [
                                                      ListTile(
                                                        isThreeLine: true,
                                                        title: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text("User:"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4)),
                                                                  Text("lorem"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4))
                                                                  // Expanded(child: Container(width: screenWidth * 0.08)),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  // Row(children: [
                                                                  //   Text("data"),   Text("data")
                                                                  // ],),
                                                                ],
                                                              )
                                                              // Expanded(child: Container(width: screenWidth * 0.08)),
                                                            ],
                                                          ),
                                                        ),
                                                        subtitle: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Price:",
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "324",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Quantity:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "34",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Transaction Limits:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "23",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Orders:18,",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Text(
                                                                      " 50%",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                            // Expanded(child: Container(width: screenWidth * 0.08)),
                                                          ],
                                                        ),
                                                        trailing: Container(
                                                          height: screenHeight *
                                                              0.040,
                                                          width: screenWidth *
                                                              0.180,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3.0),
                                                            color: theme
                                                                .primaryColor,
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                  // return DetailPage(bean);
                                                                  return P2pbuy();
                                                                }));
                                                              },
                                                              child: Text(
                                                                "Buy",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ),
                                                );
                                              },
                                            ),
                                            ListView.builder(
                                              controller: _controller,
                                              physics: const BouncingScrollPhysics(
                                                  parent:
                                                      AlwaysScrollableScrollPhysics()),
                                              scrollDirection: Axis.vertical,
                                              itemCount: 8,
                                              // itemCount: state.p2p.length,
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              itemBuilder: (context, index) {
                                                var bean = _list[index];
                                                return Container(
                                                  color: Colors.white70,
                                                  // width: screenWidth * 0.880,
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Navigator.of(context,rootNavigator: true)
                                                      //     .push(MaterialPageRoute(builder: (context) {
                                                      //   // return DetailPage(bean);
                                                      //   return NftDetailsPage();
                                                      // }));
                                                    },
                                                    child: Column(children: [
                                                      ListTile(
                                                        isThreeLine: true,
                                                        title: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text("User:"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4)),
                                                                  Text("lorem"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4))
                                                                  // Expanded(child: Container(width: screenWidth * 0.08)),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  // Row(children: [
                                                                  //   Text("data"),   Text("data")
                                                                  // ],),
                                                                ],
                                                              )
                                                              // Expanded(child: Container(width: screenWidth * 0.08)),
                                                            ],
                                                          ),
                                                        ),
                                                        subtitle: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Price:",
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "324",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Quantity:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "34",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Transaction Limits:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "23",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Orders:18,",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Text(
                                                                      " 50%",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                            // Expanded(child: Container(width: screenWidth * 0.08)),
                                                          ],
                                                        ),
                                                        trailing: Container(
                                                          height: screenHeight *
                                                              0.040,
                                                          width: screenWidth *
                                                              0.180,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3.0),
                                                            color: theme
                                                                .primaryColor,
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                  // return DetailPage(bean);
                                                                  return P2pbuy();
                                                                }));
                                                              },
                                                              child: Text(
                                                                "Buy",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ),
                                                );
                                              },
                                            ),
                                            ListView.builder(
                                              controller: _controller,
                                              physics: const BouncingScrollPhysics(
                                                  parent:
                                                      AlwaysScrollableScrollPhysics()),
                                              scrollDirection: Axis.vertical,
                                              itemCount: 8,
                                              // itemCount: state.p2p.length,
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              itemBuilder: (context, index) {
                                                var bean = _list[index];
                                                return Container(
                                                  color: Colors.white70,
                                                  // width: screenWidth * 0.880,
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Navigator.of(context,rootNavigator: true)
                                                      //     .push(MaterialPageRoute(builder: (context) {
                                                      //   // return DetailPage(bean);
                                                      //   return NftDetailsPage();
                                                      // }));
                                                    },
                                                    child: Column(children: [
                                                      ListTile(
                                                        isThreeLine: true,
                                                        title: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text("User:"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4)),
                                                                  Text("lorem"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4))
                                                                  // Expanded(child: Container(width: screenWidth * 0.08)),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  // Row(children: [
                                                                  //   Text("data"),   Text("data")
                                                                  // ],),
                                                                ],
                                                              )
                                                              // Expanded(child: Container(width: screenWidth * 0.08)),
                                                            ],
                                                          ),
                                                        ),
                                                        subtitle: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Price:",
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "324",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Quantity:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "34",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Transaction Limits:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "23",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Orders:18,",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Text(
                                                                      " 50%",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                            // Expanded(child: Container(width: screenWidth * 0.08)),
                                                          ],
                                                        ),
                                                        trailing: Container(
                                                          height: screenHeight *
                                                              0.040,
                                                          width: screenWidth *
                                                              0.180,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3.0),
                                                            color: theme
                                                                .primaryColor,
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                  // return DetailPage(bean);
                                                                  return P2pbuy();
                                                                }));
                                                              },
                                                              child: Text(
                                                                "Buy",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ),
                                                );
                                              },
                                            ),
                                          ])),
                                ),
                              ]),
                            ),
                          ),
                          Scaffold(
                            backgroundColor: theme.backgroundColor,
                            appBar: AppBar(
                              elevation: 0,
                              backgroundColor: theme.backgroundColor,
                              automaticallyImplyLeading: false,
                              title: Align(
                                  alignment: Alignment.centerLeft,
                                  child: TabBar(
                                      automaticIndicatorColorAdjustment: true,
                                      // indicatorWeight:1.0,
                                      controller: _nestedTabController2,
                                      indicatorColor: Colors.grey[400],
                                      labelColor: Colors.teal,
                                      unselectedLabelColor: Colors.black54,
                                      isScrollable: true,
                                      tabs: <Widget>[
                                        Tab(
                                          text: "BTC",
                                        ),
                                        Tab(text: "ETH"),
                                        Tab(
                                          text: "USDT",
                                        ),
                                        Tab(text: "SHIBA"),
                                      ])),
                              actions: [],
                            ),
                            body: SingleChildScrollView(
                                child: Column(children: [
                              Container(
                                height: screenHeight * 0.060,
                                color: theme.backgroundColor,
                                child: ListTile(
                                    title: Row(
                                      children: [
                                        Text("Amount",
                                            style: TextStyle(
                                              fontSize: 12 * textScale,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ],
                                    ),
                                    trailing: Text(
                                        "Payment Method                       Action",
                                        style: TextStyle(
                                          fontSize: 12 * textScale,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                        ))),
                              ),
                              Container(
                                  height: screenHeight * 1.90,
                                  // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                                  child: Container(
                                      height: screenHeight * 1.0,
                                      child:
                                          //            (state is _ErrorP2PState)
                                          // ?

                                          //         Container(
                                          //             color: theme.backgroundColor,
                                          //             child: Column(
                                          //               mainAxisAlignment: MainAxisAlignment.center,
                                          //               crossAxisAlignment: CrossAxisAlignment.center,
                                          //               children: [
                                          //                 // const SizedBox(height: 0.50),
                                          //                 Center(
                                          //                   child: Text(
                                          //                     "Network Error ",
                                          //                     style: TextStyle(
                                          //                         fontSize: 14 * textScale,
                                          //                         fontWeight: FontWeight.w500,
                                          //                         color: Colors.black38),
                                          //                   ),
                                          //                 ),
                                          //                 Center(
                                          //                   child: Text(
                                          //                     "Please refresh the page and try again",
                                          //                     style: TextStyle(
                                          //                         fontSize: 12 * textScale,
                                          //                         fontWeight: FontWeight.w500,
                                          //                         color: Colors.black38),
                                          //                   ),
                                          //                 ),
                                          //                 SizedBox(
                                          //                   height: screenHeight * 0.01,
                                          //                 ),
                                          //                 Row(
                                          //                   children: [
                                          //                     // const Padding(
                                          //                     // padding: EdgeInsets.only(
                                          //                     //   left: 10,
                                          //                     // ),
                                          //                     // ),
                                          //                     const Padding(
                                          //                       padding: EdgeInsets.only(
                                          //                         left: 50,
                                          //                       ),
                                          //                     ),
                                          //                     Expanded(
                                          //                       child: Container(
                                          //                           child: Center(
                                          //                               child: SizedBox(
                                          //                                   width: screenWidth * 0.25,
                                          //                                   child: TextButton(
                                          //                                     style: ButtonStyle(
                                          //                                         backgroundColor:
                                          //                                             MaterialStateProperty
                                          //                                                 .all<Color>(
                                          //                                       const Color(0xFFf5f7fa),
                                          //                                     )),
                                          //                                     onPressed: () {
                                          //                                       // Navigator.of(context,
                                          //                                       //         rootNavigator:
                                          //                                       //             true)
                                          //                                       //     .push(MaterialPageRoute(
                                          //                                       //         builder:
                                          //                                       //             (context) {
                                          //                                       //   return Buy();
                                          //                                       // }));
                                          //                                     },
                                          //                                     child: Text(
                                          //                                       'Refresh',
                                          //                                       style: TextStyle(
                                          //                                           fontSize:
                                          //                                               14 * textScale,
                                          //                                           fontWeight:
                                          //                                               FontWeight.w600,
                                          //                                           color:
                                          //                                               Colors.black),
                                          //                                     ),
                                          //                                   )))),
                                          //                     ),
                                          //                     // const Padding(
                                          //                     //   padding: EdgeInsets.only(
                                          //                     //     left: 4,
                                          //                     //   ),
                                          //                     // ),

                                          //                     const Padding(
                                          //                       padding: EdgeInsets.only(
                                          //                         left: 50,
                                          //                       ),
                                          //                     ),
                                          //                   ],
                                          //                 )

                                          //               ],
                                          //             )

                                          //
                                          // :

                                          TabBarView(
                                              controller: _nestedTabController2,
                                              children: <Widget>[
                                            ListView.builder(
                                              controller: _controller,
                                              physics: const BouncingScrollPhysics(
                                                  parent:
                                                      AlwaysScrollableScrollPhysics()),
                                              scrollDirection: Axis.vertical,
                                              itemCount: 8,
                                              // itemCount: state.p2p.length,
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              itemBuilder: (context, index) {
                                                var bean = _list[index];
                                                return Container(
                                                  color: Colors.white70,
                                                  // width: screenWidth * 0.880,
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Navigator.of(context,rootNavigator: true)
                                                      //     .push(MaterialPageRoute(builder: (context) {
                                                      //   // return DetailPage(bean);
                                                      //   return NftDetailsPage();
                                                      // }));
                                                    },
                                                    child: Column(children: [
                                                      ListTile(
                                                        isThreeLine: true,
                                                        title: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text("User:"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4)),
                                                                  Text("lorem"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4))
                                                                  // Expanded(child: Container(width: screenWidth * 0.08)),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  // Row(children: [
                                                                  //   Text("data"),   Text("data")
                                                                  // ],),
                                                                ],
                                                              )
                                                              // Expanded(child: Container(width: screenWidth * 0.08)),
                                                            ],
                                                          ),
                                                        ),
                                                        subtitle: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Price:",
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "324",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Quantity:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "34",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Transaction Limits:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "23",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Orders:18,",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Text(
                                                                      " 50%",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                            // Expanded(child: Container(width: screenWidth * 0.08)),
                                                          ],
                                                        ),
                                                        trailing: Container(
                                                          height: screenHeight *
                                                              0.040,
                                                          width: screenWidth *
                                                              0.180,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3.0),
                                                            color: Color(
                                                                0xFFe84256),
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context,
                                                                        rootNavigator:
                                                                            true)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                  // return DetailPage(bean);
                                                                  return P2psell();
                                                                }));
                                                              },
                                                              child: Text(
                                                                "Sell",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ),
                                                );
                                              },
                                            ),
                                            ListView.builder(
                                              controller: _controller,
                                              physics: const BouncingScrollPhysics(
                                                  parent:
                                                      AlwaysScrollableScrollPhysics()),
                                              scrollDirection: Axis.vertical,
                                              itemCount: 8,
                                              // itemCount: state.p2p.length,
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              itemBuilder: (context, index) {
                                                var bean = _list[index];
                                                return Container(
                                                  color: Colors.white70,
                                                  // width: screenWidth * 0.880,
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Navigator.of(context,rootNavigator: true)
                                                      //     .push(MaterialPageRoute(builder: (context) {
                                                      //   // return DetailPage(bean);
                                                      //   return NftDetailsPage();
                                                      // }));
                                                    },
                                                    child: Column(children: [
                                                      ListTile(
                                                        isThreeLine: true,
                                                        title: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text("User:"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4)),
                                                                  Text("lorem"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4))
                                                                  // Expanded(child: Container(width: screenWidth * 0.08)),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  // Row(children: [
                                                                  //   Text("data"),   Text("data")
                                                                  // ],),
                                                                ],
                                                              )
                                                              // Expanded(child: Container(width: screenWidth * 0.08)),
                                                            ],
                                                          ),
                                                        ),
                                                        subtitle: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Price:",
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "324",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Quantity:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "34",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Transaction Limits:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "23",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Orders:18,",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Text(
                                                                      " 50%",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                            // Expanded(child: Container(width: screenWidth * 0.08)),
                                                          ],
                                                        ),
                                                        trailing: Container(
                                                          height: screenHeight *
                                                              0.040,
                                                          width: screenWidth *
                                                              0.180,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3.0),
                                                            color: Color(
                                                                0xFFe84256),
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context,
                                                                        rootNavigator:
                                                                            true)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                  // return DetailPage(bean);
                                                                  return P2psell();
                                                                }));
                                                              },
                                                              child: Text(
                                                                "Sell",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ),
                                                );
                                              },
                                            ),
                                            ListView.builder(
                                              controller: _controller,
                                              physics: const BouncingScrollPhysics(
                                                  parent:
                                                      AlwaysScrollableScrollPhysics()),
                                              scrollDirection: Axis.vertical,
                                              itemCount: 8,
                                              // itemCount: state.p2p.length,
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              itemBuilder: (context, index) {
                                                var bean = _list[index];
                                                return Container(
                                                  color: Colors.white70,
                                                  // width: screenWidth * 0.880,
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Navigator.of(context,rootNavigator: true)
                                                      //     .push(MaterialPageRoute(builder: (context) {
                                                      //   // return DetailPage(bean);
                                                      //   return NftDetailsPage();
                                                      // }));
                                                    },
                                                    child: Column(children: [
                                                      ListTile(
                                                        isThreeLine: true,
                                                        title: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text("User:"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4)),
                                                                  Text("lorem"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4))
                                                                  // Expanded(child: Container(width: screenWidth * 0.08)),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  // Row(children: [
                                                                  //   Text("data"),   Text("data")
                                                                  // ],),
                                                                ],
                                                              )
                                                              // Expanded(child: Container(width: screenWidth * 0.08)),
                                                            ],
                                                          ),
                                                        ),
                                                        subtitle: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Price:",
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "324",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Quantity:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "34",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Transaction Limits:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "23",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Orders:18,",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Text(
                                                                      " 50%",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                            // Expanded(child: Container(width: screenWidth * 0.08)),
                                                          ],
                                                        ),
                                                        trailing: Container(
                                                          height: screenHeight *
                                                              0.040,
                                                          width: screenWidth *
                                                              0.180,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3.0),
                                                            color: Color(
                                                                0xFFe84256),
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context,
                                                                        rootNavigator:
                                                                            true)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                  // return DetailPage(bean);
                                                                  return P2psell();
                                                                }));
                                                              },
                                                              child: Text(
                                                                "Sell",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ),
                                                );
                                              },
                                            ),
                                            ListView.builder(
                                              controller: _controller,
                                              physics: const BouncingScrollPhysics(
                                                  parent:
                                                      AlwaysScrollableScrollPhysics()),
                                              scrollDirection: Axis.vertical,
                                              itemCount: 8,
                                              // itemCount: state.p2p.length,
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              itemBuilder: (context, index) {
                                                var bean = _list[index];
                                                return Container(
                                                  color: Colors.white70,
                                                  // width: screenWidth * 0.880,
                                                  child: InkWell(
                                                    onTap: () {
                                                      // Navigator.of(context,rootNavigator: true)
                                                      //     .push(MaterialPageRoute(builder: (context) {
                                                      //   // return DetailPage(bean);
                                                      //   return NftDetailsPage();
                                                      // }));
                                                    },
                                                    child: Column(children: [
                                                      ListTile(
                                                        isThreeLine: true,
                                                        title: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text("User:"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4)),
                                                                  Text("lorem"),
                                                                  Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              4))
                                                                  // Expanded(child: Container(width: screenWidth * 0.08)),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  // Row(children: [
                                                                  //   Text("data"),   Text("data")
                                                                  // ],),
                                                                ],
                                                              )
                                                              // Expanded(child: Container(width: screenWidth * 0.08)),
                                                            ],
                                                          ),
                                                        ),
                                                        subtitle: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Price:",
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "324",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Quantity:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "34",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    "Transaction Limits:"),
                                                                Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            4)),
                                                                Text(
                                                                  "23",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                4))
                                                                // Expanded(child: Container(width: screenWidth * 0.08)),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Orders:18,",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Text(
                                                                      " 50%",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                            // Expanded(child: Container(width: screenWidth * 0.08)),
                                                          ],
                                                        ),
                                                        trailing: Container(
                                                          height: screenHeight *
                                                              0.040,
                                                          width: screenWidth *
                                                              0.180,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3.0),
                                                            color: Color(
                                                                0xFFe84256),
                                                          ),
                                                          child: Center(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context,
                                                                        rootNavigator:
                                                                            true)
                                                                    .push(MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                  // return DetailPage(bean);
                                                                  return P2psell();
                                                                }));
                                                              },
                                                              child: Text(
                                                                "Sell",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ),
                                                );
                                              },
                                            ),
                                          ])))
                            ])),
                          )
                        ],
                      )

                      //   },
                      // ),
                      )
                ],
              ))),
    );
  }
}

class ThirdParty extends StatefulWidget {
  const ThirdParty({Key? key}) : super(key: key);

  @override
  _ThirdPartyState createState() => _ThirdPartyState();
}

class _ThirdPartyState extends State<ThirdParty> with TickerProviderStateMixin {
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  late TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final ScrollController _controller = ScrollController();
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  @override
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body:
            // BlocConsumer<TransactionBloc, TransactionState>(
            //     listener: (context, state) {
            // TODO: implement listener
            //     if (state is _SuccessTransactionState) {
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
            // }, builder: (context, state) {
            //   return
            SingleChildScrollView(
                child: Container(
                    color: theme.backgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          color: theme.scaffoldBackgroundColor,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TabBar(
                              overlayColor:
                                  MaterialStateProperty.all<Color>(Colors.grey),
                              controller: _nestedTabController,
                              indicatorColor: Colors.white,
                              labelColor: Colors.black87,
                              automaticIndicatorColorAdjustment: true,
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              isScrollable: true,
                              unselectedLabelColor: Colors.grey,
                              tabs: const <Widget>[
                                Tab(
                                  child: Text(
                                    'Buy',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Sell',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: theme.backgroundColor,

                          height: screenHeight * 1.90,
                          // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: TabBarView(
                            controller: _nestedTabController,
                            children: <Widget>[
                              ListView(
                                // controller: _controller,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                children: <Widget>[
                                  // Row(
                                  //   children: const [
                                  //     Padding(padding: EdgeInsets.only(left: 50)),
                                  //     Text(
                                  //       'Reset Password',
                                  //       textAlign: TextAlign.left,
                                  //       style: TextStyle(
                                  //         color: Colors.black,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: screenHeight * 0.010,
                                  // ),
                                  // Row(
                                  //   children: const [
                                  //     Padding(padding: EdgeInsets.only(left: 50)),
                                  //     Text(
                                  //       '12scdvfa',
                                  //       textAlign: TextAlign.left,
                                  //       style: TextStyle(
                                  //         color: Colors.black,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),

                                  Container(
                                    child: Container(
                                      child: SingleChildScrollView(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: screenHeight * 0.010,
                                              ),
                                              Row(children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 30)),

                                                Container(
                                                  alignment: Alignment.center,
                                                  width: screenWidth * 0.655,
                                                  height: screenHeight * 0.055,
                                                  color: theme.backgroundColor,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          // return DetailPage(bean);
                                                          return CountryCode();
                                                        }));
                                                      },
                                                      child:
                                                          FormBuilderTextField(
                                                                                                                         

                                                        name: '',
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          8),
                                                          labelStyle: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .blueGrey),
                                                          labelText: "",
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          4.0))),

                                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                                          // errorText: _emailError,
                                                        ),
                                                        validator:
                                                            FormBuilderValidators
                                                                .compose([
                                                          FormBuilderValidators
                                                              .required(),
                                                          FormBuilderValidators
                                                              .email(),
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),

                                                //

                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    // width: screenWidth * 0.150,
                                                    height:
                                                        screenHeight * 0.055,
                                                    color:
                                                        theme.backgroundColor,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(0.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            // return DetailPage(bean);
                                                            return CountryCode();
                                                          }));
                                                        },
                                                        child:
                                                            FormBuilderTextField(
                                                                                                                              
readOnly: true,
                                                          name: 'email',
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            8),
                                                            labelStyle: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .blueGrey),
                                                            labelText: "",
                                                            enabledBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            4.0))),

                                                            // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                                            suffixIcon: Icon(
                                                              FontAwesomeIcons
                                                                  .caretDown,
                                                              size: 17,
                                                            ),
                                                            // errorText: _emailError,
                                                          ),
                                                          validator:
                                                              FormBuilderValidators
                                                                  .compose([
                                                            FormBuilderValidators
                                                                .required(),
                                                            FormBuilderValidators
                                                                .email(),
                                                          ]),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 35)),
                                              ]),
                                              SizedBox(
                                                height: screenHeight * 0.010,
                                              ),
                                              Row(children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 30)),

                                                Container(
                                                  alignment: Alignment.center,
                                                  width: screenWidth * 0.655,
                                                  height: screenHeight * 0.055,
                                                  color: theme.backgroundColor,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          // return DetailPage(bean);
                                                          return CountryCode();
                                                        }));
                                                      },
                                                      child:
                                                          FormBuilderTextField(
                                                                     readOnly:true,                                                     
                                                        name: 'email',
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          8),
                                                          labelStyle: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .blueGrey),
                                                          labelText: "",
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          4.0))),

                                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                                          // errorText: _emailError,
                                                        ),
                                                        validator:
                                                            FormBuilderValidators
                                                                .compose([
                                                          FormBuilderValidators
                                                              .required(),
                                                          FormBuilderValidators
                                                              .email(),
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),

                                                //

                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    // width: screenWidth * 0.150,
                                                    height:
                                                        screenHeight * 0.055,
                                                    color:
                                                        theme.backgroundColor,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(0.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            // return DetailPage(bean);
                                                            return CountryCode();
                                                          }));
                                                        },
                                                        child:
                                                            FormBuilderTextField(
                                                                                                                               readOnly:true,

                                                          name: '',
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            8),
                                                            labelStyle: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .blueGrey),
                                                            labelText: "",
                                                            enabledBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            4.0))),

                                                            // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                                            suffixIcon: Icon(
                                                              FontAwesomeIcons
                                                                  .caretDown,
                                                              size: 17,
                                                            ),
                                                            // errorText: _emailError,
                                                          ),
                                                          validator:
                                                              FormBuilderValidators
                                                                  .compose([
                                                            FormBuilderValidators
                                                                .required(),
                                                            FormBuilderValidators
                                                                .email(),
                                                          ]),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 35)),
                                              ]),
                                              SizedBox(
                                                height: screenHeight * 0.010,
                                              ),
                                              Row(children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 32, right: 36),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    color:
                                                        theme.backgroundColor,
                                                    height:
                                                        screenHeight * 0.060,
                                                    width: screenWidth * 0.50,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          // return DetailPage(bean);
                                                          return SearchListBuy();
                                                        }));
                                                      },
                                                      child:
                                                          FormBuilderTextField(

                                                        name: '',
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          8),
                                                          labelStyle: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .blueGrey),
                                                          labelText: "",
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          4.0))),

                                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                                          // errorText: _emailError,
                                                        ),
                                                        validator:
                                                            FormBuilderValidators
                                                                .compose([
                                                          FormBuilderValidators
                                                              .required(),
                                                          FormBuilderValidators
                                                              .email(),
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                              ]),
                                              SizedBox(
                                                height: screenHeight * 0.010,
                                              ),
                                              Row(children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 32, right: 36),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    color:
                                                        theme.backgroundColor,
                                                    height:
                                                        screenHeight * 0.060,
                                                    width: screenWidth * 0.50,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          // return DetailPage(bean);
                                                          return SearchListBuy();
                                                        }));
                                                      },
                                                      child:
                                                          FormBuilderTextField(
                                                                                                                             readOnly:true,

                                                        name: '',
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          8),
                                                          labelStyle: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .blueGrey),
                                                          labelText: "",
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          4.0))),

                                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                                          // errorText: _emailError,
                                                        ),
                                                        validator:
                                                            FormBuilderValidators
                                                                .compose([
                                                          FormBuilderValidators
                                                              .required(),
                                                          FormBuilderValidators
                                                              .email(),
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                              ]),
                                              SizedBox(
                                                height: screenHeight * 0.010,
                                              ),
                                              Row(children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 28, right: 30),
                                                  child: GestureDetector(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width:
                                                          screenWidth * 0.740,
                                                      height:
                                                          screenHeight * 0.050,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3.0),
                                                        color:
                                                            theme.primaryColor,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(1.0),
                                                        child: InkWell(
                                                          // onTap: _signUp,
                                                          child: Center(
                                                            child: Text(
                                                              'Buy',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                              ]),
                                              SizedBox(
                                                height: screenHeight * 0.010,
                                              ),
                                              Column(children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                    Text("Confirm Order:",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.4)),
                                                    Text("",
                                                        style: TextStyle(
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                  ],
                                                ),
                                              ]),
                                              Column(children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                    Text("I need to pay:",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.4)),
                                                    Text("44",
                                                        style: TextStyle(
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                  ],
                                                ),
                                              ]),
                                              Column(children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                    Text("I will receive ::",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.4)),
                                                    Text("43",
                                                        style: TextStyle(
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                  ],
                                                ),
                                              ]),
                                              Column(children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                    Text("Payment Method:",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.4)),
                                                    Text("Bank Transfer",
                                                        style: TextStyle(
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                  ],
                                                ),
                                              ]),
                                              Column(children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                    Text("Account:",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.4)),
                                                    Text("Spot Account",
                                                        style: TextStyle(
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                  ],
                                                ),
                                              ]),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ListView(
                                // controller: _controller,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                children: <Widget>[
                                  // Row(
                                  //   children: const [
                                  //     Padding(padding: EdgeInsets.only(left: 50)),
                                  //     Text(
                                  //       'Reset Password',
                                  //       textAlign: TextAlign.left,
                                  //       style: TextStyle(
                                  //         color: Colors.black,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: screenHeight * 0.010,
                                  // ),
                                  // Row(
                                  //   children: const [
                                  //     Padding(padding: EdgeInsets.only(left: 50)),
                                  //     Text(
                                  //       '12scdvfa',
                                  //       textAlign: TextAlign.left,
                                  //       style: TextStyle(
                                  //         color: Colors.black,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),

                                  Container(
                                    child: Container(
                                      child: SingleChildScrollView(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: screenHeight * 0.010,
                                              ),
                                              Row(children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 30)),

                                                Container(
                                                  alignment: Alignment.center,
                                                  width: screenWidth * 0.655,
                                                  height: screenHeight * 0.055,
                                                  color: theme.backgroundColor,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          // return DetailPage(bean);
                                                          return CountryCode();
                                                        }));
                                                      },
                                                      child:
                                                          FormBuilderTextField(
                                                        name: '',
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          8),
                                                          labelStyle: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .blueGrey),
                                                          labelText: "",
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          4.0))),

                                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                                          // errorText: _emailError,
                                                        ),
                                                        validator:
                                                            FormBuilderValidators
                                                                .compose([
                                                          FormBuilderValidators
                                                              .required(),
                                                          FormBuilderValidators
                                                              .email(),
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),

                                                //

                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    // width: screenWidth * 0.150,
                                                    height:
                                                        screenHeight * 0.055,
                                                    color:
                                                        theme.backgroundColor,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(0.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            // return DetailPage(bean);
                                                            return CountryCode();
                                                          }));
                                                        },
                                                        child:
                                                            FormBuilderTextField(
                                                          name: 'email',
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            8),
                                                            labelStyle: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .blueGrey),
                                                            labelText: "",
                                                            enabledBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            4.0))),

                                                            // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                                            suffixIcon: Icon(
                                                              FontAwesomeIcons
                                                                  .caretDown,
                                                              size: 17,
                                                            ),
                                                            // errorText: _emailError,
                                                          ),
                                                          validator:
                                                              FormBuilderValidators
                                                                  .compose([
                                                            FormBuilderValidators
                                                                .required(),
                                                            FormBuilderValidators
                                                                .email(),
                                                          ]),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 35)),
                                              ]),
                                              SizedBox(
                                                height: screenHeight * 0.010,
                                              ),
                                              Row(children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 30)),

                                                Container(
                                                  alignment: Alignment.center,
                                                  width: screenWidth * 0.655,
                                                  height: screenHeight * 0.055,
                                                  color: theme.backgroundColor,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          // return DetailPage(bean);
                                                          return CountryCode();
                                                        }));
                                                      },
                                                      child:
                                                          FormBuilderTextField(
                                                        name: 'email',
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          8),
                                                          labelStyle: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .blueGrey),
                                                          labelText: "",
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          4.0))),

                                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                                          // errorText: _emailError,
                                                        ),
                                                        validator:
                                                            FormBuilderValidators
                                                                .compose([
                                                          FormBuilderValidators
                                                              .required(),
                                                          FormBuilderValidators
                                                              .email(),
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),

                                                //

                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    // width: screenWidth * 0.150,
                                                    height:
                                                        screenHeight * 0.055,
                                                    color:
                                                        theme.backgroundColor,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(0.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            // return DetailPage(bean);
                                                            return CountryCode();
                                                          }));
                                                        },
                                                        child:
                                                            FormBuilderTextField(
                                                          name: '',
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            8),
                                                            labelStyle: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .blueGrey),
                                                            labelText: "",
                                                            enabledBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            4.0))),

                                                            // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                                            suffixIcon: Icon(
                                                              FontAwesomeIcons
                                                                  .caretDown,
                                                              size: 17,
                                                            ),
                                                            // errorText: _emailError,
                                                          ),
                                                          validator:
                                                              FormBuilderValidators
                                                                  .compose([
                                                            FormBuilderValidators
                                                                .required(),
                                                            FormBuilderValidators
                                                                .email(),
                                                          ]),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 35)),
                                              ]),
                                              SizedBox(
                                                height: screenHeight * 0.010,
                                              ),
                                              Row(children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 32, right: 36),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    color:
                                                        theme.backgroundColor,
                                                    height:
                                                        screenHeight * 0.060,
                                                    width: screenWidth * 0.50,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          // return DetailPage(bean);
                                                          return SearchListBuy();
                                                        }));
                                                      },
                                                      child:
                                                          FormBuilderTextField(
                                                        name: '',
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          8),
                                                          labelStyle: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .blueGrey),
                                                          labelText: "",
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          4.0))),

                                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                                          // errorText: _emailError,
                                                        ),
                                                        validator:
                                                            FormBuilderValidators
                                                                .compose([
                                                          FormBuilderValidators
                                                              .required(),
                                                          FormBuilderValidators
                                                              .email(),
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                              ]),
                                              SizedBox(
                                                height: screenHeight * 0.010,
                                              ),
                                              Row(children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 32, right: 36),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    color:
                                                        theme.backgroundColor,
                                                    height:
                                                        screenHeight * 0.060,
                                                    width: screenWidth * 0.50,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          // return DetailPage(bean);
                                                          return SearchListBuy();
                                                        }));
                                                      },
                                                      child:
                                                          FormBuilderTextField(
                                                        name: '',
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          8),
                                                          labelStyle: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .blueGrey),
                                                          labelText: "",
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          4.0))),

                                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                                          // errorText: _emailError,
                                                        ),
                                                        validator:
                                                            FormBuilderValidators
                                                                .compose([
                                                          FormBuilderValidators
                                                              .required(),
                                                          FormBuilderValidators
                                                              .email(),
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                              ]),
                                              SizedBox(
                                                height: screenHeight * 0.010,
                                              ),
                                              Row(children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 28, right: 30),
                                                  child: GestureDetector(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width:
                                                          screenWidth * 0.740,
                                                      height:
                                                          screenHeight * 0.050,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3.0),
                                                        color:
                                                            theme.primaryColor,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(1.0),
                                                        child: InkWell(
                                                          // onTap: _signUp,
                                                          child: Center(
                                                            child: Text(
                                                              'Buy',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                              ]),
                                              SizedBox(
                                                height: screenHeight * 0.010,
                                              ),
                                              Column(children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                    Text("Confirm Order:",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.4)),
                                                    Text("",
                                                        style: TextStyle(
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                  ],
                                                ),
                                              ]),
                                              Column(children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                    Text("I need to pay:",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.4)),
                                                    Text("44",
                                                        style: TextStyle(
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                  ],
                                                ),
                                              ]),
                                              Column(children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                    Text("I will receive ::",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.4)),
                                                    Text("43",
                                                        style: TextStyle(
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                  ],
                                                ),
                                              ]),
                                              Column(children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                    Text("Payment Method:",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.4)),
                                                    Text("Bank Transfer",
                                                        style: TextStyle(
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                  ],
                                                ),
                                              ]),
                                              Column(children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                    Text("Account:",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.4)),
                                                    Text("Spot Account",
                                                        style: TextStyle(
                                                            fontSize:
                                                                12 * textScale,
                                                            color: theme
                                                                .hoverColor)),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15)),
                                                  ],
                                                ),
                                              ]),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
                // );
                // }
                ));
  }
}

class FiatTrade extends StatefulWidget {
  const FiatTrade({Key? key}) : super(key: key);

  @override
  _FiatTradeState createState() => _FiatTradeState();
}

class _FiatTradeState extends State<FiatTrade> with TickerProviderStateMixin {
  List<TravelBean> _list = TravelBean.generateMostPopularBean();
  String? value;
  String text = '';
  late TabController _nestedTabController;

  late ScrollController scrollController;

  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();

  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);

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
  }

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final ScrollController _controller = ScrollController();
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];

  @override
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      Scaffold(
          backgroundColor: theme.backgroundColor,
          body:
              // BlocConsumer<TransactionBloc, TransactionState>(
              //     listener: (context, state) {
              // TODO: implement listener
              // if (state is _SuccessTransactionState) {
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
              // }, builder: (context, state) {
              //   return
              SingleChildScrollView(
                  child: Container(
                      color: theme.backgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            color: theme.scaffoldBackgroundColor,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TabBar(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.grey),
                                controller: _nestedTabController,
                                indicatorColor: Colors.white,
                                labelColor: Colors.black87,
                                automaticIndicatorColorAdjustment: true,
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                isScrollable: true,
                                unselectedLabelColor: Colors.grey,
                                tabs: const <Widget>[
                                  Tab(
                                    child: Text(
                                      'Deposit',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Withdraw',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: theme.backgroundColor,

                            height: screenHeight * 1.90,
                            // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: TabBarView(
                              controller: _nestedTabController,
                              children: <Widget>[
                                ListView(
                                  scrollDirection: Axis.vertical,
                                  controller: _controller,
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  children: <Widget>[
                                    Container(
                                      child: Container(
                                        child: SingleChildScrollView(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                AppBar(
                                                    elevation: 0,
                                                    backgroundColor:
                                                        theme.backgroundColor,
                                                    automaticallyImplyLeading:
                                                        false,
                                                    title: Row(children: [
                                                      InkWell(
                                                        onTap: () {
                                                          if (SlidingUpPanelStatus
                                                                  .anchored ==
                                                              panelController
                                                                  .status) {
                                                            // panelController.hide();
                                                            panelController
                                                                .hide();
                                                          } else {
                                                            panelController
                                                                .anchor();
                                                          }
                                                        },
                                                        child: Center(
                                                          child: Text(
                                                            "pay with",
                                                            style: TextStyle(
                                                                color: theme
                                                                    .hoverColor,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 70),
                                                      ),
                                                      Row(children: [
                                                        Text(
                                                          "Deposit USD",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20 *
                                                                  textScale,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Container(
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context,
                                                                      rootNavigator:
                                                                          true)
                                                                  .push(MaterialPageRoute(
                                                                      builder:
                                                                          (context) {
                                                                // return DetailPage(bean);
                                                                return SearchListBuy();
                                                              }));
                                                            },
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .caretDown,
                                                              color:
                                                                  Colors.black,
                                                              size: 17,
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                    ]),
                                                    actions: [
                                                      IconButton(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        iconSize: 18,
                                                        icon: const Icon(
                                                          Icons.history,
                                                          color: Colors.black87,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            // return DetailPage(bean);
                                                            return Order();
                                                          }));
                                                        },
                                                      ),
                                                    ]),
                                                SizedBox(
                                                  height: screenHeight * 0.050,
                                                ),
                                                Center(
                                                  child: Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontSize:
                                                            28 * textScale,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    "0.0000 USD Available",
                                                    style: TextStyle(
                                                        fontSize:
                                                            16 * textScale,
                                                        color:
                                                            theme.hoverColor),
                                                  ),
                                                ),
                                                Container(
                                                  child: NumericKeyboard(
                                                    onKeyboardTap:
                                                        _onKeyboardTap,
                                                    textColor: Colors.black,
                                                    rightButtonFn: () {
                                                      setState(() {
                                                        text = text.substring(
                                                            0, text.length - 1);
                                                      });
                                                    },
                                                    rightIcon: Icon(
                                                      Icons.backspace,
                                                      color: Colors.black,
                                                    ),
                                                    leftButtonFn: () {
                                                      print(
                                                          'left button clicked');
                                                    },
                                                    leftIcon: Icon(
                                                      Icons.check,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.030,
                                                ),
                                                Row(children: [
                                                  Expanded(
                                                      child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 32,
                                                    ),
                                                    child: GestureDetector(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width:
                                                            screenWidth * 0.750,
                                                        height: screenHeight *
                                                            0.055,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                          color: theme
                                                              .primaryColor,
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  1.0),
                                                          child: InkWell(
                                                            // onTap: _signUp,
                                                            child: Center(
                                                              child: Text(
                                                                ' Deposit ',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ))
                                                ]),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ListView(
                                  scrollDirection: Axis.vertical,
                                  controller: _controller,
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  children: <Widget>[
                                    Container(
                                      child: Container(
                                        child: SingleChildScrollView(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                AppBar(
                                                    elevation: 0,
                                                    backgroundColor:
                                                        theme.backgroundColor,
                                                    automaticallyImplyLeading:
                                                        false,
                                                    title: Row(children: [
                                                      InkWell(
                                                        onTap: () {
                                                          if (SlidingUpPanelStatus
                                                                  .anchored ==
                                                              panelController
                                                                  .status) {
                                                            // panelController.hide();
                                                            panelController
                                                                .hide();
                                                          } else {
                                                            panelController
                                                                .anchor();
                                                          }
                                                        },
                                                        child: Center(
                                                          child: Text(
                                                            "pay with",
                                                            style: TextStyle(
                                                                color: theme
                                                                    .hoverColor,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 70),
                                                      ),
                                                      Row(children: [
                                                        Text(
                                                          "Withdraw USD",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20 *
                                                                  textScale,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Container(
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context,
                                                                      rootNavigator:
                                                                          true)
                                                                  .push(MaterialPageRoute(
                                                                      builder:
                                                                          (context) {
                                                                // return DetailPage(bean);
                                                                return SearchListBuy();
                                                              }));
                                                            },
                                                            child: Icon(
                                                              FontAwesomeIcons
                                                                  .caretDown,
                                                              color:
                                                                  Colors.black,
                                                              size: 17,
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                    ]),
                                                    actions: [
                                                      IconButton(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        iconSize: 18,
                                                        icon: const Icon(
                                                          Icons.history,
                                                          color: Colors.black87,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            // return DetailPage(bean);
                                                            return Order();
                                                          }));
                                                        },
                                                      ),
                                                    ]),
                                                SizedBox(
                                                  height: screenHeight * 0.050,
                                                ),
                                                Center(
                                                  child: Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontSize:
                                                            28 * textScale,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    "0.0000 USD Available",
                                                    style: TextStyle(
                                                        fontSize:
                                                            16 * textScale,
                                                        color:
                                                            theme.hoverColor),
                                                  ),
                                                ),
                                                Container(
                                                  child: NumericKeyboard(
                                                    onKeyboardTap:
                                                        _onKeyboardTap,
                                                    textColor: Colors.black,
                                                    rightButtonFn: () {
                                                      setState(() {
                                                        text = text.substring(
                                                            0, text.length - 1);
                                                      });
                                                    },
                                                    rightIcon: Icon(
                                                      Icons.backspace,
                                                      color: Colors.black,
                                                    ),
                                                    leftButtonFn: () {
                                                      print(
                                                          'left button clicked');
                                                    },
                                                    leftIcon: Icon(
                                                      Icons.check,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.030,
                                                ),
                                                Row(children: [
                                                  Expanded(
                                                      child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 32,
                                                    ),
                                                    child: GestureDetector(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width:
                                                            screenWidth * 0.750,
                                                        height: screenHeight *
                                                            0.055,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                          color: theme
                                                              .primaryColor,
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  1.0),
                                                          child: InkWell(
                                                            // onTap: _signUp,
                                                            child: Center(
                                                              child: Text(
                                                                ' Withdraw ',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ))
                                                ]),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ))

                  // }
                  )),
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
                            Text("Select Payment Method",
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
                            Text("Bank Transfer",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text("Mtn Mtn Mobile Money ",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text("Flutterwave ",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
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

class Buy extends StatefulWidget {
  Buy();

  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _BuyMobile(),
          tablet: _BuyTablet(),
        ),
      ),
    );
  }
}

class _BuyTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _BuyTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __BuyTabletState createState() => __BuyTabletState();
}

class __BuyTabletState extends State<_BuyTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  // final _formKey = GlobalKey<FormBuilderState>();  @override
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
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          toolbarHeight: 50.0,
          title: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                  child: Text('Fast Buy',
                      style: TextStyle(
                          fontSize: 16 * textScale, color: Colors.black87))),
              Tab(
                  child: Text('P2P',
                      style: TextStyle(
                          fontSize: 16 * textScale, color: Colors.black87))),
              Tab(
                  child: Text('ThirdParty',
                      style: TextStyle(
                          fontSize: 16 * textScale, color: Colors.black87))),
              Tab(
                  child: Text('FiatTrade',
                      style: TextStyle(
                          fontSize: 16 * textScale, color: Colors.black87))),
            ],
          ),

          actions: const [],
          // actions: [Icon(Icons.search_outlined),],
        ),
        body: const TabBarView(
          children: <Widget>[
            // Bank(),
            // Card(),
            FastTrade(),
            P2P(),
            ThirdParty(),
            FiatTrade()
          ],
        ),
      ),
    );
  }
}

class _BuyMobile extends StatefulWidget {
  _BuyMobile();

  @override
  _BuyMobileState createState() => _BuyMobileState();
}

class _BuyMobileState extends State<_BuyMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  // final _formKey = GlobalKey<FormBuilderState>();  @override
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
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          toolbarHeight: 50.0,
          title: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                  child: Text('Fast Buy',
                      style: TextStyle(
                          fontSize: 16 * textScale, color: Colors.black87))),
              Tab(
                  child: Text('P2P',
                      style: TextStyle(
                          fontSize: 16 * textScale, color: Colors.black87))),
              Tab(
                  child: Text('ThirdParty',
                      style: TextStyle(
                          fontSize: 16 * textScale, color: Colors.black87))),
              Tab(
                  child: Text('FiatTrade',
                      style: TextStyle(
                          fontSize: 16 * textScale, color: Colors.black87))),
            ],
          ),

          actions: const [],
          // actions: [Icon(Icons.search_outlined),],
        ),
        body: TabBarView(
          children: <Widget>[
            // Bank(),
            // Card(),
            FastTrade(),
            P2P(),
            ThirdParty(),
            FiatTrade()
          ],
        ),
      ),
    );
  }
}
