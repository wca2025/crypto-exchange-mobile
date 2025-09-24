import 'dart:ui';

import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../main.dart';

class OrderTabBar1 extends StatefulWidget {
  const OrderTabBar1({Key? key}) : super(key: key);

  @override
  _OrderTabBar1State createState() => _OrderTabBar1State();
}

class _OrderTabBar1State extends State<OrderTabBar1>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Column(
      children: <Widget>[
        Container(
          color: theme.scaffoldBackgroundColor,
          height: screenHeight,
          margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          child:
              //  BlocConsumer<TransactionBloc, TransactionState>(
              //   listener: (context, state) {
              // TODO: implement listener
              //      if (state is _SuccessTransactionState) {
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
              //   return
              TabBarView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            controller: _nestedTabController,
            children: <Widget>[



                     ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        })
                     
                     
                     
           
            ],
            //   );
            // },
          ),
        )
      ],
    );
  }
}

class OrderTabBar2 extends StatefulWidget {
  const OrderTabBar2({Key? key}) : super(key: key);

  @override
  _OrderTabBar2State createState() => _OrderTabBar2State();
}

class _OrderTabBar2State extends State<OrderTabBar2>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    final textScale = MediaQuery.of(context).textScaleFactor;

    return Column(
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.black,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: const <Widget>[
            Tab(
              text: "Open Orders",
            ),
            Tab(
              text: "Stop Orders",
            ),
            Tab(
              text: "Order History",
            ),
            Tab(
              text: "Earn History",
            ),
            Tab(
              text: "Buy Crypto History",
            ),
            Tab(
              text: "Transaction History",
            ),
          ],
        ),
        Container(
            color: theme.scaffoldBackgroundColor,
            height: screenHeight,
            // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            child:

                //  BlocConsumer<TransactionBloc, TransactionState>(
                //     listener: (context, state) {
                //   // TODO: implement listener
                //   // if (state is _SuccessTransactionState) {
                //   //   ScaffoldMessenger.of(context).showSnackBar((
                //   //     const SnackBar(
                //   //       duration: Duration(seconds: 2),
                //   //       content: Text(' succeess ', textScaleFactor: 1.5),
                //   //     ),
                //   //   );
                //   // } else if (state is _ErrorTransactionState) {
                //   //   ScaffoldMessenger.of(context).showSnackBar((
                //   //     const SnackBar(
                //   //       duration: Duration(seconds: 2),
                //   //       content: Text(' error ', textScaleFactor: 1.5),
                //   //     ),
                //   //   );
                //   // }
                // }, builder: (context, state) {

                //   return
                TabBarView(
              controller: _nestedTabController,
              children: <Widget>[
          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        })
                     ,
                       ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }) ,
 
          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        })
                     ,          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        })  
                     ,
          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        })  
           
           
              ],
          
          
          
          
            )),
        // )
      ],
    );
  }
}

class OrderTabBar3 extends StatefulWidget {
  const OrderTabBar3({Key? key}) : super(key: key);

  @override
  _OrderTabBar3State createState() => _OrderTabBar3State();
}

class _OrderTabBar3State extends State<OrderTabBar3>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Column(
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.black,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: const <Widget>[
            Tab(
              text: "Open Orders",
            ),
            Tab(
              text: "Stop Orders",
            ),
            Tab(
              text: "Order History",
            ),
            Tab(
              text: "Earn History",
            ),
            Tab(
              text: "Buy Crypto History",
            ),
            Tab(
              text: "Transaction History",
            ),
          ],
        ),
        Container(
          color: theme.scaffoldBackgroundColor,

          height: screenHeight,
          // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          child:
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
              TabBarView(
            controller: _nestedTabController,
            children: <Widget>[


                 ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        })
       
       
            ],
            // );
            // }
          ),
        )
      ],
    );
  }
}

class OrderTabBar4 extends StatefulWidget {
  const OrderTabBar4({Key? key}) : super(key: key);

  @override
  _OrderTabBar4State createState() => _OrderTabBar4State();
}

class _OrderTabBar4State extends State<OrderTabBar4>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;
    final theme = Theme.of(context);

    return Column(
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.black,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: const <Widget>[
            Tab(
              text: "Open Orders",
            ),
            Tab(
              text: "Stop Orders",
            ),
            Tab(
              text: "Order History",
            ),
            Tab(
              text: "Earn History",
            ),
            Tab(
              text: "Buy Crypto History",
            ),
            Tab(
              text: "Transaction History",
            ),
          ],
        ),
        Container(
          color: theme.scaffoldBackgroundColor,

          height: screenHeight,
          // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          child:
              //  BlocConsumer<TransactionBloc, TransactionState>(
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
              // },
              //  builder: (context, state) {
              // return
              TabBarView(
            controller: _nestedTabController,
            children: <Widget>[

                      ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        })
           
           
            ],
            //   );
            // }
          ),
        )
      ],
    );
  }
}

class OrderTabBar5 extends StatefulWidget {
  const OrderTabBar5({Key? key}) : super(key: key);

  @override
  _OrderTabBar5State createState() => _OrderTabBar5State();
}

class _OrderTabBar5State extends State<OrderTabBar5>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Column(
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.black,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: const <Widget>[
            Tab(
              text: "Open Orders",
            ),
            Tab(
              text: "Stop Orders",
            ),
            Tab(
              text: "Order History",
            ),
            Tab(
              text: "Earn History",
            ),
            Tab(
              text: "Buy Crypto History",
            ),
            Tab(
              text: "Transaction History",
            ),
          ],
        ),
        Container(
            color: theme.scaffoldBackgroundColor,
            height: screenHeight,
            // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            child:
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
                TabBarView(
              controller: _nestedTabController,
              children: <Widget>[

          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        }),          ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [
                              Expanded(
                                  child: Container(
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                           
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.22,
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
                                                              'BTC/USDT',
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
                                                                "Amount ",
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
                                                                "Order Price",
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
                                                                "View Details",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                              height: 0,
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          );
                          // Divider(
                          //   color: Colors.blueGrey[100],
                          //   height: 2,
                          //   thickness: 1,
                          //   indent: 0,
                          //   endIndent: 0,
                          // ),
                        })    
             
              ],
            )
            // }),
            )
      ],
    );
  }
}

class Order extends StatefulWidget {
  Order();

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _OrderMobile(),
          tablet: _OrderTablet(),
        ),
      ),
    );
  }
}

class _OrderTablet extends StatefulWidget {
  _OrderTablet();

  @override
  __OrderTabletState createState() => __OrderTabletState();
}

class __OrderTabletState extends State<_OrderTablet> {
  final amountnameController = TextEditingController();
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
      length: 5,
      child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            toolbarHeight: 50.0,
            title: TabBar(
              overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
              indicatorColor: Colors.black87,
              labelColor: Colors.black87,
              automaticIndicatorColorAdjustment: true,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                    child: Text('Main',
                        style: TextStyle(fontSize: 16 * textScale))),
                Tab(
                    child: Text('Spot',
                        style: TextStyle(
                          fontSize: 16 * textScale,
                        ))),
                Tab(
                    child: Text('Margin',
                        style: TextStyle(
                          fontSize: 16 * textScale,
                        ))),
                Tab(
                    child: Text('Future',
                        style: TextStyle(
                          fontSize: 16 * textScale,
                        ))),
                Tab(
                    child: Text('Earn',
                        style: TextStyle(
                          fontSize: 16 * textScale,
                        ))),
              ],
            ),

            // actions: [Icon(Icons.search_outlined),],
          ),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                //  const SliverAppBar(
                //    toolbarHeight:8,

                //    collapsedHeight:8,

                //   expandedHeight:8,

                //    title: Text('svfbd'),
                //   pinned: true,
                //   floating: true,
                //   bottom: TabBar(
                //     isScrollable: true,
                //     tabs: [
                //           Tab(child: Text('hjkgh')),

                //         Tab(child: Text('Train')),
                //       Tab(child: Text('Car')),

                //     ],
                //   ),
                // ),
              ];
            },
            body: const TabBarView(
              children: <Widget>[
                OrderTabBar1(),
                OrderTabBar2(),
                OrderTabBar3(),
                OrderTabBar4(),
                OrderTabBar5(),
              ],
            ),
          )),
    );
  }
}

class _OrderMobile extends StatefulWidget {
  // final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _OrderMobile(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _OrderMobileState createState() => _OrderMobileState();
}

class _OrderMobileState extends State<_OrderMobile> {
  final amountnameController = TextEditingController();
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
      length: 5,
      child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            toolbarHeight: 50.0,
            title: TabBar(
              overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
              indicatorColor: Colors.black87,
              labelColor: Colors.black87,
              automaticIndicatorColorAdjustment: true,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                    child: Text('Main',
                        style: TextStyle(fontSize: 16 * textScale))),
                Tab(
                    child: Text('Spot',
                        style: TextStyle(
                          fontSize: 16 * textScale,
                        ))),
                Tab(
                    child: Text('Margin',
                        style: TextStyle(
                          fontSize: 16 * textScale,
                        ))),
                Tab(
                    child: Text('Future',
                        style: TextStyle(
                          fontSize: 16 * textScale,
                        ))),
                Tab(
                    child: Text('Earn',
                        style: TextStyle(
                          fontSize: 16 * textScale,
                        ))),
              ],
            ),

            // actions: [Icon(Icons.search_outlined),],
          ),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                //  const SliverAppBar(
                //    toolbarHeight:8,

                //    collapsedHeight:8,

                //   expandedHeight:8,

                //    title: Text('svfbd'),
                //   pinned: true,
                //   floating: true,
                //   bottom: TabBar(
                //     isScrollable: true,
                //     tabs: [
                //           Tab(child: Text('hjkgh')),

                //         Tab(child: Text('Train')),
                //       Tab(child: Text('Car')),

                //     ],
                //   ),
                // ),
              ];
            },
            body: const TabBarView(
              children: <Widget>[
                OrderTabBar1(),
                OrderTabBar2(),
                OrderTabBar3(),
                OrderTabBar4(),
                OrderTabBar5(),
              ],
            ),
          )),
    );
  }
}
