import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/news/news_bloc.dart';
import 'convert.dart';
import 'deposit.dart';

import 'tokendetail.dart';
import 'transfer.dart';
import 'travel_bean.dart';
import 'withdraw.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'coustom_bottom_nav_bar.dart';
import 'orderdetails.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';

import '../../main.dart';

class Alert extends StatefulWidget {
  @override
  AlertState createState() => AlertState();
}

class AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: AlertsMobile(),
          tablet: AlertsTablet(),
        ),
      ),
    );
  }
}

class AlertsTablet extends StatefulWidget {
  const AlertsTablet({Key? key}) : super(key: key);

  @override
  State<AlertsTablet> createState() => _AlertsTabletState();
}

class _AlertsTabletState extends State<AlertsTablet>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 5, vsync: this);
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
    List<TravelBean> _list = TravelBean.generateMostPopularBean();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          ' Alerts ',
          style: TextStyle(fontSize: 14 * textScale, color: Colors.black87),
        ),
      ),
      body: Container(
          color: theme.backgroundColor,
          height: screenHeight * 2.10,
          child: ListView(
            controller: _controller,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            // padding: const EdgeInsets.all(8),
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                      child: Container(
                          color: theme.backgroundColor,
                          height: screenHeight * 1.10,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Center(
                                  child: Text(" Monday 22 August 2022"),
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 12),
                                    child: Expanded(
                                      child: Container(
                                        // width: screenWidth * 1.2,
                                        // color: theme.backgroundColor,
                                        height: screenHeight * 0.22,
                                        //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),

                                        child: Card(
                                          color: theme.scaffoldBackgroundColor,
                                          elevation: 0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              ListTile(
                                                title: Row(children: [
                                                  Text(
                                                      'Complete your first deposit to win a bonus',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ]),
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
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5)),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 1,
                                                          left: 12,
                                                          right: 12),
                                                      child: Text(
                                                        "Deposit your firsdt 50usd worth of crypto and win up  ",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                        ),
                                                      )),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.65)),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5)),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 1,
                                                          left: 12,
                                                          right: 12),
                                                      child: Text(
                                                        "to 10k of crypto",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                        ),
                                                      )),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.65)),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5)),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 1,
                                                          left: 12,
                                                          right: 12),
                                                      child: Text(
                                                        "View Details",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                        ),
                                                      )),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.65)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 8,
                                ),
                                Center(
                                  child: Text(" Monday 22 August 2022"),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 12),
                                  child: Expanded(
                                    child: Container(
                                      // width: screenWidth * 1.2,
                                      color: theme.backgroundColor,
                                      height: screenHeight * 0.22,
                                      //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),

                                      child: Card(
                                        color: theme.scaffoldBackgroundColor,
                                        elevation: 0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            ListTile(
                                              title: Row(children: [
                                                Text(
                                                    'Complete your first deposit to win a bonus',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ]),
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
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 1,
                                                        left: 12,
                                                        right: 12),
                                                    child: Text(
                                                      "Deposit your firsdt 50usd worth of crypto and win up  ",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.65)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 1,
                                                        left: 12,
                                                        right: 12),
                                                    child: Text(
                                                      "to 10k of crypto",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.65)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 1,
                                                        left: 12,
                                                        right: 12),
                                                    child: Text(
                                                      "View Details",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.65)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Center(
                                  child: Text(" Monday 22 August 2022"),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 12),
                                  child: Expanded(
                                    child: Container(
                                      // width: screenWidth * 1.2,
                                      color: theme.backgroundColor,
                                      height: screenHeight * 0.22,
                                      //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),

                                      child: Card(
                                        color: theme.scaffoldBackgroundColor,
                                        elevation: 0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            ListTile(
                                              title: Row(children: [
                                                Text(
                                                    'Complete your first deposit to win a bonus',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ]),
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
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 1,
                                                        left: 12,
                                                        right: 12),
                                                    child: Text(
                                                      "Deposit your firsdt 50usd worth of crypto and win up  ",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.65)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 1,
                                                        left: 12,
                                                        right: 12),
                                                    child: Text(
                                                      "to 10k of crypto",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.65)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 1,
                                                        left: 12,
                                                        right: 12),
                                                    child: Text(
                                                      "View Details",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.65)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )))
                ],
              ),
              Divider(
                color: Colors.blueGrey[100],
                height: 2,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
            ],
          )),
    );
  }
}

class AlertsMobile extends StatefulWidget {
  const AlertsMobile({Key? key}) : super(key: key);

  @override
  _AlertsMobileState createState() => _AlertsMobileState();
}

class _AlertsMobileState extends State<AlertsMobile>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 5, vsync: this);
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
    List<TravelBean> _list = TravelBean.generateMostPopularBean();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: Text(
            ' AlertsMobile ',
            style: TextStyle(fontSize: 14 * textScale, color: Colors.black87),
          ),
        ),
        body: Container(
          height: screenHeight * 1.0,
          child:
           Container(
              color: theme.backgroundColor,
              height: screenHeight * 1.10,
              child: 
              // BlocConsumer<NewsBloc, NewsState>(
              //   listener: (context, state) {
              //     // TODO: implement listener
              //   },
              //   builder: (context, state) {
                  //  if   (state is _ErrorNewsState){

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
                  // }
                  // if (state is DisplayNewsState) {
                    // return
                     ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        // itemCount: state.news.length,
                        padding: const EdgeInsets.all(1.0),
                        itemBuilder: (context, index) {
                          // padding: const EdgeInsets.all(8),

                          return Row(
                            children: [

                              Expanded(
                                  child: 
                            
                                  Container(
                                      color: theme.backgroundColor,
                                      height: screenHeight * 0.34,
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
                                            Center(
                                              child: Text(
                                                  " Monday 22 August 2022"),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.0,
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
                                                              'Complete your first deposit to win a bonus',
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
                                                                "Deposit your firsdt 50usd worth of crypto and win up  ",
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
                                                                "to 10k of crypto",
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
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      )) )
                       
                       
                       
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
                     
                     
                     
                     
                        // ;
                  // }
                // },
              // )
              ),
        ));
  }
}
