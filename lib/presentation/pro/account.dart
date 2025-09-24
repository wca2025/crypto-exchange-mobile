import 'dart:ui';
import 'package:cx/presentation/pro/gains.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:cx/presentation/pro/trade.dart';
import 'package:cx/presentation/pro/tradingbotlistdetail.dart';
import 'package:cx/presentation/pro/tradingbotoptionlist.dart';

import '../../businesslogic/blocs/account/account_bloc.dart';
import 'convert.dart';
import 'countrycode.dart';
import 'deposit.dart';

import 'resetpassword1.dart';
import 'selecttoken.dart';
import 'sign_up.dart';
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

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
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
      body: ListView(
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
                      height: screenHeight * 0.40,
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
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 12),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      ListTile(
                                        title: Row(children: const [
                                          Text('Total Assets',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              )),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 135.0)),
                                        ]),
                                      ),
                                      // Divider(
                                      //   color: Colors.blueGrey[100],
                                      //   height: 2,
                                      //   thickness: 1,
                                      //   indent: 0,
                                      //   endIndent: 0,
                                      // ),

                                      Row(
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 5)),
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5,
                                                  bottom: 1,
                                                  left: 12,
                                                  right: 12),
                                              child: Text(
                                                "Available Balance ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: Colors.black,
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
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5,
                                                  bottom: 1,
                                                  left: 12,
                                                  right: 12),
                                              child: Text(
                                                ":0.00 USD",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: Colors.black,
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
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5,
                                                  bottom: 1,
                                                  left: 12,
                                                  right: 12),
                                              child: Text(
                                                ":0.0000 BTC",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
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
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 4,
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                        child: Center(
                                            child: SizedBox(
                                  width: screenWidth * 0.40,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                theme.primaryColor)),
                                    child: Text(
                                      'Deposit',
                                      style: TextStyle(
                                          fontSize: 14 * textScale,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.of(
                                        context,
                                        rootNavigator: true,
                                      ).push(
                                          MaterialPageRoute(builder: (context) {
                                        return SearchListDeposit();
                                      }));
                                    },
                                  ),
                                )))),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 4,
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                        child: Center(
                                            child: SizedBox(
                                                width: screenWidth * 0.40,
                                                child: TextButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                    Color(0xFFf5f7fa),
                                                  )),
                                                  onPressed: () {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .push(MaterialPageRoute(
                                                            builder: (context) {
                                                      return SearchListWithdraw();
                                                    }));
                                                  },
                                                  child: Text(
                                                    'Withdraw',
                                                    style: TextStyle(
                                                        fontSize:
                                                            14 * textScale,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                ))))),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 4,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                // const Padding(
                                // padding: EdgeInsets.only(
                                //   left: 10,
                                // ),
                                // ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 4,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      child: Center(
                                          child: SizedBox(
                                              width: screenWidth * 0.40,
                                              child: TextButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                  Color(0xFFf5f7fa),
                                                )),
                                                onPressed: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .push(MaterialPageRoute(
                                                          builder: (context) {
                                                    return Convert();
                                                  }));
                                                },
                                                child: Text(
                                                  'Convert',
                                                  style: TextStyle(
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              )))),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 4,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      child: Center(
                                          child: SizedBox(
                                              width: screenWidth * 0.40,
                                              child: TextButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                  Color(0xFFf5f7fa),
                                                )),
                                                onPressed: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .push(MaterialPageRoute(
                                                          builder: (context) {
                                                    return SearchListTransfer();
                                                  }));
                                                },
                                                child: Text(
                                                  'Transfer',
                                                  style: TextStyle(
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              )))),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 5,
                                  ),
                                ),
                              ],
                            )
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
          DefaultTabController(
            length: 2,
            child: Container(
                // color: theme.backgroundColor,
                child: Column(children: <Widget>[
              Container(
                color: theme.backgroundColor,
                constraints: const BoxConstraints.expand(height: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    indicatorColor: Colors.white,
                    labelColor: Colors.black38,
                    unselectedLabelColor: Colors.black54,
                    isScrollable: true,
                    tabs: <Widget>[
                      Tab(
                          child: Text('Crypto',
                              style: TextStyle(fontSize: 14 * textScale))),
                      Tab(
                          child: Text("Fiat",
                              style: TextStyle(fontSize: 14 * textScale))),
                    ],
                  ),
                ),
              ),
              Container(
                  height: screenHeight * 0.80,
                  child:
                      //            (state is _ErrorAuthState)
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
                      //             ):

                      //             // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      //             // child: TabBarView(
                      //             //   controller: _nestedTabController,
                      //             //   children: <Widget>[
                      //             //     ListView.builder(
                      //             //       controller: _controller,
                      //             //       physics: const BouncingScrollPhysics(
                      //             //           parent: AlwaysScrollableScrollPhysics()),
                      //             //       scrollDirection: Axis.vertical,
                      //             //       itemCount: 8,
                      //             //       padding: const EdgeInsets.all(1.0),
                      //             //       itemBuilder: (context, index) {
                      //             //         var bean = _list[index];
                      //             //         return Container(
                      //             //           color: Colors.white70,
                      //             //           // width: screenWidth * 0.880,
                      //             //           child: InkWell(
                      //             //             onTap: () {
                      //             //               // Navigator.of(context,rootNavigator: true)
                      //             //               //     .push(MaterialPageRoute(builder: (context) {
                      //             //               //   // return DetailPage(bean);
                      //             //               //   return NftDetailsPage();
                      //             //               // }));
                      //             //             },
                      //             //             child: Column(children: [
                      //             //               ListTile(
                      //             //                 title: Row(
                      //             //                   children: [
                      //             //                     Text("lorem",
                      //             //                         style: TextStyle(
                      //             //                           fontSize: 16 * textScale,
                      //             //                           color: Colors.black87,
                      //             //                           fontWeight: FontWeight.w500,
                      //             //                         )),
                      //             //                     Expanded(
                      //             //                         child: Container(
                      //             //                             width:
                      //             //                                 screenWidth * 0.08)),
                      //             //                     Text(
                      //             //                       "lorem",
                      //             //                       style: TextStyle(
                      //             //                         fontSize: 16 * textScale,
                      //             //                         color: Colors.black87,
                      //             //                         fontWeight: FontWeight.w500,
                      //             //                       ),
                      //             //                     )
                      //             //                   ],
                      //             //                 ),
                      //             //                 subtitle: Row(
                      //             //                   children: [
                      //             //                     Text("lorem",
                      //             //                         style: TextStyle(
                      //             //                           fontSize: 12,
                      //             //                         )),
                      //             //                     Expanded(
                      //             //                         child: Container(
                      //             //                             width:
                      //             //                                 screenWidth * 0.08)),
                      //             //                     Text("lorem",
                      //             //                         style: TextStyle(
                      //             //                           fontSize: 12,
                      //             //                         ))
                      //             //                   ],
                      //             //                 ),
                      //             //               ),
                      //             //             ]),
                      //             //           ),
                      //             //         );
                      //             //       },
                      //             //     ),
                      //             //     ListView.builder(
                      //             //       controller: _controller,
                      //             //       physics: const BouncingScrollPhysics(
                      //             //           parent: AlwaysScrollableScrollPhysics()),
                      //             //       scrollDirection: Axis.vertical,
                      //             //       itemCount: 8,
                      //             //       padding: const EdgeInsets.all(1.0),
                      //             //       itemBuilder: (context, index) {
                      //             //         var bean = _list[index];
                      //             //         return Container(
                      //             //           color: Colors.white70,
                      //             //           // width: screenWidth * 0.880,
                      //             //           child: InkWell(
                      //             //             onTap: () {
                      //             //               // Navigator.of(context,rootNavigator: true)
                      //             //               //     .push(MaterialPageRoute(builder: (context) {
                      //             //               //   // return DetailPage(bean);
                      //             //               //   return NftDetailsPage();
                      //             //               // }));
                      //             //             },
                      //             //             child: Column(children: [
                      //             //               ListTile(
                      //             //                 title: Row(
                      //             //                   children: [
                      //             //                     Text("lorem",
                      //             //                         style: TextStyle(
                      //             //                           fontSize: 16 * textScale,
                      //             //                           color: Colors.black87,
                      //             //                           fontWeight: FontWeight.w500,
                      //             //                         )),
                      //             //                     Expanded(
                      //             //                         child: Container(
                      //             //                             width:
                      //             //                                 screenWidth * 0.08)),
                      //             //                     Text(
                      //             //                       "lorem",
                      //             //                       style: TextStyle(
                      //             //                         fontSize: 16 * textScale,
                      //             //                         color: Colors.black87,
                      //             //                         fontWeight: FontWeight.w500,
                      //             //                       ),
                      //             //                     )
                      //             //                   ],
                      //             //                 ),
                      //             //                 subtitle: Row(
                      //             //                   children: [
                      //             //                     Text("lorem",
                      //             //                         style: TextStyle(
                      //             //                           fontSize: 12,
                      //             //                         )),
                      //             //                     Expanded(
                      //             //                         child: Container(
                      //             //                             width:
                      //             //                                 screenWidth * 0.08)),
                      //             //                     Text("lorem",
                      //             //                         style: TextStyle(
                      //             //                           fontSize: 12,
                      //             //                         ))
                      //             //                   ],
                      //             //                 ),
                      //             //               ),
                      //             //             ]),
                      //             //           ),
                      //             //         );
                      //             //       },
                      //             //     ),
                      //             //     ListView.builder(
                      //             //       controller: _controller,
                      //             //       physics: const BouncingScrollPhysics(
                      //             //           parent: AlwaysScrollableScrollPhysics()),
                      //             //       scrollDirection: Axis.vertical,
                      //             //       itemCount: 8,
                      //             //       padding: const EdgeInsets.all(1.0),
                      //             //       itemBuilder: (context, index) {
                      //             //         var bean = _list[index];
                      //             //         return Container(
                      //             //           color: Colors.white70,
                      //             //           // width: screenWidth * 0.880,
                      //             //           child: InkWell(
                      //             //             onTap: () {
                      //             //               // Navigator.of(context,rootNavigator: true)
                      //             //               //     .push(MaterialPageRoute(builder: (context) {
                      //             //               //   // return DetailPage(bean);
                      //             //               //   return NftDetailsPage();
                      //             //               // }));
                      //             //             },
                      //             //             child: Column(children: [
                      //             //               ListTile(
                      //             //                 title: Row(
                      //             //                   children: [
                      //             //                     Text("lorem",
                      //             //                         style: TextStyle(
                      //             //                           fontSize: 16 * textScale,
                      //             //                           color: Colors.black87,
                      //             //                           fontWeight: FontWeight.w500,
                      //             //                         )),
                      //             //                     Expanded(
                      //             //                         child: Container(
                      //             //                             width:
                      //             //                                 screenWidth * 0.08)),
                      //             //                     Text(
                      //             //                       "lorem",
                      //             //                       style: TextStyle(
                      //             //                         fontSize: 16 * textScale,
                      //             //                         color: Colors.black87,
                      //             //                         fontWeight: FontWeight.w500,
                      //             //                       ),
                      //             //                     )
                      //             //                   ],
                      //             //                 ),
                      //             //                 subtitle: Row(
                      //             //                   children: [
                      //             //                     Text("lorem",
                      //             //                         style: TextStyle(
                      //             //                           fontSize: 12,
                      //             //                         )),
                      //             //                     Expanded(
                      //             //                         child: Container(
                      //             //                             width:
                      //             //                                 screenWidth * 0.08)),
                      //             //                     Text("lorem",
                      //             //                         style: TextStyle(
                      //             //                           fontSize: 12,
                      //             //                         ))
                      //             //                   ],
                      //             //                 ),
                      //             //               ),
                      //             //             ]),
                      //             //           ),
                      //             //         );
                      //             //       },
                      //             //     ),

                      //             //   ],
                      //             // ),

                      // ),

                      // :

                      //     BlocConsumer<AccountBloc, AccountState>(
                      //         listener: (context, state) {
                      //   // TODO: implement listener
                      // }, builder: (context, state) {
                      //   return

                      TabBarView(children: [
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        padding: const EdgeInsets.all(6.0),
                        itemBuilder: (context, index) {
                          var bean = _list[index];
                          return Column(children: [
                            Row(children: [
                              Expanded(
                                child: Container(
                                  color: Colors.white70,
                                  // width: screenWidth * 0.880,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(
                                        context,
                                        rootNavigator: true,
                                      ).push(
                                          MaterialPageRoute(builder: (context) {
                                        // return DetailPage(bean);
                                        return tokenDetail();
                                      }));
                                    },
                                    child: Column(children: [
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Text("1EARTH",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14 * textScale,
                                                    color: Colors.black)),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.08)),
                                            Text("Available",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14 * textScale,
                                                    color: Colors.black38))
                                          ],
                                        ),
                                        subtitle: Row(
                                          children: [
                                            // Text("lorem",
                                            //     style: TextStyle(
                                            //       fontSize: 12 * textScale,
                                            //     )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.08)),
                                            Text("0.00",
                                                style: TextStyle(
                                                  fontSize: 12 * textScale,
                                                ))
                                          ],
                                        ),
                                        trailing: Container(
                                            height: screenHeight * 0.048,
                                            width: screenWidth * 0.198,
                                            // color: Colors.grey[200],
                                            child: Column(children: [
                                              Text("Inorder",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black38)),
                                              Expanded(
                                                  child: Container(
                                                width: screenWidth * 0.08,
                                              )),
                                              Text("0.00",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12 * textScale,
                                                      color: Colors.black38))
                                            ])),
                                      )
                                    ]),
                                  ),
                                ),
                              )
                            ])
                          ]);
                        }),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        padding: const EdgeInsets.all(6.0),
                        itemBuilder: (context, index) {
                          var bean = _list[index];
                          return Column(children: [
                            Row(children: [
                              Expanded(
                                child: Container(
                                  color: Colors.white70,
                                  // width: screenWidth * 0.880,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(
                                        context,
                                        rootNavigator: true,
                                      ).push(
                                          MaterialPageRoute(builder: (context) {
                                        // return DetailPage(bean);
                                        return tokenDetail();
                                      }));
                                    },
                                    child: Column(children: [
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Text("1EARTH",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14 * textScale,
                                                    color: Colors.black)),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.08)),
                                            Text("Available",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14 * textScale,
                                                    color: Colors.black38))
                                          ],
                                        ),
                                        subtitle: Row(
                                          children: [
                                            // Text("lorem",
                                            //     style: TextStyle(
                                            //       fontSize: 12 * textScale,
                                            //     )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.08)),
                                            Text("0.00",
                                                style: TextStyle(
                                                  fontSize: 12 * textScale,
                                                ))
                                          ],
                                        ),
                                        trailing: Container(
                                            height: screenHeight * 0.048,
                                            width: screenWidth * 0.198,
                                            // color: Colors.grey[200],
                                            child: Column(children: [
                                              Text("Inorder",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black38)),
                                              Expanded(
                                                  child: Container(
                                                width: screenWidth * 0.08,
                                              )),
                                              Text("0.00",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12 * textScale,
                                                      color: Colors.black38))
                                            ])),
                                      )
                                    ]),
                                  ),
                                ),
                              )
                            ])
                          ]);
                        })
                  ])

                  // })
                  ),
            ])),
          ),
        ],
      ),
    );
  }
}

class Spot extends StatefulWidget {
  const Spot({Key? key}) : super(key: key);

  @override
  _SpotState createState() => _SpotState();
}

class _SpotState extends State<Spot> with TickerProviderStateMixin {
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
        body: ListView(
            controller: _controller,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            // padding: const EdgeInsets.all(8),
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                      child: Container(
                          height: screenHeight * 0.390,
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
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 12),
                                  child: Container(
                                    // width: screenWidth * 1.2,
                                    color: theme.backgroundColor,
                                    height: screenHeight * 0.25,
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
                                            title: Row(children: const [
                                              Text('Total Assets',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 135.0)),
                                            ]),
                                          ),
                                          // Divider(
                                          //   color: Colors.blueGrey[100],
                                          //   height: 2,
                                          //   thickness: 1,
                                          //   indent: 0,
                                          //   endIndent: 0,
                                          // ),

                                          Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5)),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 1,
                                                      left: 12,
                                                      right: 12),
                                                  child: Text(
                                                    "Available Balance ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  )),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.65)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5)),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 1,
                                                      left: 12,
                                                      right: 12),
                                                  child: Text(
                                                    ":0.00 USD",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  )),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.65)),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5)),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 1,
                                                      left: 12,
                                                      right: 12),
                                                  child: Text(
                                                    ":0.0000 BTC",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  )),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.65)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Container(
                                            height: screenHeight * 0.030,
                                            width: screenWidth * 0.910,
                                            // color: Colors.grey,
                                            child: InkWell(
                                                onTap: () {
                                                  // Navigator.of(context,rootNavigator: true)
                                                  //     .push(MaterialPageRoute(builder: (context) {
                                                  //   return help2();
                                                  // }));
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          // Row(
                                                          //   mainAxisAlignment:
                                                          //       MainAxisAlignment
                                                          //           .start,
                                                          //   crossAxisAlignment:
                                                          //       CrossAxisAlignment
                                                          //           .start,
                                                          //   children: [
                                                          //     SizedBox(
                                                          //       width:
                                                          //           screenWidth *
                                                          //               0.050,
                                                          //       height:
                                                          //           screenHeight *
                                                          //               0.025,
                                                          //     ),
                                                          //     Text(
                                                          //         "Total Equity:",
                                                          //         style: TextStyle(
                                                          //             fontSize: 10 *
                                                          //                 textScale)),
                                                          //     SizedBox(
                                                          //       width:
                                                          //           screenWidth *
                                                          //               0.50,
                                                          //       height:
                                                          //           screenHeight *
                                                          //               0.020,
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          // Row(
                                                          //   children: [
                                                          //     SizedBox(
                                                          //       width:
                                                          //           screenWidth *
                                                          //               0.050,
                                                          //       height:
                                                          //           screenHeight *
                                                          //               0.025,
                                                          //     ),
                                                          //     Text("0.000",
                                                          //         style:
                                                          //             TextStyle(
                                                          //           fontSize: 20 *
                                                          //               textScale,
                                                          //         )),
                                                          //     SizedBox(
                                                          //       width:
                                                          //           screenWidth *
                                                          //               0.50,
                                                          //       height:
                                                          //           screenHeight *
                                                          //               0.020,
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          // Row(
                                                          //   children: [
                                                          //     SizedBox(
                                                          //       width:
                                                          //           screenWidth *
                                                          //               0.050,
                                                          //       height:
                                                          //           screenHeight *
                                                          //               0.025,
                                                          //     ),
                                                          //     Text("0.000",
                                                          //         style:
                                                          //             TextStyle(
                                                          //           fontSize: 10 *
                                                          //               textScale,
                                                          //         )),
                                                          //     SizedBox(
                                                          //       width:
                                                          //           screenWidth *
                                                          //               0.50,
                                                          //       height:
                                                          //           screenHeight *
                                                          //               0.020,
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ))))
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                            child: Center(
                                                child: SizedBox(
                                                    width: screenWidth * 0.375,
                                                    child: TextButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                        Color(0xFFf5f7fa),
                                                      )),
                                                      onPressed: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return SearchListWithdraw();
                                                        }));
                                                      },
                                                      child: Text(
                                                        'Convert',
                                                        style: TextStyle(
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ))))),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 5,
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                            child: Center(
                                                child: SizedBox(
                                                    width: screenWidth * 0.375,
                                                    child: TextButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                        Color(0xFFf5f7fa),
                                                      )),
                                                      onPressed: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return SearchListTransfer();
                                                        }));
                                                      },
                                                      child: Text(
                                                        'Transfer',
                                                        style: TextStyle(
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ))))),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                      ),
                                    ),
                                  ],
                                )
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
              Container(
                  height: screenHeight * 0.90,
                  child:
                      //            (state is _ErrorAuthState)
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

                      //   BlocConsumer<AccountBloc, AccountState>(
                      // listener: (context, state) {
                      //   // TODO: implement listener
                      // },
                      // builder: (context, state) {
                      //   return

                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 4,
                          padding: const EdgeInsets.all(6.0),
                          itemBuilder: (context, index) {
                            var bean = _list[index];
                            return Column(children: [
                              Row(children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.white70,
                                    // width: screenWidth * 0.880,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).push(MaterialPageRoute(
                                            builder: (context) {
                                          // return DetailPage(bean);
                                          return tokenDetail();
                                        }));
                                      },
                                      child: Column(children: [
                                        ListTile(
                                          title: Row(
                                            children: [
                                              Text("1EARTH",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black)),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.08)),
                                              Text("Available",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black38))
                                            ],
                                          ),
                                          subtitle: Row(
                                            children: [
                                              // Text("lorem",
                                              //     style: TextStyle(
                                              //       fontSize: 12 * textScale,
                                              //     )),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.08)),
                                              Text("0.00",
                                                  style: TextStyle(
                                                    fontSize: 12 * textScale,
                                                  ))
                                            ],
                                          ),
                                          trailing: Container(
                                              height: screenHeight * 0.048,
                                              width: screenWidth * 0.198,
                                              // color: Colors.grey[200],
                                              child: Column(children: [
                                                Text("Inorder",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            14 * textScale,
                                                        color: Colors.black38)),
                                                Expanded(
                                                    child: Container(
                                                  width: screenWidth * 0.08,
                                                )),
                                                Text("0.00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            12 * textScale,
                                                        color: Colors.black38))
                                              ])),
                                        )
                                      ]),
                                    ),
                                  ),
                                )
                              ])
                            ]);
                          })
                  // },
                  // )
                  ),
            ]));
  }
}

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> with TickerProviderStateMixin {
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
        body: ListView(
            controller: _controller,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            // padding: const EdgeInsets.all(8),
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                      child: Container(
                          height: screenHeight * 0.390,
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
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 12),
                                  child: Container(
                                    // width: screenWidth * 1.2,
                                    color: theme.backgroundColor,
                                    height: screenHeight * 0.25,
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
                                            title: Row(children: const [
                                              Text('Total Assets',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 135.0)),
                                            ]),
                                          ),
                                          // Divider(
                                          //   color: Colors.blueGrey[100],
                                          //   height: 2,
                                          //   thickness: 1,
                                          //   indent: 0,
                                          //   endIndent: 0,
                                          // ),

                                          Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5)),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 1,
                                                      left: 12,
                                                      right: 12),
                                                  child: Text(
                                                    "Available Balance ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  )),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.65)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5)),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 1,
                                                      left: 12,
                                                      right: 12),
                                                  child: Text(
                                                    "Margin Balance",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  )),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.65)),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5)),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 1,
                                                      left: 12,
                                                      right: 12),
                                                  child: Text(
                                                    "UNrealized PNL",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                    ),
                                                  )),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.65)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Container(
                                            height: screenHeight * 0.030,
                                            width: screenWidth * 0.910,
                                            // color: Colors.grey,
                                            child: InkWell(
                                                onTap: () {
                                                  // Navigator.of(context,rootNavigator: true)
                                                  //     .push(MaterialPageRoute(builder: (context) {
                                                  //   return help2();
                                                  // }));
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          // Row(
                                                          //   mainAxisAlignment:
                                                          //       MainAxisAlignment
                                                          //           .start,
                                                          //   crossAxisAlignment:
                                                          //       CrossAxisAlignment
                                                          //           .start,
                                                          //   children: [
                                                          //     SizedBox(
                                                          //       width:
                                                          //           screenWidth *
                                                          //               0.050,
                                                          //       height:
                                                          //           screenHeight *
                                                          //               0.025,
                                                          //     ),
                                                          //     Text(
                                                          //         "Total Equity:",
                                                          //         style: TextStyle(
                                                          //             fontSize: 10 *
                                                          //                 textScale)),
                                                          //     SizedBox(
                                                          //       width:
                                                          //           screenWidth *
                                                          //               0.50,
                                                          //       height:
                                                          //           screenHeight *
                                                          //               0.020,
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          // Row(
                                                          //   children: [
                                                          //     SizedBox(
                                                          //       width:
                                                          //           screenWidth *
                                                          //               0.050,
                                                          //       height:
                                                          //           screenHeight *
                                                          //               0.025,
                                                          //     ),
                                                          //     Text("0.000",
                                                          //         style:
                                                          //             TextStyle(
                                                          //           fontSize: 20 *
                                                          //               textScale,
                                                          //         )),
                                                          //     SizedBox(
                                                          //       width:
                                                          //           screenWidth *
                                                          //               0.50,
                                                          //       height:
                                                          //           screenHeight *
                                                          //               0.020,
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          // Row(
                                                          //   children: [
                                                          //     SizedBox(
                                                          //       width:
                                                          //           screenWidth *
                                                          //               0.050,
                                                          //       height:
                                                          //           screenHeight *
                                                          //               0.025,
                                                          //     ),
                                                          //     Text("0.000",
                                                          //         style:
                                                          //             TextStyle(
                                                          //           fontSize: 10 *
                                                          //               textScale,
                                                          //         )),
                                                          //     SizedBox(
                                                          //       width:
                                                          //           screenWidth *
                                                          //               0.50,
                                                          //       height:
                                                          //           screenHeight *
                                                          //               0.020,
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ))))
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                            child: Center(
                                                child: SizedBox(
                                                    width: screenWidth * 0.375,
                                                    child: TextButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                        Color(0xFFf5f7fa),
                                                      )),
                                                      onPressed: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return SearchListWithdraw();
                                                        }));
                                                      },
                                                      child: Text(
                                                        'Convert',
                                                        style: TextStyle(
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ))))),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 5,
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                            child: Center(
                                                child: SizedBox(
                                                    width: screenWidth * 0.375,
                                                    child: TextButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                        Color(0xFFf5f7fa),
                                                      )),
                                                      onPressed: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return SearchListTransfer();
                                                        }));
                                                      },
                                                      child: Text(
                                                        'Transfer',
                                                        style: TextStyle(
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ))))),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                      ),
                                    ),
                                  ],
                                )
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
              Container(
                  height: screenHeight * 0.90,
                  child:
                      //            (state is _ErrorAuthState)
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

                      //   BlocConsumer<AccountBloc, AccountState>(
                      // listener: (context, state) {
                      //   // TODO: implement listener
                      // },
                      // builder: (context, state) {
                      //   return

                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 4,
                          padding: const EdgeInsets.all(6.0),
                          itemBuilder: (context, index) {
                            var bean = _list[index];
                            return Column(children: [
                              Row(children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.white70,
                                    // width: screenWidth * 0.880,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).push(MaterialPageRoute(
                                            builder: (context) {
                                          // return DetailPage(bean);
                                          return tokenDetail();
                                        }));
                                      },
                                      child: Column(children: [
                                        ListTile(
                                          title: Row(
                                            children: [
                                              Text("1EARTH",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black)),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.08)),
                                              Text("Available",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black38))
                                            ],
                                          ),
                                          subtitle: Row(
                                            children: [
                                              // Text("lorem",
                                              //     style: TextStyle(
                                              //       fontSize: 12 * textScale,
                                              //     )),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.08)),
                                              Text("0.00",
                                                  style: TextStyle(
                                                    fontSize: 12 * textScale,
                                                  ))
                                            ],
                                          ),
                                          trailing: Container(
                                              height: screenHeight * 0.048,
                                              width: screenWidth * 0.198,
                                              // color: Colors.grey[200],
                                              child: Column(children: [
                                                Text("Inorder",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            14 * textScale,
                                                        color: Colors.black38)),
                                                Expanded(
                                                    child: Container(
                                                  width: screenWidth * 0.08,
                                                )),
                                                Text("0.00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            12 * textScale,
                                                        color: Colors.black38))
                                              ])),
                                        )
                                      ]),
                                    ),
                                  ),
                                )
                              ])
                            ]);
                          })
                  // },
                  // )
                  ),
            ]));
  }
}

class Margin extends StatefulWidget {
  const Margin({Key? key}) : super(key: key);

  @override
  _MarginState createState() => _MarginState();
}

class _MarginState extends State<Margin> with TickerProviderStateMixin {
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
        body: ListView(
          controller: _controller,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          // padding: const EdgeInsets.all(8),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
              child: Container(
                // width: screenWidth * 1.2,
                color: theme.backgroundColor,
                height: screenHeight * 0.330,
                //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),

                child: DefaultTabController(
                  length: 2,
                  child: Container(
                      // color: theme.backgroundColor,
                      child: Column(children: <Widget>[
                    Container(
                      color: theme.backgroundColor,
                      constraints: const BoxConstraints.expand(height: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          indicatorColor: Colors.white,
                          labelColor: Colors.black38,
                          unselectedLabelColor: Colors.black54,
                          isScrollable: true,
                          tabs: <Widget>[
                            Tab(
                                child: Text('Cross',
                                    style:
                                        TextStyle(fontSize: 14 * textScale))),
                            Tab(
                                child: Text("Isolated",
                                    style:
                                        TextStyle(fontSize: 14 * textScale))),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        height: screenHeight * 0.30,
                        child:
                            //            (state is _ErrorAuthState)
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

                            //             // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                            //             // child: TabBarView(
                            //             //   controller: _nestedTabController,
                            //             //   children: <Widget>[
                            //             //     ListView.builder(
                            //             //       controller: _controller,
                            //             //       physics: const BouncingScrollPhysics(
                            //             //           parent: AlwaysScrollableScrollPhysics()),
                            //             //       scrollDirection: Axis.vertical,
                            //             //       itemCount: 8,
                            //             //       padding: const EdgeInsets.all(1.0),
                            //             //       itemBuilder: (context, index) {
                            //             //         var bean = _list[index];
                            //             //         return Container(
                            //             //           color: Colors.white70,
                            //             //           // width: screenWidth * 0.880,
                            //             //           child: InkWell(
                            //             //             onTap: () {
                            //             //               // Navigator.of(context,rootNavigator: true)
                            //             //               //     .push(MaterialPageRoute(builder: (context) {
                            //             //               //   // return DetailPage(bean);
                            //             //               //   return NftDetailsPage();
                            //             //               // }));
                            //             //             },
                            //             //             child: Column(children: [
                            //             //               ListTile(
                            //             //                 title: Row(
                            //             //                   children: [
                            //             //                     Text("lorem",
                            //             //                         style: TextStyle(
                            //             //                           fontSize: 16 * textScale,
                            //             //                           color: Colors.black87,
                            //             //                           fontWeight: FontWeight.w500,
                            //             //                         )),
                            //             //                     Expanded(
                            //             //                         child: Container(
                            //             //                             width:
                            //             //                                 screenWidth * 0.08)),
                            //             //                     Text(
                            //             //                       "lorem",
                            //             //                       style: TextStyle(
                            //             //                         fontSize: 16 * textScale,
                            //             //                         color: Colors.black87,
                            //             //                         fontWeight: FontWeight.w500,
                            //             //                       ),
                            //             //                     )
                            //             //                   ],
                            //             //                 ),
                            //             //                 subtitle: Row(
                            //             //                   children: [
                            //             //                     Text("lorem",
                            //             //                         style: TextStyle(
                            //             //                           fontSize: 12,
                            //             //                         )),
                            //             //                     Expanded(
                            //             //                         child: Container(
                            //             //                             width:
                            //             //                                 screenWidth * 0.08)),
                            //             //                     Text("lorem",
                            //             //                         style: TextStyle(
                            //             //                           fontSize: 12,
                            //             //                         ))
                            //             //                   ],
                            //             //                 ),
                            //             //               ),
                            //             //             ]),
                            //             //           ),
                            //             //         );
                            //             //       },
                            //             //     ),
                            //             //     ListView.builder(
                            //             //       controller: _controller,
                            //             //       physics: const BouncingScrollPhysics(
                            //             //           parent: AlwaysScrollableScrollPhysics()),
                            //             //       scrollDirection: Axis.vertical,
                            //             //       itemCount: 8,
                            //             //       padding: const EdgeInsets.all(1.0),
                            //             //       itemBuilder: (context, index) {
                            //             //         var bean = _list[index];
                            //             //         return Container(
                            //             //           color: Colors.white70,
                            //             //           // width: screenWidth * 0.880,
                            //             //           child: InkWell(
                            //             //             onTap: () {
                            //             //               // Navigator.of(context,rootNavigator: true)
                            //             //               //     .push(MaterialPageRoute(builder: (context) {
                            //             //               //   // return DetailPage(bean);
                            //             //               //   return NftDetailsPage();
                            //             //               // }));
                            //             //             },
                            //             //             child: Column(children: [
                            //             //               ListTile(
                            //             //                 title: Row(
                            //             //                   children: [
                            //             //                     Text("lorem",
                            //             //                         style: TextStyle(
                            //             //                           fontSize: 16 * textScale,
                            //             //                           color: Colors.black87,
                            //             //                           fontWeight: FontWeight.w500,
                            //             //                         )),
                            //             //                     Expanded(
                            //             //                         child: Container(
                            //             //                             width:
                            //             //                                 screenWidth * 0.08)),
                            //             //                     Text(
                            //             //                       "lorem",
                            //             //                       style: TextStyle(
                            //             //                         fontSize: 16 * textScale,
                            //             //                         color: Colors.black87,
                            //             //                         fontWeight: FontWeight.w500,
                            //             //                       ),
                            //             //                     )
                            //             //                   ],
                            //             //                 ),
                            //             //                 subtitle: Row(
                            //             //                   children: [
                            //             //                     Text("lorem",
                            //             //                         style: TextStyle(
                            //             //                           fontSize: 12,
                            //             //                         )),
                            //             //                     Expanded(
                            //             //                         child: Container(
                            //             //                             width:
                            //             //                                 screenWidth * 0.08)),
                            //             //                     Text("lorem",
                            //             //                         style: TextStyle(
                            //             //                           fontSize: 12,
                            //             //                         ))
                            //             //                   ],
                            //             //                 ),
                            //             //               ),
                            //             //             ]),
                            //             //           ),
                            //             //         );
                            //             //       },
                            //             //     ),
                            //             //     ListView.builder(
                            //             //       controller: _controller,
                            //             //       physics: const BouncingScrollPhysics(
                            //             //           parent: AlwaysScrollableScrollPhysics()),
                            //             //       scrollDirection: Axis.vertical,
                            //             //       itemCount: 8,
                            //             //       padding: const EdgeInsets.all(1.0),
                            //             //       itemBuilder: (context, index) {
                            //             //         var bean = _list[index];
                            //             //         return Container(
                            //             //           color: Colors.white70,
                            //             //           // width: screenWidth * 0.880,
                            //             //           child: InkWell(
                            //             //             onTap: () {
                            //             //               // Navigator.of(context,rootNavigator: true)
                            //             //               //     .push(MaterialPageRoute(builder: (context) {
                            //             //               //   // return DetailPage(bean);
                            //             //               //   return NftDetailsPage();
                            //             //               // }));
                            //             //             },
                            //             //             child: Column(children: [
                            //             //               ListTile(
                            //             //                 title: Row(
                            //             //                   children: [
                            //             //                     Text("lorem",
                            //             //                         style: TextStyle(
                            //             //                           fontSize: 16 * textScale,
                            //             //                           color: Colors.black87,
                            //             //                           fontWeight: FontWeight.w500,
                            //             //                         )),
                            //             //                     Expanded(
                            //             //                         child: Container(
                            //             //                             width:
                            //             //                                 screenWidth * 0.08)),
                            //             //                     Text(
                            //             //                       "lorem",
                            //             //                       style: TextStyle(
                            //             //                         fontSize: 16 * textScale,
                            //             //                         color: Colors.black87,
                            //             //                         fontWeight: FontWeight.w500,
                            //             //                       ),
                            //             //                     )
                            //             //                   ],
                            //             //                 ),
                            //             //                 subtitle: Row(
                            //             //                   children: [
                            //             //                     Text("lorem",
                            //             //                         style: TextStyle(
                            //             //                           fontSize: 12,
                            //             //                         )),
                            //             //                     Expanded(
                            //             //                         child: Container(
                            //             //                             width:
                            //             //                                 screenWidth * 0.08)),
                            //             //                     Text("lorem",
                            //             //                         style: TextStyle(
                            //             //                           fontSize: 12,
                            //             //                         ))
                            //             //                   ],
                            //             //                 ),
                            //             //               ),
                            //             //             ]),
                            //             //           ),
                            //             //         );
                            //             //       },
                            //             //     ),

                            //             //   ],
                            //             // ),

                            // ),

                            // :

                            //     BlocConsumer<AccountBloc, AccountState>(
                            //         listener: (context, state) {
                            //   // TODO: implement listener
                            // }, builder: (context, state) {
                            //   return

                            TabBarView(children: [
                          Card(
                            color: theme.scaffoldBackgroundColor,
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                ListTile(
                                  title: Row(children: const [
                                    Text('Total Assets',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(left: 135.0)),
                                  ]),
                                ),
                                // Divider(
                                //   color: Colors.blueGrey[100],
                                //   height: 2,
                                //   thickness: 1,
                                //   indent: 0,
                                //   endIndent: 0,
                                // ),

                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    const Padding(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 1,
                                            left: 12,
                                            right: 12),
                                        child: Text(
                                          "Available Balance ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                            width: screenWidth * 0.65)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    const Padding(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 1,
                                            left: 12,
                                            right: 12),
                                        child: Text(
                                          ":0.00 USD",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                            width: screenWidth * 0.65)),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    const Padding(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 1,
                                            left: 12,
                                            right: 12),
                                        child: Text(
                                          ":0.0000 BTC",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                            width: screenWidth * 0.65)),
                                  ],
                                ),
                                ListTile(
                                    title: Row(children: [
                                      Text(
                                        "Liabilties         ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Debt Assets",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      )
                                    ]),
                                    subtitle: Row(children: [
                                      Text(
                                        "0.00         ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "             0.00",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      )
                                    ])),
                              ],
                            ),
                          ),
                          Card(
                            color: theme.scaffoldBackgroundColor,
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                ListTile(
                                  title: Row(children: const [
                                    Text('Total Assets',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(left: 135.0)),
                                  ]),
                                ),
                                // Divider(
                                //   color: Colors.blueGrey[100],
                                //   height: 2,
                                //   thickness: 1,
                                //   indent: 0,
                                //   endIndent: 0,
                                // ),

                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    const Padding(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 1,
                                            left: 12,
                                            right: 12),
                                        child: Text(
                                          "Available Balance ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                            width: screenWidth * 0.65)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    const Padding(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 1,
                                            left: 12,
                                            right: 12),
                                        child: Text(
                                          ":0.00 USD",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                            width: screenWidth * 0.65)),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    const Padding(
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 1,
                                            left: 12,
                                            right: 12),
                                        child: Text(
                                          ":0.0000 BTC",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        )),
                                    Expanded(
                                        child: Container(
                                            width: screenWidth * 0.65)),
                                  ],
                                ),
                                ListTile(
                                    title: Row(children: [
                                      Text(
                                        "Liabilties         ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Net Assets",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      )
                                    ]),
                                    subtitle: Row(children: [
                                      Text(
                                        "0.00         ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "             0.00",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      )
                                    ])),
                              ],
                            ),
                          ),
                        ])

                        // })
                        ),
                  ])),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                        height: screenHeight * 0.10,
                        width: screenWidth * 0.910,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Container(
                                          height: screenHeight * 0.020,
                                          width: screenWidth * 0.910,
                                          // color: Colors.grey,
                                          child: InkWell(
                                              onTap: () {
                                                // Navigator.of(context,rootNavigator: true)
                                                //     .push(MaterialPageRoute(builder: (context) {
                                                //   return help2();
                                                // }));
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // Row(
                                                        //   mainAxisAlignment:
                                                        //       MainAxisAlignment
                                                        //           .start,
                                                        //   crossAxisAlignment:
                                                        //       CrossAxisAlignment
                                                        //           .start,
                                                        //   children: [
                                                        //     SizedBox(
                                                        //       width:
                                                        //           screenWidth *
                                                        //               0.050,
                                                        //       height:
                                                        //           screenHeight *
                                                        //               0.025,
                                                        //     ),
                                                        //     Text(
                                                        //         "Total Equity:",
                                                        //         style: TextStyle(
                                                        //             fontSize: 10 *
                                                        //                 textScale)),
                                                        //     SizedBox(
                                                        //       width:
                                                        //           screenWidth *
                                                        //               0.50,
                                                        //       height:
                                                        //           screenHeight *
                                                        //               0.020,
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     SizedBox(
                                                        //       width:
                                                        //           screenWidth *
                                                        //               0.050,
                                                        //       height:
                                                        //           screenHeight *
                                                        //               0.025,
                                                        //     ),
                                                        //     Text("0.000",
                                                        //         style:
                                                        //             TextStyle(
                                                        //           fontSize: 20 *
                                                        //               textScale,
                                                        //         )),
                                                        //     SizedBox(
                                                        //       width:
                                                        //           screenWidth *
                                                        //               0.50,
                                                        //       height:
                                                        //           screenHeight *
                                                        //               0.020,
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     SizedBox(
                                                        //       width:
                                                        //           screenWidth *
                                                        //               0.050,
                                                        //       height:
                                                        //           screenHeight *
                                                        //               0.025,
                                                        //     ),
                                                        //     Text("0.000",
                                                        //         style:
                                                        //             TextStyle(
                                                        //           fontSize: 10 *
                                                        //               textScale,
                                                        //         )),
                                                        //     SizedBox(
                                                        //       width:
                                                        //           screenWidth *
                                                        //               0.50,
                                                        //       height:
                                                        //           screenHeight *
                                                        //               0.020,
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ))))
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          child: Center(
                                              child: SizedBox(
                                                  width: screenWidth * 0.250,
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                      Color(0xFFf5f7fa),
                                                    )),
                                                    onPressed: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                        return SearchListBorrow();
                                                      }));
                                                    },
                                                    child: Text(
                                                      'Borrow',
                                                      style: TextStyle(
                                                          fontSize:
                                                              14 * textScale,
                                                          color: Colors.black),
                                                    ),
                                                  ))))),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          child: Center(
                                              child: SizedBox(
                                                  width: screenWidth * 0.250,
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                      Color(0xFFf5f7fa),
                                                    )),
                                                    onPressed: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                        return SearchListRepay();
                                                      }));
                                                    },
                                                    child: Text(
                                                      'Repay',
                                                      style: TextStyle(
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black),
                                                    ),
                                                  ))))),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          child: Center(
                                              child: SizedBox(
                                                  width: screenWidth * 0.250,
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                      Color(0xFFf5f7fa),
                                                    )),
                                                    onPressed: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                        return SearchListTransfer();
                                                      }));
                                                    },
                                                    child: Text(
                                                      'Transfer',
                                                      style: TextStyle(
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black),
                                                    ),
                                                  ))))),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                  ),
                                ],
                              )
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
            DefaultTabController(
              length: 2,
              child: Container(
                  // color: theme.backgroundColor,
                  child: Column(children: <Widget>[
                Container(
                  color: theme.backgroundColor,
                  constraints: const BoxConstraints.expand(height: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      indicatorColor: Colors.white,
                      labelColor: Colors.black38,
                      unselectedLabelColor: Colors.black54,
                      isScrollable: true,
                      tabs: <Widget>[
                        Tab(
                            child: Text('Cross',
                                style: TextStyle(fontSize: 14 * textScale))),
                        Tab(
                            child: Text("Isolated",
                                style: TextStyle(fontSize: 14 * textScale))),
                      ],
                    ),
                  ),
                ),
                Container(
                    height: screenHeight * 0.80,
                    child:
                        //            (state is _ErrorAuthState)
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

                        //             // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                        //             // child: TabBarView(
                        //             //   controller: _nestedTabController,
                        //             //   children: <Widget>[
                        //             //     ListView.builder(
                        //             //       controller: _controller,
                        //             //       physics: const BouncingScrollPhysics(
                        //             //           parent: AlwaysScrollableScrollPhysics()),
                        //             //       scrollDirection: Axis.vertical,
                        //             //       itemCount: 8,
                        //             //       padding: const EdgeInsets.all(1.0),
                        //             //       itemBuilder: (context, index) {
                        //             //         var bean = _list[index];
                        //             //         return Container(
                        //             //           color: Colors.white70,
                        //             //           // width: screenWidth * 0.880,
                        //             //           child: InkWell(
                        //             //             onTap: () {
                        //             //               // Navigator.of(context,rootNavigator: true)
                        //             //               //     .push(MaterialPageRoute(builder: (context) {
                        //             //               //   // return DetailPage(bean);
                        //             //               //   return NftDetailsPage();
                        //             //               // }));
                        //             //             },
                        //             //             child: Column(children: [
                        //             //               ListTile(
                        //             //                 title: Row(
                        //             //                   children: [
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 16 * textScale,
                        //             //                           color: Colors.black87,
                        //             //                           fontWeight: FontWeight.w500,
                        //             //                         )),
                        //             //                     Expanded(
                        //             //                         child: Container(
                        //             //                             width:
                        //             //                                 screenWidth * 0.08)),
                        //             //                     Text(
                        //             //                       "lorem",
                        //             //                       style: TextStyle(
                        //             //                         fontSize: 16 * textScale,
                        //             //                         color: Colors.black87,
                        //             //                         fontWeight: FontWeight.w500,
                        //             //                       ),
                        //             //                     )
                        //             //                   ],
                        //             //                 ),
                        //             //                 subtitle: Row(
                        //             //                   children: [
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 12,
                        //             //                         )),
                        //             //                     Expanded(
                        //             //                         child: Container(
                        //             //                             width:
                        //             //                                 screenWidth * 0.08)),
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 12,
                        //             //                         ))
                        //             //                   ],
                        //             //                 ),
                        //             //               ),
                        //             //             ]),
                        //             //           ),
                        //             //         );
                        //             //       },
                        //             //     ),
                        //             //     ListView.builder(
                        //             //       controller: _controller,
                        //             //       physics: const BouncingScrollPhysics(
                        //             //           parent: AlwaysScrollableScrollPhysics()),
                        //             //       scrollDirection: Axis.vertical,
                        //             //       itemCount: 8,
                        //             //       padding: const EdgeInsets.all(1.0),
                        //             //       itemBuilder: (context, index) {
                        //             //         var bean = _list[index];
                        //             //         return Container(
                        //             //           color: Colors.white70,
                        //             //           // width: screenWidth * 0.880,
                        //             //           child: InkWell(
                        //             //             onTap: () {
                        //             //               // Navigator.of(context,rootNavigator: true)
                        //             //               //     .push(MaterialPageRoute(builder: (context) {
                        //             //               //   // return DetailPage(bean);
                        //             //               //   return NftDetailsPage();
                        //             //               // }));
                        //             //             },
                        //             //             child: Column(children: [
                        //             //               ListTile(
                        //             //                 title: Row(
                        //             //                   children: [
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 16 * textScale,
                        //             //                           color: Colors.black87,
                        //             //                           fontWeight: FontWeight.w500,
                        //             //                         )),
                        //             //                     Expanded(
                        //             //                         child: Container(
                        //             //                             width:
                        //             //                                 screenWidth * 0.08)),
                        //             //                     Text(
                        //             //                       "lorem",
                        //             //                       style: TextStyle(
                        //             //                         fontSize: 16 * textScale,
                        //             //                         color: Colors.black87,
                        //             //                         fontWeight: FontWeight.w500,
                        //             //                       ),
                        //             //                     )
                        //             //                   ],
                        //             //                 ),
                        //             //                 subtitle: Row(
                        //             //                   children: [
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 12,
                        //             //                         )),
                        //             //                     Expanded(
                        //             //                         child: Container(
                        //             //                             width:
                        //             //                                 screenWidth * 0.08)),
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 12,
                        //             //                         ))
                        //             //                   ],
                        //             //                 ),
                        //             //               ),
                        //             //             ]),
                        //             //           ),
                        //             //         );
                        //             //       },
                        //             //     ),
                        //             //     ListView.builder(
                        //             //       controller: _controller,
                        //             //       physics: const BouncingScrollPhysics(
                        //             //           parent: AlwaysScrollableScrollPhysics()),
                        //             //       scrollDirection: Axis.vertical,
                        //             //       itemCount: 8,
                        //             //       padding: const EdgeInsets.all(1.0),
                        //             //       itemBuilder: (context, index) {
                        //             //         var bean = _list[index];
                        //             //         return Container(
                        //             //           color: Colors.white70,
                        //             //           // width: screenWidth * 0.880,
                        //             //           child: InkWell(
                        //             //             onTap: () {
                        //             //               // Navigator.of(context,rootNavigator: true)
                        //             //               //     .push(MaterialPageRoute(builder: (context) {
                        //             //               //   // return DetailPage(bean);
                        //             //               //   return NftDetailsPage();
                        //             //               // }));
                        //             //             },
                        //             //             child: Column(children: [
                        //             //               ListTile(
                        //             //                 title: Row(
                        //             //                   children: [
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 16 * textScale,
                        //             //                           color: Colors.black87,
                        //             //                           fontWeight: FontWeight.w500,
                        //             //                         )),
                        //             //                     Expanded(
                        //             //                         child: Container(
                        //             //                             width:
                        //             //                                 screenWidth * 0.08)),
                        //             //                     Text(
                        //             //                       "lorem",
                        //             //                       style: TextStyle(
                        //             //                         fontSize: 16 * textScale,
                        //             //                         color: Colors.black87,
                        //             //                         fontWeight: FontWeight.w500,
                        //             //                       ),
                        //             //                     )
                        //             //                   ],
                        //             //                 ),
                        //             //                 subtitle: Row(
                        //             //                   children: [
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 12,
                        //             //                         )),
                        //             //                     Expanded(
                        //             //                         child: Container(
                        //             //                             width:
                        //             //                                 screenWidth * 0.08)),
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 12,
                        //             //                         ))
                        //             //                   ],
                        //             //                 ),
                        //             //               ),
                        //             //             ]),
                        //             //           ),
                        //             //         );
                        //             //       },
                        //             //     ),

                        //             //   ],
                        //             // ),

                        // ),

                        // :

                        //     BlocConsumer<AccountBloc, AccountState>(
                        //         listener: (context, state) {
                        //   // TODO: implement listener
                        // }, builder: (context, state) {
                        //   return

                        TabBarView(children: [
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 4,
                          padding: const EdgeInsets.all(6.0),
                          itemBuilder: (context, index) {
                            var bean = _list[index];
                            return Column(children: [
                              Row(children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.white70,
                                    // width: screenWidth * 0.880,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).push(MaterialPageRoute(
                                            builder: (context) {
                                          // return DetailPage(bean);
                                          return tokenDetail();
                                        }));
                                      },
                                      child: Column(children: [
                                        ListTile(
                                          title: Row(
                                            children: [
                                              Text("1EARTH",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black)),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.08)),
                                              Text("Available",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black38))
                                            ],
                                          ),
                                          subtitle: Row(
                                            children: [
                                              // Text("lorem",
                                              //     style: TextStyle(
                                              //       fontSize: 12 * textScale,
                                              //     )),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.08)),
                                              Text("0.00",
                                                  style: TextStyle(
                                                    fontSize: 12 * textScale,
                                                  ))
                                            ],
                                          ),
                                          trailing: Container(
                                              height: screenHeight * 0.048,
                                              width: screenWidth * 0.198,
                                              // color: Colors.grey[200],
                                              child: Column(children: [
                                                Text("Inorder",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            14 * textScale,
                                                        color: Colors.black38)),
                                                Expanded(
                                                    child: Container(
                                                  width: screenWidth * 0.08,
                                                )),
                                                Text("0.00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            12 * textScale,
                                                        color: Colors.black38))
                                              ])),
                                        )
                                      ]),
                                    ),
                                  ),
                                )
                              ])
                            ]);
                          }),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 4,
                          padding: const EdgeInsets.all(6.0),
                          itemBuilder: (context, index) {
                            var bean = _list[index];
                            return Column(children: [
                              Row(children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.white70,
                                    // width: screenWidth * 0.880,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).push(MaterialPageRoute(
                                            builder: (context) {
                                          // return DetailPage(bean);
                                          return tokenDetail();
                                        }));
                                      },
                                      child: Column(children: [
                                        ListTile(
                                          title: Row(
                                            children: [
                                              Text("1EARTH",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black)),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.08)),
                                              Text("InOrders",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black38))
                                            ],
                                          ),
                                          subtitle: Row(
                                            children: [
                                              Text("0.00",
                                                  style: TextStyle(
                                                    fontSize: 12 * textScale,
                                                  )),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.08)),
                                              Text("0.00",
                                                  style: TextStyle(
                                                    fontSize: 12 * textScale,
                                                  ))
                                            ],
                                          ),
                                          trailing: Container(
                                              height: screenHeight * 0.048,
                                              width: screenWidth * 0.198,
                                              // color: Colors.grey[200],
                                              child: Column(children: [
                                                Text("Liabilities",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            14 * textScale,
                                                        color: Colors.black38)),
                                                Expanded(
                                                    child: Container(
                                                  width: screenWidth * 0.08,
                                                )),
                                                Text("0.00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            12 * textScale,
                                                        color: Colors.black38))
                                              ])),
                                        )
                                      ]),
                                    ),
                                  ),
                                )
                              ])
                            ]);
                          })
                    ])

                    // })
                    ),
              ])),
            ),
          ],
        ));
  }
}

class Earn extends StatefulWidget {
  const Earn({Key? key}) : super(key: key);

  @override
  _EarnState createState() => _EarnState();
}

class _EarnState extends State<Earn> with TickerProviderStateMixin {
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
        body: ListView(
          controller: _controller,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          // padding: const EdgeInsets.all(8),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
              child: Container(
                // width: screenWidth * 1.2,
                color: theme.backgroundColor,
                height: screenHeight * 0.255,
                //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),

                child: Card(
                  color: theme.scaffoldBackgroundColor,
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Row(children: const [
                          Text('Total Assets',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                          Padding(padding: EdgeInsets.only(left: 135.0)),
                        ]),
                      ),
                      // Divider(
                      //   color: Colors.blueGrey[100],
                      //   height: 2,
                      //   thickness: 1,
                      //   indent: 0,
                      //   endIndent: 0,
                      // ),

                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5)),
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 1, left: 12, right: 12),
                              child: Text(
                                "Available Balance ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              )),
                          Expanded(child: Container(width: screenWidth * 0.65)),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5)),
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 1, left: 12, right: 12),
                              child: Text(
                                ":0.00 USD",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              )),
                          Expanded(child: Container(width: screenWidth * 0.65)),
                        ],
                      ),

                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5)),
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 1, left: 12, right: 12),
                              child: Text(
                                ":0.0000 BTC",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              )),
                          Expanded(child: Container(width: screenWidth * 0.65)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                        height: screenHeight * 0.10,
                        width: screenWidth * 0.910,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Container(
                                          height: screenHeight * 0.020,
                                          width: screenWidth * 0.910,
                                          // color: Colors.grey,
                                          child: InkWell(
                                              onTap: () {
                                                // Navigator.of(context,rootNavigator: true)
                                                //     .push(MaterialPageRoute(builder: (context) {
                                                //   return help2();
                                                // }));
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // Row(
                                                        //   mainAxisAlignment:
                                                        //       MainAxisAlignment
                                                        //           .start,
                                                        //   crossAxisAlignment:
                                                        //       CrossAxisAlignment
                                                        //           .start,
                                                        //   children: [
                                                        //     SizedBox(
                                                        //       width:
                                                        //           screenWidth *
                                                        //               0.050,
                                                        //       height:
                                                        //           screenHeight *
                                                        //               0.025,
                                                        //     ),
                                                        //     Text(
                                                        //         "Total Equity:",
                                                        //         style: TextStyle(
                                                        //             fontSize: 10 *
                                                        //                 textScale)),
                                                        //     SizedBox(
                                                        //       width:
                                                        //           screenWidth *
                                                        //               0.50,
                                                        //       height:
                                                        //           screenHeight *
                                                        //               0.020,
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     SizedBox(
                                                        //       width:
                                                        //           screenWidth *
                                                        //               0.050,
                                                        //       height:
                                                        //           screenHeight *
                                                        //               0.025,
                                                        //     ),
                                                        //     Text("0.000",
                                                        //         style:
                                                        //             TextStyle(
                                                        //           fontSize: 20 *
                                                        //               textScale,
                                                        //         )),
                                                        //     SizedBox(
                                                        //       width:
                                                        //           screenWidth *
                                                        //               0.50,
                                                        //       height:
                                                        //           screenHeight *
                                                        //               0.020,
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     SizedBox(
                                                        //       width:
                                                        //           screenWidth *
                                                        //               0.050,
                                                        //       height:
                                                        //           screenHeight *
                                                        //               0.025,
                                                        //     ),
                                                        //     Text("0.000",
                                                        //         style:
                                                        //             TextStyle(
                                                        //           fontSize: 10 *
                                                        //               textScale,
                                                        //         )),
                                                        //     SizedBox(
                                                        //       width:
                                                        //           screenWidth *
                                                        //               0.50,
                                                        //       height:
                                                        //           screenHeight *
                                                        //               0.020,
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ))))
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          child: Center(
                                              child: SizedBox(
                                                  width: screenWidth * 0.450,
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                      Color(0xFFf5f7fa),
                                                    )),
                                                    onPressed: () {
                                                      // Navigator.of(context,
                                                      //         rootNavigator:
                                                      //             true)
                                                      //     .push(
                                                      //         MaterialPageRoute(
                                                      //             builder:
                                                      //                 (context) {
                                                      //   return SearchListEarn();
                                                      // }));
                                                    },
                                                    child: Text(
                                                      'Earn',
                                                      style: TextStyle(
                                                          fontSize:
                                                              14 * textScale,
                                                          color: Colors.black),
                                                    ),
                                                  ))))),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          child: Center(
                                              child: SizedBox(
                                                  width: screenWidth * 0.450,
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                      Color(0xFFf5f7fa),
                                                    )),
                                                    onPressed: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                        return SearchListTransfer();
                                                      }));
                                                    },
                                                    child: Text(
                                                      'Transfer',
                                                      style: TextStyle(
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black),
                                                    ),
                                                  ))))),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                  ),
                                ],
                              )
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
            DefaultTabController(
              length: 2,
              child: Container(
                  // color: theme.backgroundColor,
                  child: Column(children: <Widget>[
                Container(
                  color: theme.backgroundColor,
                  constraints: const BoxConstraints.expand(height: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      indicatorColor: Colors.white,
                      labelColor: Colors.black38,
                      unselectedLabelColor: Colors.black54,
                      isScrollable: true,
                      tabs: <Widget>[
                        Tab(
                            child: Text('Investment',
                                style: TextStyle(fontSize: 14 * textScale))),
                        Tab(
                            child: Text("Asset",
                                style: TextStyle(fontSize: 14 * textScale))),
                      ],
                    ),
                  ),
                ),
                Container(
                    height: screenHeight * 0.80,
                    child:
                        //            (state is _ErrorAuthState)
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

                        //             // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                        //             // child: TabBarView(
                        //             //   controller: _nestedTabController,
                        //             //   children: <Widget>[
                        //             //     ListView.builder(
                        //             //       controller: _controller,
                        //             //       physics: const BouncingScrollPhysics(
                        //             //           parent: AlwaysScrollableScrollPhysics()),
                        //             //       scrollDirection: Axis.vertical,
                        //             //       itemCount: 8,
                        //             //       padding: const EdgeInsets.all(1.0),
                        //             //       itemBuilder: (context, index) {
                        //             //         var bean = _list[index];
                        //             //         return Container(
                        //             //           color: Colors.white70,
                        //             //           // width: screenWidth * 0.880,
                        //             //           child: InkWell(
                        //             //             onTap: () {
                        //             //               // Navigator.of(context,rootNavigator: true)
                        //             //               //     .push(MaterialPageRoute(builder: (context) {
                        //             //               //   // return DetailPage(bean);
                        //             //               //   return NftDetailsPage();
                        //             //               // }));
                        //             //             },
                        //             //             child: Column(children: [
                        //             //               ListTile(
                        //             //                 title: Row(
                        //             //                   children: [
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 16 * textScale,
                        //             //                           color: Colors.black87,
                        //             //                           fontWeight: FontWeight.w500,
                        //             //                         )),
                        //             //                     Expanded(
                        //             //                         child: Container(
                        //             //                             width:
                        //             //                                 screenWidth * 0.08)),
                        //             //                     Text(
                        //             //                       "lorem",
                        //             //                       style: TextStyle(
                        //             //                         fontSize: 16 * textScale,
                        //             //                         color: Colors.black87,
                        //             //                         fontWeight: FontWeight.w500,
                        //             //                       ),
                        //             //                     )
                        //             //                   ],
                        //             //                 ),
                        //             //                 subtitle: Row(
                        //             //                   children: [
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 12,
                        //             //                         )),
                        //             //                     Expanded(
                        //             //                         child: Container(
                        //             //                             width:
                        //             //                                 screenWidth * 0.08)),
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 12,
                        //             //                         ))
                        //             //                   ],
                        //             //                 ),
                        //             //               ),
                        //             //             ]),
                        //             //           ),
                        //             //         );
                        //             //       },
                        //             //     ),
                        //             //     ListView.builder(
                        //             //       controller: _controller,
                        //             //       physics: const BouncingScrollPhysics(
                        //             //           parent: AlwaysScrollableScrollPhysics()),
                        //             //       scrollDirection: Axis.vertical,
                        //             //       itemCount: 8,
                        //             //       padding: const EdgeInsets.all(1.0),
                        //             //       itemBuilder: (context, index) {
                        //             //         var bean = _list[index];
                        //             //         return Container(
                        //             //           color: Colors.white70,
                        //             //           // width: screenWidth * 0.880,
                        //             //           child: InkWell(
                        //             //             onTap: () {
                        //             //               // Navigator.of(context,rootNavigator: true)
                        //             //               //     .push(MaterialPageRoute(builder: (context) {
                        //             //               //   // return DetailPage(bean);
                        //             //               //   return NftDetailsPage();
                        //             //               // }));
                        //             //             },
                        //             //             child: Column(children: [
                        //             //               ListTile(
                        //             //                 title: Row(
                        //             //                   children: [
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 16 * textScale,
                        //             //                           color: Colors.black87,
                        //             //                           fontWeight: FontWeight.w500,
                        //             //                         )),
                        //             //                     Expanded(
                        //             //                         child: Container(
                        //             //                             width:
                        //             //                                 screenWidth * 0.08)),
                        //             //                     Text(
                        //             //                       "lorem",
                        //             //                       style: TextStyle(
                        //             //                         fontSize: 16 * textScale,
                        //             //                         color: Colors.black87,
                        //             //                         fontWeight: FontWeight.w500,
                        //             //                       ),
                        //             //                     )
                        //             //                   ],
                        //             //                 ),
                        //             //                 subtitle: Row(
                        //             //                   children: [
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 12,
                        //             //                         )),
                        //             //                     Expanded(
                        //             //                         child: Container(
                        //             //                             width:
                        //             //                                 screenWidth * 0.08)),
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 12,
                        //             //                         ))
                        //             //                   ],
                        //             //                 ),
                        //             //               ),
                        //             //             ]),
                        //             //           ),
                        //             //         );
                        //             //       },
                        //             //     ),
                        //             //     ListView.builder(
                        //             //       controller: _controller,
                        //             //       physics: const BouncingScrollPhysics(
                        //             //           parent: AlwaysScrollableScrollPhysics()),
                        //             //       scrollDirection: Axis.vertical,
                        //             //       itemCount: 8,
                        //             //       padding: const EdgeInsets.all(1.0),
                        //             //       itemBuilder: (context, index) {
                        //             //         var bean = _list[index];
                        //             //         return Container(
                        //             //           color: Colors.white70,
                        //             //           // width: screenWidth * 0.880,
                        //             //           child: InkWell(
                        //             //             onTap: () {
                        //             //               // Navigator.of(context,rootNavigator: true)
                        //             //               //     .push(MaterialPageRoute(builder: (context) {
                        //             //               //   // return DetailPage(bean);
                        //             //               //   return NftDetailsPage();
                        //             //               // }));
                        //             //             },
                        //             //             child: Column(children: [
                        //             //               ListTile(
                        //             //                 title: Row(
                        //             //                   children: [
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 16 * textScale,
                        //             //                           color: Colors.black87,
                        //             //                           fontWeight: FontWeight.w500,
                        //             //                         )),
                        //             //                     Expanded(
                        //             //                         child: Container(
                        //             //                             width:
                        //             //                                 screenWidth * 0.08)),
                        //             //                     Text(
                        //             //                       "lorem",
                        //             //                       style: TextStyle(
                        //             //                         fontSize: 16 * textScale,
                        //             //                         color: Colors.black87,
                        //             //                         fontWeight: FontWeight.w500,
                        //             //                       ),
                        //             //                     )
                        //             //                   ],
                        //             //                 ),
                        //             //                 subtitle: Row(
                        //             //                   children: [
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 12,
                        //             //                         )),
                        //             //                     Expanded(
                        //             //                         child: Container(
                        //             //                             width:
                        //             //                                 screenWidth * 0.08)),
                        //             //                     Text("lorem",
                        //             //                         style: TextStyle(
                        //             //                           fontSize: 12,
                        //             //                         ))
                        //             //                   ],
                        //             //                 ),
                        //             //               ),
                        //             //             ]),
                        //             //           ),
                        //             //         );
                        //             //       },
                        //             //     ),

                        //             //   ],
                        //             // ),

                        // ),

                        // :

                        //     BlocConsumer<AccountBloc, AccountState>(
                        //         listener: (context, state) {
                        //   // TODO: implement listener
                        // }, builder: (context, state) {
                        //   return

                        TabBarView(children: [
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 4,
                          padding: const EdgeInsets.all(6.0),
                          itemBuilder: (context, index) {
                            var bean = _list[index];
                            return Column(children: [
                              Row(children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.white70,
                                    // width: screenWidth * 0.880,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).push(MaterialPageRoute(
                                            builder: (context) {
                                          // return DetailPage(bean);
                                          return earntokenDetail();
                                        }));
                                      },
                                      child: Column(children: [
                                        ListTile(
                                          title: Row(
                                            children: [
                                              Text("1EARTH",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black)),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.08)),
                                              Text("Available",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black38))
                                            ],
                                          ),
                                          subtitle: Row(
                                            children: [
                                              // Text("lorem",
                                              //     style: TextStyle(
                                              //       fontSize: 12 * textScale,
                                              //     )),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.08)),
                                              Text("0.00",
                                                  style: TextStyle(
                                                    fontSize: 12 * textScale,
                                                  ))
                                            ],
                                          ),
                                          trailing: Container(
                                              height: screenHeight * 0.048,
                                              width: screenWidth * 0.198,
                                              // color: Colors.grey[200],
                                              child: Column(children: [
                                                Text("Inorder",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            14 * textScale,
                                                        color: Colors.black38)),
                                                Expanded(
                                                    child: Container(
                                                  width: screenWidth * 0.08,
                                                )),
                                                Text("0.00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            12 * textScale,
                                                        color: Colors.black38))
                                              ])),
                                        )
                                      ]),
                                    ),
                                  ),
                                )
                              ])
                            ]);
                          }),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 4,
                          padding: const EdgeInsets.all(6.0),
                          itemBuilder: (context, index) {
                            var bean = _list[index];
                            return Column(children: [
                              Row(children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.white70,
                                    // width: screenWidth * 0.880,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).push(MaterialPageRoute(
                                            builder: (context) {
                                          // return DetailPage(bean);
                                          return margintokenDetail();
                                        }));
                                      },
                                      child: Column(children: [
                                        ListTile(
                                          title: Row(
                                            children: [
                                              Text("1EARTH",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black)),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.08)),
                                              Text("Available",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14 * textScale,
                                                      color: Colors.black38))
                                            ],
                                          ),
                                          subtitle: Row(
                                            children: [
                                              // Text("lorem",
                                              //     style: TextStyle(
                                              //       fontSize: 12 * textScale,
                                              //     )),
                                              Expanded(
                                                  child: Container(
                                                      width:
                                                          screenWidth * 0.08)),
                                              Text("0.00",
                                                  style: TextStyle(
                                                    fontSize: 12 * textScale,
                                                  ))
                                            ],
                                          ),
                                          trailing: Container(
                                              height: screenHeight * 0.048,
                                              width: screenWidth * 0.198,
                                              // color: Colors.grey[200],
                                              child: Column(children: [
                                                Text("Inorder",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            14 * textScale,
                                                        color: Colors.black38)),
                                                Expanded(
                                                    child: Container(
                                                  width: screenWidth * 0.08,
                                                )),
                                                Text("0.00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            12 * textScale,
                                                        color: Colors.black38))
                                              ])),
                                        )
                                      ]),
                                    ),
                                  ),
                                )
                              ])
                            ]);
                          })
                    ])

                    // })
                    ),
              ])),
            ),
          ],
        ));
  }
}

class Future extends StatefulWidget {
  const Future({Key? key}) : super(key: key);

  @override
  _FutureState createState() => _FutureState();
}

class _FutureState extends State<Future> with TickerProviderStateMixin {
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
        body: ListView(
          controller: _controller,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          // padding: const EdgeInsets.all(8),
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    child: Container(
                        height: screenHeight * 0.380,
                        width: screenWidth * 0.910,
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
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 12),
                                child: Container(
                                  // width: screenWidth * 1.2,
                                  color: theme.backgroundColor,
                                  height: screenHeight * 0.25,
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
                                          title: Row(children: const [
                                            Text('Total Assets',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 135.0)),
                                          ]),
                                        ),
                                        // Divider(
                                        //   color: Colors.blueGrey[100],
                                        //   height: 2,
                                        //   thickness: 1,
                                        //   indent: 0,
                                        //   endIndent: 0,
                                        // ),

                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Available Balance ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black,
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
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  ":0.00 USD",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
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
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  ":0.0000 BTC",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
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
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          child: Center(
                                              child: SizedBox(
                                                  width: screenWidth * 0.850,
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                      Color(0xFFf5f7fa),
                                                    )),
                                                    onPressed: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                        return SearchListTransfer();
                                                      }));
                                                    },
                                                    child: Text(
                                                      'Transfer',
                                                      style: TextStyle(
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black),
                                                    ),
                                                  ))))),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                  ),
                                ],
                              )
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
            Container(
                height: screenHeight * 0.80,
                child:
                    //            (state is _ErrorAuthState)
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
                    //   BlocConsumer<AccountBloc, AccountState>(
                    // listener: (context, state) {
                    //   // TODO: implement listener
                    // },
                    // builder: (context, state) {
                    //   return

                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 4,
                        padding: const EdgeInsets.all(6.0),
                        itemBuilder: (context, index) {
                          var bean = _list[index];
                          return Column(children: [
                            Row(children: [
                              Expanded(
                                child: Container(
                                  color: Colors.white70,
                                  // width: screenWidth * 0.880,
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.of(
                                      //   context,
                                      //   rootNavigator: true,
                                      // ).push(
                                      //     MaterialPageRoute(builder: (context) {
                                      //   // return DetailPage(bean);
                                      //   return tokenDetail();
                                      // }));
                                    },
                                    child: Column(children: [
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Text("Available        ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14 * textScale,
                                                    color: Colors.black)),
                                            Text("Positioned Margin",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14 * textScale,
                                                    color: Colors.black38))
                                          ],
                                        ),
                                        subtitle: Row(
                                          children: [
                                            Text("0.00                ",
                                                style: TextStyle(
                                                  fontSize: 12 * textScale,
                                                )),
                                            Text("    0.00",
                                                style: TextStyle(
                                                  fontSize: 12 * textScale,
                                                ))
                                          ],
                                        ),
                                        trailing: Container(
                                            height: screenHeight * 0.048,
                                            width: screenWidth * 0.210,
                                            // color: Colors.grey[200],
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Order Margin",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              14 * textScale,
                                                          color:
                                                              Colors.black38)),
                                                  Text("0.00",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              12 * textScale,
                                                          color:
                                                              Colors.black38))
                                                ])),
                                      )
                                    ]),
                                  ),
                                ),
                              )
                            ])
                          ]);
                        })
                // },
                // )
                ),
          ],
        ));
  }
}

class Bot extends StatefulWidget {
  const Bot({Key? key}) : super(key: key);

  @override
  _BotState createState() => _BotState();
}

class _BotState extends State<Bot> with TickerProviderStateMixin {
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
        body: ListView(
          controller: _controller,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          // padding: const EdgeInsets.all(8),
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    child: Container(
                        height: screenHeight * 0.365,
                        width: screenWidth * 0.910,
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
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 12),
                                child: Container(
                                  // width: screenWidth * 1.2,
                                  color: theme.backgroundColor,
                                  height: screenHeight * 0.255,
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
                                          title: Row(children: const [
                                            Text('Total Assets',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 135.0)),
                                          ]),
                                        ),
                                        // Divider(
                                        //   color: Colors.blueGrey[100],
                                        //   height: 2,
                                        //   thickness: 1,
                                        //   indent: 0,
                                        //   endIndent: 0,
                                        // ),

                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Available Balance ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black,
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
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  ":0.00 USD",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
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
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  ":0.0000 BTC",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
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
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          child: Center(
                                              child: SizedBox(
                                                  width: screenWidth * 0.850,
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                      Color(0xFFf5f7fa),
                                                    )),
                                                    onPressed: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                        return Settings();
                                                      }));
                                                    },
                                                    child: Text(
                                                      'Go',
                                                      style: TextStyle(
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black),
                                                    ),
                                                  ))))),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                  ),
                                ],
                              )
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
            Container(
                height: screenHeight * 0.80,
                child:
                    //            (state is _ErrorAuthState)
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
                    //   BlocConsumer<AccountBloc, AccountState>(
                    // listener: (context, state) {
                    //   // TODO: implement listener
                    // },
                    // builder: (context, state) {
                    //   return

                    ListView(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.all(6.0),
                        children: <Widget>[
                      Row(children: [
                        Expanded(
                          child: Container(
                            color: Colors.white70,
                            // width: screenWidth * 0.880,
                            child: InkWell(
                              onTap: () {
                                // Navigator.of(
                                //   context,
                                //   rootNavigator: true,
                                // ).push(
                                //     MaterialPageRoute(builder: (context) {
                                //   // return DetailPage(bean);
                                //   return tokenDetail();
                                // }));
                              },
                              child: Column(children: [
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text("Spot Grid",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14 * textScale,
                                              color: Colors.black)),
                                      Expanded(
                                          child: Container(
                                              width: screenWidth * 0.08)),
                                    ],
                                  ),
                                  subtitle: Column(children: [
                                    Row(
                                      children: [
                                        Text(
                                            "A shortable grid strategy that makes profits",
                                            style: TextStyle(
                                              fontSize: 12 * textScale,
                                            )),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            " from bpth upfronts and downfronts",
                                            style: TextStyle(
                                              fontSize: 12 * textScale,
                                            )),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                      ],
                                    ),
                                  ]),
                                  trailing: Container(
                                      height: screenHeight * 0.025,
                                      width: screenWidth * 0.198,
                                      // color: Colors.grey[200],
                                      child: Column(children: [
                                        Text("Create  ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                                color: Colors.black)),
                                        Expanded(
                                            child: Container(
                                          width: screenWidth * 0.08,
                                        )),
                                      ])),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text("Spot DCA",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14 * textScale,
                                              color: Colors.black)),
                                      Expanded(
                                          child: Container(
                                              width: screenWidth * 0.08)),
                                    ],
                                  ),
                                  subtitle: Column(children: [
                                    Row(
                                      children: [
                                        Text(
                                            "A shortable grid strategy that makes profits",
                                            style: TextStyle(
                                              fontSize: 12 * textScale,
                                            )),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            " from bpth upfronts and downfronts",
                                            style: TextStyle(
                                              fontSize: 12 * textScale,
                                            )),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                      ],
                                    ),
                                  ]),
                                  trailing: Container(
                                      height: screenHeight * 0.025,
                                      width: screenWidth * 0.198,
                                      // color: Colors.grey[200],
                                      child: Column(children: [
                                        Text("Create  ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                                color: Colors.black)),
                                        Expanded(
                                            child: Container(
                                          width: screenWidth * 0.08,
                                        )),
                                      ])),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text("Future Grid",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14 * textScale,
                                              color: Colors.black)),
                                      Expanded(
                                          child: Container(
                                              width: screenWidth * 0.08)),
                                    ],
                                  ),
                                  subtitle: Column(children: [
                                    Row(
                                      children: [
                                        Text(
                                            "Suitable for volatile markets.Automatically ",
                                            style: TextStyle(
                                              fontSize: 12 * textScale,
                                            )),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Sells high and buys low ",
                                            style: TextStyle(
                                              fontSize: 12 * textScale,
                                            )),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                      ],
                                    ),
                                  ]),
                                  trailing: Container(
                                      height: screenHeight * 0.025,
                                      width: screenWidth * 0.198,
                                      // color: Colors.grey[200],
                                      child: Column(children: [
                                        Text("Create  ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                                color: Colors.black)),
                                        Expanded(
                                            child: Container(
                                          width: screenWidth * 0.08,
                                        )),
                                      ])),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      Text("Future DCA",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14 * textScale,
                                              color: Colors.black)),
                                      Expanded(
                                          child: Container(
                                              width: screenWidth * 0.08)),
                                    ],
                                  ),
                                  subtitle: Column(children: [
                                    Row(
                                      children: [
                                        Text(
                                            "a Shortable grid strategy that makes profits",
                                            style: TextStyle(
                                              fontSize: 12 * textScale,
                                            )),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "  from  both upfronts and downstairs ",
                                            style: TextStyle(
                                              fontSize: 12 * textScale,
                                            )),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                      ],
                                    ),
                                  ]),
                                  trailing: Container(
                                      height: screenHeight * 0.025,
                                      width: screenWidth * 0.198,
                                      // color: Colors.grey[200],
                                      child: Column(children: [
                                        Text("Create  ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                                color: Colors.black)),
                                        Expanded(
                                            child: Container(
                                          width: screenWidth * 0.08,
                                        )),
                                      ])),
                                ),
                              ]),
                            ),
                          ),
                        )
                      ])
                    ]))
            // },
            // )
          ],
        ));
  }
}

class Account extends StatefulWidget {
  Account();

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _AccountMobile(),
          tablet: _AccountTablet(),
        ),
      ),
    );
  }
}

class _AccountTablet extends StatefulWidget {
  _AccountTablet();

  @override
  __AccountTabletState createState() => __AccountTabletState();
}

class __AccountTabletState extends State<_AccountTablet> {
  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    List<TravelBean> _list = TravelBean.generateMostPopularBean();

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          elevation: 0.2,
          bottomOpacity: 1.0,
          shadowColor: theme.scaffoldBackgroundColor,
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: TabBar(
            overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
            indicatorColor: Colors.white,
            labelColor: Colors.black87,
            automaticIndicatorColorAdjustment: true,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                  child: Text('Main',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
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
                  child: Text('Future',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
              Tab(
                  child: Text('Earn',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
              Tab(
                  child: Text('Bot',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
            ],
          ),
        ),
        body: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: TabBarView(
            children: <Widget>[
              Main(),
              Spot(),
              Margin(),
              Future(),
              Options(),
              Earn(),
              Bot(),
            ],
          ),
        ),
        // bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}

class _AccountMobile extends StatefulWidget {
  _AccountMobile();

  @override
  _AccountMobileState createState() => _AccountMobileState();
  final List<String> list = List.generate(10, (index) => "nutrinax $index");
}

class _AccountMobileState extends State<_AccountMobile> {
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
    final ScrollController _controller = ScrollController();

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    final _formKey = GlobalKey<FormBuilderState>();

    final _formKey2 = GlobalKey<FormBuilderState>();

    List<TravelBean> _list = TravelBean.generateMostPopularBean();

    return Container(
        child:

            //  (state is AuthAuthenticatedState)
            // ?
            DefaultTabController(
                length: 7,
                child: Scaffold(
                  backgroundColor: theme.backgroundColor,
                  appBar: AppBar(
                    elevation: 0.2,
                    bottomOpacity: 1.0,
                    shadowColor: theme.scaffoldBackgroundColor,
                    backgroundColor: theme.scaffoldBackgroundColor,
                    automaticallyImplyLeading: false,
                    title: TabBar(
                      overlayColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                      indicatorColor: Colors.white,
                      labelColor: Colors.black87,
                      automaticIndicatorColorAdjustment: true,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                            child: Text('Main',
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                ))),
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
                            child: Text('Options',
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                ))),
                        Tab(
                            child: Text('Earn',
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                ))),
                        Tab(
                            child: Text('Bot',
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                ))),
                      ],
                    ),
                  ),
                  body: Scaffold(
                    backgroundColor: theme.backgroundColor,
                    body: TabBarView(
                      children: <Widget>[
                        Main(),
                        Spot(),
                        Margin(),
                        Future(),
                        Options(),
                        Earn(),
                        Bot(),
                      ],
                    ),
                  ),
                  // bottomNavigationBar: CustomBottomNavBar(),
                )));
    // :

//              DefaultTabController(
//       length: 2,
//       child:  Container(
//               color: theme.backgroundColor,
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(height: screenHeight * 0.05),
//                   Row(
//                     children: [
//                       const Padding(padding: EdgeInsets.only(left: 350.0)),
//                       Container(
//                         height: screenHeight * 0.020,
//                         alignment: Alignment.topLeft,
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Icon(Icons.close_rounded, size: 22),
//                         ),
//                       ),
//                       Expanded(child: Container(width: screenWidth * 0.65)),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 30),
//                         child: Text(
//                           'SignIn',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black,
//                               fontSize: 28 * textScale),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 30),
//                         child: Text(
//                           'Lets get Started',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 14 * textScale,
//                             color: Colors.blueGrey,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(children: [
//                     Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 12,
//                         ),
//                         child: Container(
//                           color: theme.backgroundColor,
//                           constraints: const BoxConstraints.expand(height: 50),
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: TabBar(
//                               padding: EdgeInsets.symmetric(horizontal: 10),
//                               indicatorColor: Colors.white,
//                               labelColor: Colors.lightBlue,
//                               unselectedLabelColor: Colors.black54,
//                               isScrollable: true,
//                               tabs: <Widget>[
//                                 Tab(
//                                     child: Text('Email',
//                                         style: TextStyle(
//                                             color: Colors.blueGrey,
//                                             fontSize: 14 * textScale))),
//                                 Tab(
//                                     child: Text("Phone",
//                                         style: TextStyle(
//                                             color: Colors.blueGrey,
//                                             fontSize: 14 * textScale))),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ]),
//                   Expanded(
//                     child: Container(
//                       color: theme.backgroundColor,
//                       child: TabBarView(children: [
//                         FormBuilder(
//                           key: _formKey,
//                         skipDisabled: true,
//                           child: SingleChildScrollView(
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   SizedBox(
//                                     height: screenHeight * 0.010,
//                                   ),
//                                   Row(children: [
//                                     Expanded(
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 32,
//                                         ),
//                                         child: Container(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 8),
//                                           height: screenHeight * 0.055,
//                                           color: theme.scaffoldBackgroundColor,
//                                           width: screenWidth * 0.750,
//                                           child: FormBuilderTextField(
//                                           name: 'email',
//                                           decoration: const InputDecoration(
//                                             contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 8),
//  labelStyle: TextStyle(fontSize: 14,color:Colors.blueGrey),                                            labelText: "Email Address",
//                                                                                   border: InputBorder.none,

//                                             // errorText: field.errorText != null ? Text(field.errorText!) : null,

//                                             // errorText: _emailError,
//                                           ),
//                                           validator:
//                                               FormBuilderValidators.compose([
//                                             FormBuilderValidators.required(),
//                                             FormBuilderValidators.email(),
//                                           ]),
//                                         ),
//                                         ),
//                                       ),
//                                     ),
//                                   ]),
//                                   SizedBox(
//                                     height: screenHeight * 0.030,
//                                   ),
//                                   Row(children: [
//                                     Expanded(
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 32,
//                                         ),
//                                         child: Container(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 8),
//                                           height: screenHeight * 0.055,
//                                           color: theme.scaffoldBackgroundColor,
//                                           width: screenWidth * 0.750,
//                                           child:FormBuilderTextField(
//                                           name: 'password',
//                                           decoration: const InputDecoration(
//                                             contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 8),
//  labelStyle: TextStyle(fontSize: 14,color:Colors.blueGrey),                                            labelText: "Email Address",
//                                                                                  border: InputBorder.none,

//                                             // errorText: field.errorText != null ? Text(field.errorText!) : null,

//                                             // errorText: _emailError,
//                                           ),
//                                           validator:
//                                               FormBuilderValidators.compose([
//                                             FormBuilderValidators.required(),

//                                           ]),
//                                         ),
//                                         ),
//                                       ),
//                                     ),
//                                   ]),
//                                   SizedBox(
//                                     height: screenWidth * 0.030,
//                                   ),
//                                   Row(children: [
//                                     Expanded(
//                                         child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 32,
//                                       ),
//                                       child: GestureDetector(
//                                         child: Container(
//                                           alignment: Alignment.center,
//                                           width: screenWidth * 0.750,
//                                           height: screenHeight * 0.055,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(3.0),
//                                             color: theme.primaryColor,
//                                           ),
//                                           child: Padding(
//                                             padding: EdgeInsets.all(1.0),
//                                             child: InkWell(
//                                               onTap: () async {
//                                                   final validationSuccess = _formKey.currentState!.validate();

//                     if (validationSuccess) {
//                       //
//                       // Save only when validation passed
//                       _formKey.currentState!.save();
//                       //
//                       // Get form data
//                       final formData = _formKey.currentState!.value;
//                       //
//                        // Reset form
//                     _formKey.currentState!.reset();
//                           // Optional: unfocus keyboard
//                     FocusScope.of(context).unfocus();
//                       // Optional: Show snackbar
//                       ScaffoldMessenger.of(context).showSnackBar((
//                         SnackBar(
//                           duration: Duration(seconds: 2),
//                           content: Text(
//                               'Validation succeeded -> Data: $formData',
//                               textScaleFactor: 1.5),
//                         ),
//                       );
//                     } else {
//                       // Get form data
//                       final formData = _formKey.currentState!.value;
//                       ScaffoldMessenger.of(context).showSnackBar((
//                         SnackBar(
//                           duration: Duration(seconds: 2),
//                           content: Text('Validation failed! -> Data: $formData',
//                               textScaleFactor: 1.5),
//                         ),
//                       );
//                     }

//                     // Optional: unfocus keyboard
//                     FocusScope.of(context).unfocus();

//                                               },
//                                               child: Center(
//                                                 child: Text(
//                                                   'Signin',
//                                                   style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 16 * textScale,
//                                                     fontWeight: FontWeight.w600,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ))
//                                   ]),
//                                   SizedBox(
//                                     height: screenWidth * 0.030,
//                                   ),
//                                   Row(children: [
//                                     Expanded(
//                                         child: Padding(
//                                             padding: EdgeInsets.symmetric(
//                                               horizontal: 32,
//                                             ),
//                                             child: Container(
//                                               alignment: Alignment.centerLeft,
//                                               height: screenHeight * 0.030,
//                                               // color: Colors.grey,
//                                               child: InkWell(
//                                                 onTap: () {
//                                                   Navigator.of(context,
//                                                           rootNavigator: true)
//                                                       .push(MaterialPageRoute(
//                                                           builder: (context) {
//                                                     return ResetPassword();
//                                                   }));
//                                                 },
//                                                 child: Text('Forgot Password ?',
//                                                     style: TextStyle(
//                                                         color: Colors.blueGrey,
//                                                         fontSize:
//                                                             12 * textScale)),
//                                               ),
//                                             ))),
//                                   ]),
//                                   SizedBox(
//                                     height: screenWidth * 0.020,
//                                   ),
//                                   Row(children: [
//                                     Expanded(
//                                         child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 32,
//                                       ),
//                                       child: GestureDetector(
//                                         child: Container(
//                                           alignment: Alignment.center,
//                                           width: screenWidth * 0.750,
//                                           height: screenHeight * 0.055,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(3.0),
//                                               color: theme
//                                                   .scaffoldBackgroundColor),
//                                           child: Padding(
//                                             padding: EdgeInsets.all(1.0),
//                                             child: InkWell(
//                                               onTap: (){

//                                               },
//                                               child: Center(
//                                                   child: TextButton(
//                                                 style: ButtonStyle(
//                                                     backgroundColor:
//                                                         MaterialStateProperty
//                                                             .all<Color>(
//                                                   Color(0xFFf5f7fa),
//                                                 )),
//                                                 onPressed: () {
//                                                   // Navigator.of(context,rootNavigator: true).push(
//                                                   //     MaterialPageRoute(
//                                                   //         builder: (context) {
//                                                   //   return Convert();
//                                                   // }));
//                                                 },
//                                                 child: Text(
//                                                   'Google',
//                                                   style: TextStyle(
//                                                       fontSize: 14 * textScale,
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                       color: Colors.black),
//                                                 ),
//                                               )),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ))
//                                   ]),
//                                   SizedBox(
//                                     height: screenWidth * 0.020,
//                                   ),
//                                   Row(children: [
//                                     Expanded(
//                                         child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 32,
//                                       ),
//                                       child: Container(
//                                         height: screenHeight * 0.030,
//                                         // color: Colors.grey,
//                                         child: InkWell(
//                                             onTap: () {
//                                               Navigator.of(context,
//                                                       rootNavigator: true)
//                                                   .push(MaterialPageRoute(
//                                                       builder: (context) {
//                                                 return SignUp();
//                                               }));
//                                             },
//                                             child: Text(
//                                                 'dont have an account ?, SignUp',
//                                                 style: TextStyle(
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 12 * textScale))),
//                                       ),
//                                     ))
//                                   ]),
//                                   SizedBox(
//                                     height: screenWidth * 0.030,
//                                   ),
//                                 ]),
//                           ),
//                         ),

//                         FormBuilder(
//                           key: _formKey2,
//                         skipDisabled: true,
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: screenHeight * 0.010,
//                                 ),
//                                 SizedBox(
//                                   height: screenHeight * 0.010,
//                                 ),
//                                 Row(children: [
//                                   const Padding(padding: EdgeInsets.only(left: 30)),
//                                   Container(
//                                     alignment: Alignment.center,
//                                     width: screenWidth * 0.150,
//                                     height: screenHeight * 0.055,
//                                     color: theme.scaffoldBackgroundColor,
//                                     child: Padding(
//                                       padding: EdgeInsets.all(0.0),
//                                       child: InkWell(
//                                         onTap: () {
//                                           Navigator.of(context,
//                                                   rootNavigator: true)
//                                               .push(MaterialPageRoute(
//                                                   builder: (context) {
//                                             // return DetailPage(bean);
//                                             return CountryCode();
//                                           }));
//                                         },
//                                         child:FormBuilderTextField(
//       name: 'callcode',
//       decoration: const InputDecoration(
//         border: OutlineInputBorder(),
//         labelText: 'Cellphone',
//       ),
//       // controller: cellphoneController,
//       // inputFormatters: [cellphoneFormatter],
//       textInputAction: TextInputAction.next,
//       keyboardType: TextInputType.number,
//       validator: FormBuilderValidators.compose([
//         FormBuilderValidators.required(),
//         FormBuilderValidators.match(

//           r"^\(?[1-9]{2}\)? ?(?:[2-8]|9[1-9])[0-9]{3}\-?[0-9]{4}$",
//         ),
//       ]),
//     )
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(padding: EdgeInsets.only(left: 5)),
//                                   Container(
//                                     alignment: Alignment.center,
//                                     width: screenWidth * 0.700,
//                                     height: screenHeight * 0.055,
//                                     color: theme.scaffoldBackgroundColor,
//                                     child: Padding(
//                                       padding: EdgeInsets.all(0.0),
//                                       child: InkWell(
//                                         onTap: () {
//                                           // Navigator.of(context,
//                                           //         rootNavigator: true)
//                                           //     .push(MaterialPageRoute(
//                                           //         builder: (context) {
//                                           //   // return DetailPage(bean);
//                                           //   return CountryCode();
//                                           // }));
//                                         },
//                                         child:FormBuilderTextField(
//                                           name: 'phonenumber',
//                                           decoration: const InputDecoration(
//                                             contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 8),
//  labelStyle: TextStyle(fontSize: 14,color:Colors.blueGrey),                                            labelText: "Phonenumber",
//                                                                                   border: InputBorder.none,

//                                             // errorText: field.errorText != null ? Text(field.errorText!) : null,

//                                             // errorText: _emailError,
//                                           ),
//                                           validator:
//                                               FormBuilderValidators.compose([
//                                             FormBuilderValidators.required(),
//                                             FormBuilderValidators.email(),
//                                           ]),
//                                         ),

//                                       ),
//                                     ),
//                                   ),
//                                   Padding(padding: EdgeInsets.only(right: 0)),
//                                 ]),
//                                 SizedBox(
//                                   height: screenHeight * 0.030,
//                                 ),
//                                 Row(children: [
//                                   Expanded(
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 32,
//                                       ),
//                                       child: Container(
//                                         padding:
//                                             EdgeInsets.symmetric(horizontal: 8),
//                                         height: screenHeight * 0.055,
//                                         color: theme.scaffoldBackgroundColor,
//                                         width: screenWidth * 0.750,
//                                         child:FormBuilderTextField(
//                                           name: 'email',
//                                           decoration: const InputDecoration(
//                                             contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 8),
//  labelStyle: TextStyle(fontSize: 14,color:Colors.blueGrey),                                            labelText: "Password ",
//                                                                                   border: InputBorder.none,

//                                             // errorText: field.errorText != null ? Text(field.errorText!) : null,

//                                             // errorText: _emailError,
//                                           ),
//                                           validator:
//                                               FormBuilderValidators.compose([
//                                             FormBuilderValidators.required(),
//                                             FormBuilderValidators.email(),
//                                           ]),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ]),
//                                 SizedBox(
//                                   height: screenHeight * 0.010,
//                                 ),
//                                 Row(children: [
//                                   Expanded(
//                                       child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 32,
//                                     ),
//                                     child: GestureDetector(
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         width: screenWidth * 0.750,
//                                         height: screenHeight * 0.055,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(3.0),
//                                           color: theme.primaryColor,
//                                         ),
//                                         child: Padding(
//                                           padding: EdgeInsets.all(1.0),
//                                           child: InkWell(
//                                             onTap: () async{
//      final validationSuccess = _formKey2.currentState!.validate();

//                     if (validationSuccess) {
//                       //
//                       // Save only when validation passed
//                       _formKey2.currentState!.save();
//                       //
//                       // Get form data
//                       final formData = _formKey2.currentState!.value;
//                       //
//                        // Reset form
//                     _formKey2.currentState!.reset();
//                           // Optional: unfocus keyboard
//                     FocusScope.of(context).unfocus();
//                       // Optional: Show snackbar
//                       ScaffoldMessenger.of(context).showSnackBar((
//                         SnackBar(
//                           duration: Duration(seconds: 2),
//                           content: Text(
//                               'Validation succeeded -> Data: $formData',
//                               textScaleFactor: 1.5),
//                         ),
//                       );
//                     } else {
//                       // Get form data
//                       final formData = _formKey2.currentState!.value;
//                       ScaffoldMessenger.of(context).showSnackBar((
//                         SnackBar(
//                           duration: Duration(seconds: 2),
//                           content: Text('Validation failed! -> Data: $formData',
//                               textScaleFactor: 1.5),
//                         ),
//                       );
//                     }

//                     // Optional: unfocus keyboard
//                     FocusScope.of(context).unfocus();

//                                             },
//                                             child: Center(
//                                               child: Text(
//                                                 'SignIn',
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 16 * textScale,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ))
//                                 ]),
//                                 SizedBox(
//                                   height: screenWidth * 0.030,
//                                 ),
//                                 Row(children: [
//                                   Expanded(
//                                       child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                             horizontal: 32,
//                                           ),
//                                           child: Container(
//                                             alignment: Alignment.centerLeft,
//                                             height: screenHeight * 0.030,
//                                             // color: Colors.grey,
//                                             child: InkWell(
//                                               onTap: () {
//                                                 Navigator.of(context,
//                                                         rootNavigator: true)
//                                                     .push(MaterialPageRoute(
//                                                         builder: (context) {
//                                                   return ResetPassword();
//                                                 }));
//                                               },
//                                               child: Text('Forgot Password ?',
//                                                   style: TextStyle(
//                                                       color: Colors.blueGrey,
//                                                       fontSize:
//                                                           12 * textScale)),
//                                             ),
//                                           ))),
//                                 ]),
//                                 SizedBox(
//                                   height: screenWidth * 0.030,
//                                 ),
//                                 Row(children: [
//                                   Expanded(
//                                       child: Padding(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 32,
//                                     ),
//                                     child: GestureDetector(
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         width: screenWidth * 0.750,
//                                         height: screenHeight * 0.055,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(3.0),
//                                             color:
//                                                 theme.scaffoldBackgroundColor),
//                                         child: Padding(
//                                           padding: EdgeInsets.all(1.0),
//                                           child: InkWell(
//                                             // onTap: _signUp,
//                                             child: Center(
//                                               child: Text(
//                                                 'Google',
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 16 * textScale,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ))
//                                 ]),
//                                 SizedBox(
//                                   height: screenWidth * 0.020,
//                                 ),
//                                 Row(children: [
//                                   Expanded(
//                                       child: Padding(
//                                           padding: EdgeInsets.symmetric(
//                                             horizontal: 32,
//                                           ),
//                                           child: Container(
//                                             alignment: Alignment.centerLeft,
//                                             height: screenHeight * 0.030,
//                                             // color: Colors.grey,
//                                             child: InkWell(
//                                               onTap: () {
//                                                 Navigator.of(context,
//                                                         rootNavigator: true)
//                                                     .push(MaterialPageRoute(
//                                                         builder: (context) {
//                                                   return SignUp();
//                                                 }));
//                                               },
//                                               child: Text(
//                                                   'dont have an account ?, Signup',
//                                                   style: TextStyle(
//                                                       color: Colors.blueGrey,
//                                                       fontSize:
//                                                           12 * textScale)),
//                                             ),
//                                           ))
//                                           ),
//                                 ]),
//                                 SizedBox(
//                                   height: screenWidth * 0.020,
//                                 ),
//                               ]),
//                         ),
//                       ]),
//                     ),
//                   ),
//                 ],
//               ),
//             )

//     ));
  }
}
