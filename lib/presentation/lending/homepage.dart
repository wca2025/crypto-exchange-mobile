import 'dart:math';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import 'package:cx/businesslogic/blocs/account/account_bloc.dart';
// import 'package:cx/businesslogic/blocs/asset/asset_bloc.dart';
import 'home_view.dart';

import '../../businesslogic/blocs/account/account_bloc.dart';
import '../../businesslogic/blocs/auth/auth_bloc.dart';
import 'Drawerr.dart';
import 'chart.dart';
import 'referals.dart';
import 'rewardcenter.dart';
import 'security.dart';
import 'selecttoken.dart';
import 'sign_in.dart';

import 'Feerates.dart';
import 'about.dart';
import 'buy.dart';
import 'deposit.dart';
import 'help.dart';
import 'messages.dart';
import 'orders.dart';
import 'paymentmethodlist.dart';
import 'settings.dart';
import 'show_app.dart';
import 'themes.dart';
import 'tokendetail.dart';
import 'transfer.dart';
import 'verificationpersonal.dart';
import 'withdraw.dart';
import 'package:flutter/painting.dart';

import 'confirmorder.dart';
import 'coustom_bottom_nav_bar.dart';

import 'addresslist.dart';
import 'convert.dart';
import 'collection.dart';
import 'others.dart';
import 'movie_details_page.dart';
import 'p2psell.dart';
import 'p2pordercompleted.dart';
import 'p2ppendingpayment.dart';
import 'p2prelease.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import '../widgets/responsive.dart';
import 'trade.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'travel_bean.dart';

import 'sign_up.dart';
// import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';

// import 'package:amplify_auth_cognito_example/Widgets/login.dart';
import 'package:flutter/material.dart';

import 'package:universal_platform/universal_platform.dart';
// import 'Widgets/ConfirmResetWidget.dart';
// import 'Widgets/ConfirmSignInWidget.dart';
// import 'Widgets/ConfirmSignUpWidget.dart';
// import 'Widgets/SignInWidget.dart';
// import 'Widgets/SignUpWidget.dart';
// import 'Widgets/UpdatePasswordWidget.dart';
// import 'Widgets/onboarding_screen.dart';
// import 'amplifyconfiguration.dart';
// import 'Widgets/login.dart';

// import 'package:flutter_responsive/flutter_responsive.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:im_stepper/stepper.dart';
// import 'package:intl/intl.dart';
// import 'package:amplify_auth_cognito/models/Trip.dart';
import 'dart:math' as math;
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:amplify_auth_cognito/widgets/list_item.dart';
// import 'package:amplify_auth_cognito/widgets/slider_item.dart';
// import 'package:lottie/lottie.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

// import 'package:amplify_auth_cognito/views/detail_page.dart';
// import 'package:amplify_auth_cognito/movie_api.dart';
// import 'package:amplify_auth_cognito/movie_details_page.dart';
import 'package:flutter/foundation.dart';
// import 'package:flappy_search_bar/flappy_search_bar.dart';
// import 'package:flappy_search_bar/scaled_tile.dart';

import 'movie_details_page.dart';

class NestedTabBar extends StatefulWidget {
  const NestedTabBar({Key? key}) : super(key: key);

  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            color: theme.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10),
              child: Text(
                "Trending",
                style: TextStyle(
                  fontSize: 14 * textScale,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ]),
        Column(
          children: [
            // Container(
            //   height: screenHeight * 0.058,
            //   color: theme.backgroundColor,
            //   child: ListTile(
            //       title: Row(
            //         children: [
            //           Text("Trading Pairs",
            //               style: TextStyle(
            //                   fontSize: 11 * textScale,
            //                   color: Colors.black38,
            //                   fontWeight: FontWeight.w500))
            //         ],
            //       ),
            //      ),
            // ),
            Container(
              color: theme.backgroundColor,
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

                  TabBarView(
                controller: _nestedTabController,
                children: <Widget>[
                  ListView.builder(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    padding: const EdgeInsets.all(1.0),
                    itemBuilder: (context, index) {
                      var bean = _list[index];
                      return Container(
                        color: Colors.white70,
                        // width: screenWidth * 0.880,
                        child: InkWell(
                          child: Column(children: [
                            ListTile(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return Chart();
                                }));
                              },
                              title: Row(
                                children: [
                                  Text(
                                      "Complete your first deposit to win a bonus ....."),
                                  Expanded(
                                      child:
                                          Container(width: screenWidth * 0.08)),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                      "Deposit your firsdt 50usd worth of crypto and win up ...",
                                      style: TextStyle(
                                        fontSize: 12 * textScale,
                                      )),
                                  Expanded(
                                      child:
                                          Container(width: screenWidth * 0.08)),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _Homeprotate createState() => _Homeprotate();
}

class _Homeprotate extends State<Homepage> {
  final _mainNavigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return MaterialApp(
      navigatorKey: _mainNavigatorKey,
      home: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: Responsive(
            mobile: _HomepageMobile(),
            tablet: _HomepageTablet(),
          ),
        ),
      ),
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
    );
  }
}

class _HomepageTablet extends StatefulWidget {
  @override
  _HomepageTabletState createState() => _HomepageTabletState();
  final List<String> list = List.generate(10, (index) => "nutrinax $index");
}

class _HomepageTabletState extends State<_HomepageTablet> {
  List<TravelBean> _list = TravelBean.generateMostPopularBean();
  final List _gridItems = List.generate(8, (i) => "Item $i");
  final ScrollController _controller = ScrollController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
    final List _gridItems = List.generate(1, (i) => "Item $i");
    final textScale = MediaQuery.of(context).textScaleFactor;

    // return BlocConsumer<AccountBloc, AccountState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    //   },
    //   builder: (context, state) {
    return MaterialApp(
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
        home: DefaultTabController(
            length: 1,
            child: Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              appBar: AppBar(
                key: _scaffoldKey,
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      color: Colors.black87,
                      icon: const Icon(
                        Icons.person_pin_circle_rounded,
                        size: 24.0,
                      ),
                      onPressed: () {
                        // Scaffold.of(context).openDrawer();

                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: Drawerr(),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  },
                ),
                automaticallyImplyLeading: true,
                title: Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: theme.backgroundColor,
                        borderRadius: BorderRadiusDirectional.circular(8),
                      ),
                      // width: screenWidth * 1.6,
                      height: screenHeight * 0.035,
                      child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(bottom: 20),
                                  alignment: Alignment.centerLeft,
                                  // width:screenWidth*0.35,
                                  child: IconButton(
                                    color: Colors.blueGrey,
                                    iconSize: 18,
                                    icon: const Icon(Icons.search),
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .push(MaterialPageRoute(
                                              builder: (context) {
                                        // return DetailPage(bean);
                                        return SearchList();
                                      }));
                                    },
                                  )),
                            ],
                          ))),
                ),
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
                          IconButton(
                            padding: const EdgeInsets.all(0.0),
                            iconSize: 18,
                            icon: const Icon(
                              Icons.mail_outline_outlined,
                              color: Colors.black87,
                            ),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                // return DetailPage(bean);
                                return Messages();
                              }));
                            },
                          ),
                        ],
                      )),
                ],
                elevation: 0.2,
                bottomOpacity: 1.0,
                shadowColor: theme.scaffoldBackgroundColor,
                backgroundColor: theme.scaffoldBackgroundColor,
              ),
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Container(
                      height: screenHeight * 0.220,
                      width: screenWidth * 0.300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        padding: const EdgeInsets.all(6.0),
                        itemBuilder: (context, index) {
                          var bean = _list[index];
                          return Container(
                            //  color: theme.backgroundColor,
                            margin: EdgeInsets.all(0.0),

                            width: screenWidth * 0.800,

                            // child: Text('lorem'),
                            child: InkWell(
                              onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   // return DetailPage(bean);
                                //   return NftDetailsPage();
                                // }));
                              },
                              child: Container(
                                color: theme.backgroundColor,
                                // child: FadeInImage.assetNetwork(
                                //   alignment: Alignment.topCenter, // add this
                                //   placeholder: 'dummy image',
                                //   image: 'https://via.placeholder.com/500x300.png',
                                //   fit: BoxFit.fitWidth,
                                //   height: screenHeight * 0.220,
                                // ),
                              ),
                            ),
                          );
                        },
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.050,
                                        bottom: 1.0,
                                        left: 3.0,
                                        right: 3.0),
                                    child: IconButton(
                                      color: Colors.black87,
                                      iconSize: 38,
                                      icon: const Icon(Icons.money_rounded),
                                      onPressed: () {
                                        // handle the press
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).push(MaterialPageRoute(
                                            builder: (context) {
                                          // return DetailPage(bean);
                                          return Buy();
                                        }));
                                      },
                                    ),
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.050,
                                        bottom: 1.0,
                                        left: 3.0,
                                        right: 3.0),
                                    child: IconButton(
                                      color: Colors.black87,
                                      iconSize: 38,
                                      icon: const Icon(Icons.money_rounded),
                                      onPressed: () {
                                        // handle the press
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          return HomeScreen();
                                        }));
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 1.0,
                                        bottom: 1.0,
                                        left: 3.0,
                                        right: 3.0),
                                    child: Text(
                                      "Offers",
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.050,
                                        bottom: 1.0,
                                        left: 3.0,
                                        right: 3.0),
                                    child: IconButton(
                                      color: Colors.black87,
                                      iconSize: 38,
                                      icon: const Icon(Icons.money_rounded),
                                      onPressed: () {
                                        // handle the press
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).push(MaterialPageRoute(
                                            builder: (context) {
                                          // return DetailPage(bean);
                                          return SearchListDeposit();
                                        }));
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.050,
                                        bottom: 1.0,
                                        left: 3.0,
                                        right: 3.0),
                                    child: IconButton(
                                      color: Colors.black87,
                                      iconSize: 38,
                                      icon: const Icon(Icons.money_rounded),
                                      onPressed: () {
                                        // handle the press
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).push(MaterialPageRoute(
                                            builder: (context) {
                                          // return DetailPage(bean);
                                          return SearchListWithdraw();
                                        }));
                                      },
                                    ),
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.050,
                                        bottom: 1.0,
                                        left: 3.0,
                                        right: 3.0),
                                    child: IconButton(
                                      color: Colors.black87,
                                      iconSize: 38,
                                      icon: const Icon(Icons.money_rounded),
                                      onPressed: () {
                                        // handle the press
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).push(MaterialPageRoute(
                                            builder: (context) {
                                          // return DetailPage(bean);
                                          return SearchListTransfer();
                                        }));
                                      },
                                    ),
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.050,
                                        bottom: 1.0,
                                        left: 3.0,
                                        right: 3.0),
                                    child: IconButton(
                                      color: Colors.black87,
                                      iconSize: 38,
                                      icon: const Icon(Icons.money_rounded),
                                      onPressed: () {
                                        // handle the press
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).push(MaterialPageRoute(
                                            builder: (context) {
                                          // return DetailPage(bean);
                                          return Convert();
                                        }));
                                      },
                                    ),
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.050,
                                        bottom: 1.0,
                                        left: 3.0,
                                        right: 3.0),
                                    child: IconButton(
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.050,
                                        bottom: 1.0,
                                        left: 3.0,
                                        right: 3.0),
                                    child: IconButton(
                                      color: Colors.black87,
                                      iconSize: 38,
                                      icon: const Icon(Icons.money_rounded),
                                      onPressed: () {
                                        // handle the press
                                        Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).push(MaterialPageRoute(
                                            builder: (context) {
                                          // return DetailPage(bean);
                                          return Others();
                                        }));
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 1.0,
                                        bottom: 1.0,
                                        left: 3.0,
                                        right: 3.0),
                                    child: Text(
                                      "Others",
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
                      )
                    ],
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          child: Container(
                            height: screenHeight * 0.002,
                            width: screenWidth * 0.880,
                          ))),
                  SliverToBoxAdapter(
                      child: Container(
                    height: screenHeight * 0.840,
                    width: screenWidth * 0.880,
                    color: theme.backgroundColor,
                    child: const NestedTabBar(),
                  )),
                ],
              ),
              // drawer: Container(
              //   color: theme.backgroundColor,
              //   width: screenWidth * 1.15,
              //   child: Drawer(
              //     child: Container(
              //       color: theme.backgroundColor,
              //       width: screenWidth * 1.15,
              //       child: ListView(
              //         padding: EdgeInsets.zero,
              //         children: <Widget>[
              //           DrawerHeader(
              //             padding: EdgeInsets.only(bottom: 0.0, top: 0.0),
              //             margin: EdgeInsets.only(bottom: 0.0, top: 0.0),
              //             decoration: BoxDecoration(
              //               color: theme.scaffoldBackgroundColor,
              //             ),
              //             child: Column(
              //               verticalDirection: VerticalDirection.down,
              //               // crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Row(
              //                     verticalDirection: VerticalDirection.down,
              //                     children: [
              //                       const Padding(
              //                           padding: EdgeInsets.only(left: 10.0)),
              //                       Container(
              //                         height: screenHeight * 0.080,
              //                         alignment: Alignment.topLeft,
              //                         child: InkWell(
              //                           onTap: () {
              //                             Navigator.pop(context);
              //                           },
              //                           child: const Icon(Icons.close_rounded,
              //                               size: 30),
              //                         ),
              //                       ),
              //                       Expanded(
              //                           child:
              //                               Container(width: screenWidth * 0.65)),
              //                       IconButton(
              //                         icon: const Icon(Icons.brightness_4_rounded),
              //                         onPressed: () {
              //                           currentTheme.toggleTheme();
              //                         },
              //                       ),
              //                     ]),
              //                 Row(
              //                   children: [
              //                     Padding(
              //                       padding: EdgeInsets.only(top: 10.0, left: 10.0),
              //                       child: Icon(
              //                         Icons.person_pin,
              //                         color: Colors.black,
              //                         size: 45.0,
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: EdgeInsets.only(left: 0.0, top: 10.0),
              //                       child: InkWell(
              //                         child: Column(
              //                           children: [
              //                             Row(
              //                               children: [
              //                                 Padding(
              //                                     padding: EdgeInsets.only(
              //                                         left: 8.0, top: 0.0)),
              //                                 Text(
              //                                   "Welcome to cx",
              //                                   style: TextStyle(
              //                                       fontSize: 24.0 * textScale,
              //                                       color: Colors.black),
              //                                 ),
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [  InkWell(
              //                                    onTap: () {
              //                           Navigator.of(context,rootNavigator: true, rootNavigator: true).push(
              //                               MaterialPageRoute(builder: (context) {
              //                             // return DetailPage(bean);
              //                             return SignIn();
              //                           }));
              //                         },
              //                                 child:   Text(
              //                                   "Login",
              //                                   style: TextStyle(
              //                                       fontSize: 16.0 * textScale,
              //                                       color: Colors.black),
              //                                 ),),
              //                                 SizedBox(width: screenWidth*0.010,),
              //                              InkWell(
              //                                    onTap: () {
              //                           Navigator.of(context,rootNavigator: true, rootNavigator: true).push(
              //                               MaterialPageRoute(builder: (context) {
              //                             // return DetailPage(bean);
              //                             return SignUp();
              //                           }));
              //                         },
              //                                 child:   Text(
              //                                   "or Register",
              //                                   style: TextStyle(
              //                                       fontSize: 16.0 * textScale,
              //                                       color: Colors.black),
              //                                 ),),
              //                                 Padding(
              //                                     padding: EdgeInsets.only(
              //                                         left: 65.0, top: 0.0)),
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [],
              //                             ),
              //                           ],
              //                         ),

              //                       ),
              //                     ),

              //                     // InkWell(
              //                     //   child: Text(
              //                     //     "unverified",
              //                     //     style: TextStyle(
              //                     //         fontSize: 12 * textScale,
              //                     //         color: theme.backgroundColor),
              //                     //   ),
              //                     //   onTap: () {
              //                     //     Navigator.of(context,rootNavigator: true)
              //                     //         .push(MaterialPageRoute(builder: (context) {
              //                     //       // return DetailPage(bean);
              //                     //       return VerificationPersonal();
              //                     //     }));
              //                     //   },
              //                     // ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //           NestedTabBar2()
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            )));
    //   },
    // );
  }
}

class _HomepageMobile extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "nutrinax $index");

  @override
  _HomepageMobileState createState() => _HomepageMobileState();
}

class _HomepageMobileState extends State<_HomepageMobile> {
  List<TravelBean> _list = TravelBean.generateMostPopularBean();
  final List _gridItems = List.generate(8, (i) => "Item $i");
  final ScrollController _controller = ScrollController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
    final List _gridItems = List.generate(1, (i) => "Item $i");
    final textScale = MediaQuery.of(context).textScaleFactor;

    return MaterialApp(
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
        home:
            // BlocConsumer<AuthBloc, AuthState>(
            //   listener: (context, state) {
            //     // TODO: implement listener
            //   },
            //   builder: (context, state) {
            //     return
            DefaultTabController(
                length: 1,
                child: Scaffold(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  appBar: AppBar(
                    key: _scaffoldKey,
                    leading: Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          color: Colors.black87,
                          icon: const Icon(
                            Icons.person_pin_circle_rounded,
                            size: 24.0,
                          ),
                          onPressed: () {
                            // Scaffold.of(context).openDrawer();

                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: Drawerr(),
                              withNavBar:
                                  false, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        );
                      },
                    ),
                    automaticallyImplyLeading: true,
                    title: Container(
                        decoration: BoxDecoration(
                          color: theme.backgroundColor,
                          borderRadius: BorderRadiusDirectional.circular(8),
                        ),
                        width: screenWidth * 1.6,
                        height: screenHeight * 0.035,
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                // return DetailPage(bean);
                                return SearchList();
                              }));
                            },
                            child: Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(bottom: 20),
                                    alignment: Alignment.centerLeft,
                                    // width:screenWidth*0.35,
                                    child: IconButton(
                                      color: Colors.blueGrey,
                                      iconSize: 18,
                                      icon: const Icon(Icons.search),
                                      onPressed: () {
                                        // handle the press
                                      },
                                    )),
                              ],
                            ))),
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
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    // return DetailPage(bean);
                                    return Messages();
                                  }));
                                },
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
                    elevation: 0.2,
                    bottomOpacity: 1.0,
                    shadowColor: theme.scaffoldBackgroundColor,
                    backgroundColor: theme.scaffoldBackgroundColor,
                  ),
                  body: CustomScrollView(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Container(
                          height: screenHeight * 0.220,
                          width: screenWidth * 0.300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            padding: const EdgeInsets.all(6.0),
                            itemBuilder: (context, index) {
                              var bean = _list[index];
                              return Container(
                                //  color: theme.backgroundColor,
                                margin: EdgeInsets.all(4.0),

                                width: screenWidth * 0.800,

                                // child: Text('lorem'),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context,rootNavigator: true)
                                    //     .push(MaterialPageRoute(builder: (context) {
                                    //   // return DetailPage(bean);
                                    //   return NftDetailsPage();
                                    // }));
                                  },
                                  child: Container(
                                    color: theme.backgroundColor,
                                    // child: FadeInImage.assetNetwork(
                                    //   alignment: Alignment.topCenter, // add this
                                    //   placeholder: 'dummy image',
                                    //   image: 'https://via.placeholder.com/500x300.png',
                                    //   fit: BoxFit.fitWidth,
                                    //   height: screenHeight * 0.220,
                                    // ),
                                  ),
                                ),
                              );
                            },
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
                                      //          (state is AuthAuthenticatedState)
                                      // ?
                                      IconButton(
                                        color: Colors.black87,
                                        iconSize: 38,
                                        icon: const Icon(Icons.money_rounded),
                                        onPressed: () {
                                          // handle the press
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).push(MaterialPageRoute(
                                              builder: (context) {
                                            // return DetailPage(bean);
                                            return Buy();
                                          }));
                                        },
                                      ),
                                      // :
                                      //  IconButton(
                                      //   color: Colors.black87,
                                      //   iconSize: 38,
                                      //   icon: const Icon(Icons.money_rounded),
                                      //   onPressed: () {
                                      //     // handle the press
                                      //     Navigator.of(context,
                                      //             rootNavigator: true,
                                      //         )
                                      //         .push(MaterialPageRoute(
                                      //             builder: (context) {
                                      //       // return DetailPage(bean);
                                      //       return SignIn();
                                      //     }));
                                      //   },
                                      // ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 1.0,
                                                bottom: 1.0,
                                                left: 40.0,
                                                right: 3.0),
                                            child: Text(
                                              "Add",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12 * textScale,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
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
                                      //          (state is AuthAuthenticatedState)
                                      // ?
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.00,
                                            bottom: 1.0,
                                            left: 3.0,
                                            right: 3.0),
                                        child: IconButton(
                                          color: Colors.black87,
                                          iconSize: 38,
                                          icon: const Icon(Icons.money_rounded),
                                          onPressed: () {
                                            // handle the press
                                            // Navigator.of(
                                            //   context,
                                            //   rootNavigator: true,
                                            // ).push(MaterialPageRoute(
                                            //     builder: (context) {
                                            //   // return DetailPage(bean);
                                            //   return HomeScreen();
                                            // }));
                                          },
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 1.0,
                                            bottom: 1.0,
                                            left: 3.0,
                                            right: 3.0),
                                        child: Text(
                                          "Offers",
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
                                      //          (state is AuthAuthenticatedState)
                                      // ?
                                      IconButton(
                                        color: Colors.black87,
                                        iconSize: 38,
                                        icon: const Icon(Icons.money_rounded),
                                        onPressed: () {
                                          // handle the press
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).push(MaterialPageRoute(
                                              builder: (context) {
                                            // return DetailPage(bean);
                                            return SearchListDeposit();
                                          }));
                                        },
                                      ),
                                      // :
                                      // IconButton(
                                      //   color: Colors.black87,
                                      //   iconSize: 38,
                                      //   icon: const Icon(Icons.money_rounded),
                                      //   onPressed: () {
                                      //     // handle the press
                                      //     Navigator.of(context,
                                      //             rootNavigator: true,
                                      //           )
                                      //         .push(MaterialPageRoute(
                                      //             builder: (context) {
                                      //       // return DetailPage(bean);
                                      //       return SignIn();
                                      //     }));
                                      //   },
                                      // )

                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 1.0,
                                                bottom: 1.0,
                                                left: 30.0,
                                                right: 3.0),
                                            child: Text(
                                              "Pay",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12 * textScale,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
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
                                      //          (state is AuthAuthenticatedState)
                                      // ?
                                      IconButton(
                                        color: Colors.black87,
                                        iconSize: 38,
                                        icon: const Icon(Icons.money_rounded),
                                        onPressed: () {
                                          // handle the press
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).push(MaterialPageRoute(
                                              builder: (context) {
                                            // return DetailPage(bean);
                                            return SearchListWithdraw();
                                          }));
                                        },
                                      ),

                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 1.0,
                                                bottom: 1.0,
                                                left: 20.0,
                                                right: 3.0),
                                            child: Text(
                                              "Instacash",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12 * textScale,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
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
                                      //          (state is AuthAuthenticatedState)
                                      // ?
                                      IconButton(
                                        color: Colors.black87,
                                        iconSize: 38,
                                        icon: const Icon(Icons.money_rounded),
                                        onPressed: () {
                                          // handle the press
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).push(MaterialPageRoute(
                                              builder: (context) {
                                            // return DetailPage(bean);
                                            return SearchListTransfer();
                                          }));
                                        },
                                      ),
                                      // :
                                      //    IconButton(
                                      //   color: Colors.black87,
                                      //   iconSize: 38,
                                      //   icon: const Icon(Icons.money_rounded),
                                      //   onPressed: () {
                                      //     // handle the press
                                      //     Navigator.of(context,
                                      //             rootNavigator: true,
                                      //           )
                                      //         .push(MaterialPageRoute(
                                      //             builder: (context) {
                                      //       // return DetailPage(bean);
                                      //       return SignIn();
                                      //     }));
                                      //   },
                                      // ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 1.0,
                                                bottom: 1.0,
                                                left: 30.0,
                                                right: 3.0),
                                            child: Text(
                                              "Transfer",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12 * textScale,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
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
                                      //                            (state is AuthAuthenticatedState)
                                      // ?
                                      IconButton(
                                        color: Colors.black87,
                                        iconSize: 38,
                                        icon: const Icon(Icons.money_rounded),
                                        onPressed: () {
                                          // handle the press
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).push(MaterialPageRoute(
                                              builder: (context) {
                                            // return DetailPage(bean);
                                            return Convert();
                                          }));
                                        },
                                      ),
                                      // :
                                      //      IconButton(
                                      //   color: Colors.black87,
                                      //   iconSize: 38,
                                      //   icon: const Icon(Icons.money_rounded),
                                      //   onPressed: () {
                                      //     // handle the press
                                      //     Navigator.of(context,
                                      //             rootNavigator: true,
                                      //           )
                                      //         .push(MaterialPageRoute(
                                      //             builder: (context) {
                                      //       // return DetailPage(bean);
                                      //       return SignIn();
                                      //     }));
                                      //   },
                                      // ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 1.0,
                                                bottom: 1.0,
                                                left: 30.0,
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
                                      //          (state is AuthAuthenticatedState)
                                      // ?
                                      IconButton(
                                        color: Colors.black87,
                                        iconSize: 38,
                                        icon: const Icon(Icons.money_rounded),
                                        onPressed: () {
                                          // Navigator.of(context,rootNavigator: true)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   // return DetailPage(bean);
                                          //   return Earn();
                                          // }));
                                        },
                                      ),
                                      //   : IconButton(
                                      //   color: Colors.black87,
                                      //   iconSize: 38,
                                      //   icon: const Icon(Icons.money_rounded),
                                      //   onPressed: () {

                                      //     Navigator.of(context,rootNavigator: true)
                                      //         .push(MaterialPageRoute(builder: (context) {
                                      //       // return DetailPage(bean);
                                      //       return Signin();
                                      //     }));
                                      //   },
                                      // ),

                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 1.0,
                                                bottom: 1.0,
                                                left: 40.0,
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
                                      //   (state is AuthAuthenticatedState)
                                      // ?

                                      IconButton(
                                        color: Colors.black87,
                                        iconSize: 38,
                                        icon: const Icon(Icons.money_rounded),
                                        onPressed: () {
                                          // handle the press
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).push(MaterialPageRoute(
                                              builder: (context) {
                                            // return DetailPage(bean);
                                            return Others();
                                          }));
                                        },
                                      ),
                                      // :
                                      // IconButton(
                                      //     color: Colors.black87,
                                      //     iconSize: 38,
                                      //     icon: const Icon(Icons.money_rounded),
                                      //     onPressed: () {
                                      //       // handle the press
                                      //       Navigator.of(context,
                                      //               rootNavigator: true,
                                      //          )
                                      //           .push(MaterialPageRoute(
                                      //               builder: (context) {
                                      //         // return DetailPage(bean);
                                      //         return  SignIn();
                                      //       }));
                                      //     },
                                      //   ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 1.0,
                                                bottom: 1.0,
                                                left: 30.0,
                                                right: 3.0),
                                            child: Text(
                                              "More",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12 * textScale,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                      SliverToBoxAdapter(
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              child: Container(
                                height: screenHeight * 0.002,
                                width: screenWidth * 0.880,
                              ))),
                      SliverToBoxAdapter(
                          child: Container(
                        height: screenHeight * 0.840,
                        width: screenWidth * 0.880,
                        color: theme.backgroundColor,
                        child: const NestedTabBar(),
                      )),
                    ],
                  ),
                  // drawer: Container(
                  //   color: theme.backgroundColor,
                  //   width: screenWidth * 1.15,
                  //   child: Drawer(
                  //     child: Container(
                  //       color: theme.backgroundColor,
                  //       width: screenWidth * 1.15,
                  //       child: ListView(
                  //         padding: EdgeInsets.zero,
                  //         children: <Widget>[
                  //           DrawerHeader(
                  //             padding: EdgeInsets.only(bottom: 0.0, top: 0.0),
                  //             margin: EdgeInsets.only(bottom: 0.0, top: 0.0),
                  //             decoration: BoxDecoration(
                  //               color: theme.scaffoldBackgroundColor,
                  //             ),
                  //             child: Column(
                  //               verticalDirection: VerticalDirection.down,
                  //               // crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Row(
                  //                     verticalDirection: VerticalDirection.down,
                  //                     children: [
                  //                       const Padding(
                  //                           padding: EdgeInsets.only(left: 10.0)),
                  //                       Container(
                  //                         height: screenHeight * 0.080,
                  //                         alignment: Alignment.topLeft,
                  //                         child: InkWell(
                  //                           onTap: () {
                  //                             Navigator.pop(context);
                  //                           },
                  //                           child: const Icon(Icons.close_rounded,
                  //                               size: 30),
                  //                         ),
                  //                       ),
                  //                       Expanded(
                  //                           child:
                  //                               Container(width: screenWidth * 0.65)),
                  //                       IconButton(
                  //                         icon: const Icon(Icons.brightness_4_rounded),
                  //                         onPressed: () {
                  //                           currentTheme.toggleTheme();
                  //                         },
                  //                       ),
                  //                     ]),
                  //                 Row(
                  //                   children: [
                  //                     Padding(
                  //                       padding: EdgeInsets.only(top: 10.0, left: 10.0),
                  //                       child: Icon(
                  //                         Icons.person_pin,
                  //                         color: Colors.black,
                  //                         size: 45.0,
                  //                       ),
                  //                     ),
                  //                     Padding(
                  //                       padding: EdgeInsets.only(left: 0.0, top: 10.0),
                  //                       child: InkWell(
                  //                         child: Column(
                  //                           children: [
                  //                             Row(
                  //                               children: [
                  //                                 Padding(
                  //                                     padding: EdgeInsets.only(
                  //                                         left: 8.0, top: 0.0)),
                  //                                 Text(
                  //                                   "Welcome to cx",
                  //                                   style: TextStyle(
                  //                                       fontSize: 24.0 * textScale,
                  //                                       color: Colors.black),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             Row(
                  //                               children: [  InkWell(
                  //                                    onTap: () {
                  //                           Navigator.of(context,rootNavigator: true, rootNavigator: true).push(
                  //                               MaterialPageRoute(builder: (context) {
                  //                             // return DetailPage(bean);
                  //                             return SignIn();
                  //                           }));
                  //                         },
                  //                                 child:   Text(
                  //                                   "Login",
                  //                                   style: TextStyle(
                  //                                       fontSize: 16.0 * textScale,
                  //                                       color: Colors.black),
                  //                                 ),),
                  //                                 SizedBox(width: screenWidth*0.010,),
                  //                              InkWell(
                  //                                    onTap: () {
                  //                           Navigator.of(context,rootNavigator: true, rootNavigator: true).push(
                  //                               MaterialPageRoute(builder: (context) {
                  //                             // return DetailPage(bean);
                  //                             return SignUp();
                  //                           }));
                  //                         },
                  //                                 child:   Text(
                  //                                   "or Register",
                  //                                   style: TextStyle(
                  //                                       fontSize: 16.0 * textScale,
                  //                                       color: Colors.black),
                  //                                 ),),
                  //                                 Padding(
                  //                                     padding: EdgeInsets.only(
                  //                                         left: 65.0, top: 0.0)),
                  //                               ],
                  //                             ),
                  //                             Row(
                  //                               children: [],
                  //                             ),
                  //                           ],
                  //                         ),

                  //                       ),
                  //                     ),

                  //                     // InkWell(
                  //                     //   child: Text(
                  //                     //     "unverified",
                  //                     //     style: TextStyle(
                  //                     //         fontSize: 12 * textScale,
                  //                     //         color: theme.backgroundColor),
                  //                     //   ),
                  //                     //   onTap: () {
                  //                     //     Navigator.of(context,rootNavigator: true)
                  //                     //         .push(MaterialPageRoute(builder: (context) {
                  //                     //       // return DetailPage(bean);
                  //                     //       return VerificationPersonal();
                  //                     //     }));
                  //                     //   },
                  //                     // ),
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           NestedTabBar2()
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ))
        // ;
        //   },
        // )
        );
  }
}
