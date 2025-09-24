import 'buy.dart';
import 'convert.dart';
import 'deposit.dart';
import 'collection.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import '../widgets/responsive.dart';
import 'leveragedtoken.dart';
import 'selecttoken.dart';
import 'trade.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'travel_bean.dart';
import 'sign_up.dart';
// import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/cupertino.dart';

// import 'package:amplify_auth_cognito_example/Widgets/login.dart';
import 'package:flutter/material.dart';

import 'package:universal_platform/universal_platform.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:im_stepper/stepper.dart';
// import 'package:intl/intl.dart';
// import 'package:amplify_auth_cognito/models/Trip.dart';
import 'dart:math' as math;

import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:flutter/foundation.dart';
// import 'package:flappy_search_bar/flappy_search_bar.dart';
// import 'package:flappy_search_bar/scaled_tile.dart';

import 'nft_details_page.dart';
import 'withdraw.dart';

class Others extends StatefulWidget {
  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _OthersMobile(),
          tablet: _OthersTablet(),
        ),
      ),
    );
  }
}

class _OthersTablet extends StatefulWidget {
  @override
  _OthersTabletState createState() => _OthersTabletState();
  final List<String> list = List.generate(10, (index) => "nutrinax $index");
}

class _OthersTabletState extends State<_OthersTablet> {
  List<TravelBean> _list = TravelBean.generateMostPopularBean();
  final List _gridItems = List.generate(8, (i) => "Item $i");
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: Text("Services",
            style: TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        // scrollDirection: Axis.vertical,
        //           controller: _controller,
        //       physics: const BouncingScrollPhysics(
        //           parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverStickyHeader(
            // sticky: false,
            header: Container(
              height: screenHeight * 0.050,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Recommended',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: [
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Buy();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Buy",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "P2P",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Deposit();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Deposit",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Withdraw();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Withdraw",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Transfer",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Convert();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Convert",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Earn();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Referals",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                // return DetailPage(bean);
                                return Others();
                              }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Rewards",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
          SliverStickyHeader(
            header: Container(
              height: screenHeight * 0.050,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Trade',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: [
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Buy();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Spot",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Margin",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Deposit();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Future",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Withdraw();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Earn",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "P2P",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Convert();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 30.0, right: 3.0),
                            child: Text(
                              "Convert",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Earn();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Trading ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              " Bot",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                // return DetailPage(bean);
                                return Others();
                              }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Bonus",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
          SliverStickyHeader(
            header: Container(
              height: screenHeight * 0.050,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Welfare',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: [
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Buy();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "cx",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Bonus",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Referal",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Deposit();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Rewards",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Hub",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Withdraw();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Affiliate",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Events",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Convert();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Convert",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Earn();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 35.0, right: 3.0),
                            child: Text(
                              "Trading ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              " Bot",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                // return DetailPage(bean);
                                return Others();
                              }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Bonus",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
          SliverStickyHeader(
            header: Container(
              height: screenHeight * 0.050,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Others',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: [
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Buy();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Help ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Center",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Community",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Deposit();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Social",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Withdraw();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Affiliate",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OthersMobile extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "nutrinax $index");

  @override
  _OthersMobileState createState() => _OthersMobileState();
}

class _OthersMobileState extends State<_OthersMobile> {
  List<TravelBean> _list = TravelBean.generateMostPopularBean();
  final List _gridItems = List.generate(8, (i) => "Item $i");
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: Text("Services",
            style: TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        // scrollDirection: Axis.vertical,
        //           controller: _controller,
        //       physics: const BouncingScrollPhysics(
        //           parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverStickyHeader(
            // sticky: false,
            header: Container(
              height: screenHeight * 0.050,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Recommended',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: [
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Buy();
                              // }));
                            },
                          ),
                    
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Buy",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                        
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "P2P",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                          
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Deposit();
                              // }));
                            },
                          ),
                    
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Deposit",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Withdraw();
                              // }));
                            },
                          ),
                       
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Withdraw",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                        
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Transfer",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Convert();
                              // }));
                            },
                          ),
                         
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Convert",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Earn();
                              // }));
                            },
                          ),
                        
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Referals",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                // return DetailPage(bean);
                                return Others();
                              }));
                            },
                          ),
                        
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Rewards",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          
                        ],
                      )),
                ),
              )
            ],
          ),
          SliverStickyHeader(
            header: Container(
              height: screenHeight * 0.050,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Trade',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: [
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Buy();
                              // }));
                            },
                          ),
                         
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Spot",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                        
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Margin",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                          
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Deposit();
                              // }));
                            },
                          ),
                         
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Future",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Withdraw();
                              // }));
                            },
                          ),
                       
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Earn",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                        
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "P2P",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Convert();
                              // }));
                            },
                          ),
                        
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Convert",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Earn();
                              // }));
                            },
                          ),
                         
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Trading ",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            
                         
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  " Bot",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                // return DetailPage(bean);
                                return Others();
                              }));
                            },
                          ),
                       
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Bonus",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                // return DetailPage(bean);
                                return LeveragedTokem();
                              }));
                            },
                          ),
                          Column(children: [
                           
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.0,
                                      bottom: 1.0,
                                      left: 3.0,
                                      right: 3.0),
                                  child: Text(
                                    "Leveraged",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                           
                           
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.0,
                                      bottom: 1.0,
                                      left: 3.0,
                                      right: 3.0),
                                  child: Text(
                                    "Tokens",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                           
                          )
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                // return DetailPage(bean);
                                return Others();
                              }));
                            },
                          ),
                          Column(children: [
                         
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.0,
                                      bottom: 1.0,
                                      left: 3.0,
                                      right: 3.0),
                                  child: Text(
                                    "Copy ",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              
                     
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.0,
                                      bottom: 1.0,
                                      left: 3.0,
                                      right: 3.0),
                                  child: Text(
                                    "Trading",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                             
                          ])
                        ],
                      )),
                ),
              )
            ],
          ),
          SliverStickyHeader(
            header: Container(
              height: screenHeight * 0.050,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Welfare',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: [
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Buy();
                              // }));
                            },
                          ),
                        
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Launchpad",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                          
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                         
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Referal",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Deposit();
                              // }));
                            },
                          ),
                      
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Rewards",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            
                         
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Hub",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Withdraw();
                              // }));
                            },
                          ),
                          
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Affiliate",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                         
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Launchpool",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                          
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Convert();
                              // }));
                            },
                          ),
                          
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 1.0),
                                child: Text(
                                  "Leaderboard",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
            ],
          ),
          SliverStickyHeader(
            header: Container(
              height: screenHeight * 0.050,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Others',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: [
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Buy();
                              // }));
                            },
                          ),
                         
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Help ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                        
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Center",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return SearchList();
                              // }));
                            },
                          ),
                         
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Community",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                           
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Deposit();
                              // }));
                            },
                          ),
                       
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.0,
                                    bottom: 1.0,
                                    left: 3.0,
                                    right: 3.0),
                                child: Text(
                                  "Social",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            
                        ],
                      )),
                ),
              ),
              Container(
                width: 120,
                height: 100,
                color: theme.backgroundColor,
                child: Center(
                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            color: Colors.black87,
                            iconSize: 38,
                            icon: const Icon(Icons.money_rounded),
                            onPressed: () {
                              // handle the press
                              // Navigator.of(context,rootNavigator: true)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   // return DetailPage(bean);
                              //   return Withdraw();
                              // }));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 1.0, left: 3.0, right: 3.0),
                            child: Text(
                              "Affiliate",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * textScale,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
