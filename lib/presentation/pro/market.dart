import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/coin/coin_bloc.dart';
import 'chart.dart';
import 'selecttoken.dart';
import 'travel_bean.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'coustom_bottom_nav_bar.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../main.dart';

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
  List<String> getListItems1() {
    return [
      'ETH',
      'MATIC',
      'SHIB',
      'USDT',
      'BNB',
      'XRP',
      'ADA',
      'SOL',
      'TRX',
      'BUSD',
      'AVAX',
      'ETC'
    ];
  }

  List<String> getListItems2() {
    return [
      '5465.98',
      '6798.09',
      '435.78',
      '423.78',
      '46.89',
      '87.89',
      '58.978',
      '43.789',
      '54.8',
      '75.98',
      '42.987',
      '42.7'
    ];
  }

  List<String> getListItems3() {
    return [
      'ETH',
      '53,798k',
      '56,987k',
      '56,897k',
      '53,796k',
      '64,897k',
      '67,976k',
      '67,897k',
      '76,9876k',
      '65,876k',
      '76,789k',
      '65,987k'
    ];
  }

  List<String> getListItems4() {
    return [
      '+1.95%',
      '-0.78%',
      '+0.78%',
      '-1.46%',
      '+0.46%',
      '+0.08%',
      '-2.79%',
      '+8.6%',
      '-8.3%',
      '+3.89%',
      '-8.9%',
      '+2.3%',
      '-1.68%'
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;
    List<String> list1 = getListItems1();
    List<String> list2 = getListItems2();
    List<String> list3 = getListItems3();
    List<String> list4 = getListItems4();

    final theme = Theme.of(context);
    List<TravelBean> _list = TravelBean.generateMostPopularBean();

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              color: theme.backgroundColor,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
                  controller: _nestedTabController,
                  indicatorColor: Colors.black87,
                  labelColor: Colors.black87,
                  automaticIndicatorColorAdjustment: true,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  tabs: <Widget>[
                    Tab(
                        child: Text("BTC",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("USDT",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("ETH",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("DAI",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("SOL",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: screenHeight * 0.058,
                  color: theme.backgroundColor,
                  child: ListTile(
                      title: Row(
                        children: [
                          Text("Trading Pairs",
                              style: TextStyle(
                                  fontSize: 11 * textScale,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w500)),
                          Expanded(child: Container(width: screenWidth * 0.08)),
                        ],
                      ),
                      trailing: Text("Price/Vol     24H Change",
                          style: TextStyle(
                              fontSize: 11 * textScale,
                              color: Colors.black38,
                              fontWeight: FontWeight.w500))),
                ),
                Column(children: [
                  Container(
                      color: theme.backgroundColor,
                      height: screenHeight * 0.90,
                      child:
                          //  BlocConsumer<CoinBloc, CoinState>(
                          //     listener: (context, state) {
                          // TODO: implement listener
                          //            if (state is SuccessCoinState) {
                          //   ScaffoldMessenger.of(context).showSnackBar((
                          //     const SnackBar(
                          //       duration: Duration(seconds: 2),
                          //       content: Text(' succeess ', textScaleFactor: 1.5),
                          //     ),
                          //   );
                          // }         else if (state is ErrorCoinState) {

                          // ScaffoldMessenger.of(context).showSnackBar((
                          //   const SnackBar(
                          //     duration: Duration(seconds: 2),
                          //     content: Text(' error ', textScaleFactor: 1.5),
                          //   ),
                          // );
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
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
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
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
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
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
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
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
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
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                      // ;
                      // }),
                      )
                ]),
              ],
            )
          ],
        ));
  }
}

class NestedTabBar2 extends StatefulWidget {
  const NestedTabBar2({Key? key}) : super(key: key);

  @override
  _NestedTabBar2State createState() => _NestedTabBar2State();
}

class _NestedTabBar2State extends State<NestedTabBar2>
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
  List<String> getListItems1() {
    return [
      'ETH',
      'MATIC',
      'SHIB',
      'USDT',
      'BNB',
      'XRP',
      'ADA',
      'SOL',
      'TRX',
      'BUSD',
      'AVAX',
      'ETC'
    ];
  }

  List<String> getListItems2() {
    return [
      '5465.98',
      '6798.09',
      '435.78',
      '423.78',
      '46.89',
      '87.89',
      '58.978',
      '43.789',
      '54.8',
      '75.98',
      '42.987',
      '42.7'
    ];
  }

  List<String> getListItems3() {
    return [
      'ETH',
      '53,798k',
      '56,987k',
      '56,897k',
      '53,796k',
      '64,897k',
      '67,976k',
      '67,897k',
      '76,9876k',
      '65,876k',
      '76,789k',
      '65,987k'
    ];
  }

  List<String> getListItems4() {
    return [
      '+1.95%',
      '-0.78%',
      '+0.78%',
      '-1.46%',
      '+0.46%',
      '+0.08%',
      '-2.79%',
      '+8.6%',
      '-8.3%',
      '+3.89%',
      '-8.9%',
      '+2.3%',
      '-1.68%'
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;
    List<String> list1 = getListItems1();
    List<String> list2 = getListItems2();
    List<String> list3 = getListItems3();
    List<String> list4 = getListItems4();

    final theme = Theme.of(context);
    List<TravelBean> _list = TravelBean.generateMostPopularBean();

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              color: theme.backgroundColor,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
                  controller: _nestedTabController,
                  indicatorColor: Colors.black87,
                  labelColor: Colors.black87,
                  automaticIndicatorColorAdjustment: true,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  tabs: <Widget>[
                    Tab(
                        child: Text("BTC",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("USDT",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("ETH",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("DAI",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("SOL",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: screenHeight * 0.058,
                  color: theme.backgroundColor,
                  child: ListTile(
                      title: Row(
                        children: [
                          Text("Trading Pairs",
                              style: TextStyle(
                                  fontSize: 11 * textScale,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w500)),
                          Expanded(child: Container(width: screenWidth * 0.08)),
                        ],
                      ),
                      trailing: Text("Price/Vol      Change",
                          style: TextStyle(
                              fontSize: 11 * textScale,
                              color: Colors.black38,
                              fontWeight: FontWeight.w500))),
                ),
                Column(children: [
                  Container(
                      color: theme.backgroundColor,
                      height: screenHeight * 0.90,
                      child:
                          //  BlocConsumer<CoinBloc, CoinState>(
                          //     listener: (context, state) {
                          // TODO: implement listener
                          //            if (state is SuccessCoinState) {
                          //   ScaffoldMessenger.of(context).showSnackBar((
                          //     const SnackBar(
                          //       duration: Duration(seconds: 2),
                          //       content: Text(' succeess ', textScaleFactor: 1.5),
                          //     ),
                          //   );
                          // }         else if (state is ErrorCoinState) {

                          // ScaffoldMessenger.of(context).showSnackBar((
                          //   const SnackBar(
                          //     duration: Duration(seconds: 2),
                          //     content: Text(' error ', textScaleFactor: 1.5),
                          //   ),
                          // );
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
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
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
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
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
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
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
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
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
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                      // ;
                      // }),
                      )
                ]),
              ],
            )
          ],
        ));
  }
}

class NestedTabBar3 extends StatefulWidget {
  const NestedTabBar3({Key? key}) : super(key: key);

  @override
  _NestedTabBar3State createState() => _NestedTabBar3State();
}

class _NestedTabBar3State extends State<NestedTabBar3>
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
  List<String> getListItems1() {
    return [
      'ETH',
      'MATIC',
      'SHIB',
      'USDT',
      'BNB',
      'XRP',
      'ADA',
      'SOL',
      'TRX',
      'BUSD',
      'AVAX',
      'ETC'
    ];
  }

  List<String> getListItems2() {
    return [
      '5465.98',
      '6798.09',
      '435.78',
      '423.78',
      '46.89',
      '87.89',
      '58.978',
      '43.789',
      '54.8',
      '75.98',
      '42.987',
      '42.7'
    ];
  }

  List<String> getListItems3() {
    return [
      'ETH',
      '53,798k',
      '56,987k',
      '56,897k',
      '53,796k',
      '64,897k',
      '67,976k',
      '67,897k',
      '76,9876k',
      '65,876k',
      '76,789k',
      '65,987k'
    ];
  }

  List<String> getListItems4() {
    return [
      '+1.95%',
      '-0.78%',
      '+0.78%',
      '-1.46%',
      '+0.46%',
      '+0.08%',
      '-2.79%',
      '+8.6%',
      '-8.3%',
      '+3.89%',
      '-8.9%',
      '+2.3%',
      '-1.68%'
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;
    List<String> list1 = getListItems1();
    List<String> list2 = getListItems2();
    List<String> list3 = getListItems3();
    List<String> list4 = getListItems4();

    final theme = Theme.of(context);
    List<TravelBean> _list = TravelBean.generateMostPopularBean();

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              color: theme.backgroundColor,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
                  controller: _nestedTabController,
                  indicatorColor: Colors.black87,
                  labelColor: Colors.black87,
                  automaticIndicatorColorAdjustment: true,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  tabs: <Widget>[
                    Tab(
                        child: Text("BTC",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("USDT",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("ETH",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("DAI",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("SOL",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: screenHeight * 0.058,
                  color: theme.backgroundColor,
                  child: ListTile(
                      title: Row(
                        children: [
                          Text("Trading Pairs",
                              style: TextStyle(
                                  fontSize: 11 * textScale,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w500)),
                          Expanded(child: Container(width: screenWidth * 0.08)),
                        ],
                      ),
                      trailing: Text("Price/Vol     24H Change",
                          style: TextStyle(
                              fontSize: 11 * textScale,
                              color: Colors.black38,
                              fontWeight: FontWeight.w500))),
                ),
                Column(children: [
                  Container(
                      color: theme.backgroundColor,
                      height: screenHeight * 0.90,
                      child:
                          //  BlocConsumer<CoinBloc, CoinState>(
                          //     listener: (context, state) {
                          // TODO: implement listener
                          //            if (state is SuccessCoinState) {
                          //   ScaffoldMessenger.of(context).showSnackBar((
                          //     const SnackBar(
                          //       duration: Duration(seconds: 2),
                          //       content: Text(' succeess ', textScaleFactor: 1.5),
                          //     ),
                          //   );
                          // }         else if (state is ErrorCoinState) {

                          // ScaffoldMessenger.of(context).showSnackBar((
                          //   const SnackBar(
                          //     duration: Duration(seconds: 2),
                          //     content: Text(' error ', textScaleFactor: 1.5),
                          //   ),
                          // );
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
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
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
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
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
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
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
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
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
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount: list1.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];
                              return Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                child: InkWell(
                                  child: Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return Chart();
                                        }));
                                      },
                                      title: Row(
                                        children: [
                                          Text('${list1[index]}'),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list2[index]}'),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text('${list3[index]}',
                                              style: TextStyle(
                                                fontSize: 11 * textScale,
                                              ))
                                        ],
                                      ),
                                      trailing: Container(
                                        height: screenHeight * 0.048,
                                        width: screenWidth * 0.198,
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text('${list4[index]}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14 * textScale,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                      // ;
                      // }),
                      )
                ]),
              ],
            )
          ],
        ));
  }
}

class Market extends StatefulWidget {
  Market();

  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _MarketMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _MarketTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _MarketTablet extends StatefulWidget {
  _MarketTablet();

  @override
  __MarketTabletState createState() => __MarketTabletState();
  final List<String> list = List.generate(10, (index) => "nutrinax $index");
}

class __MarketTabletState extends State<_MarketTablet> {
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,

          elevation: 0.2,
          bottomOpacity: 1.0,
          shadowColor: theme.scaffoldBackgroundColor,
          backgroundColor: theme.scaffoldBackgroundColor,
          toolbarHeight: 50.0,
          title: Container(
              height: screenHeight * 0.080,
              child: Row(
                children: [
                  // Text('search'),
                  TabBar(
                    indicatorColor: Colors.grey[200],
                    labelColor: Colors.black87,
                    automaticIndicatorColorAdjustment: true,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    isScrollable: true,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                          child: Text('Spot',
                              style: TextStyle(
                                fontSize: 16 * textScale,
                              ))),
                      Tab(
                          child: Text('Futures',
                              style: TextStyle(
                                fontSize: 16 * textScale,
                              ))),
                      Tab(
                          child: Text('Discover',
                              style: TextStyle(
                                fontSize: 16 * textScale,
                              ))),
                    ],
                  ),
                  Expanded(child: Container(width: screenWidth * 0.18)),

                  IconButton(
                    color: Colors.black,
                    iconSize: 18,
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        // return DetailPage(bean);
                        return SearchList();
                      }));
                    },
                  ),
                ],
              )),
          // actions: [Icon(Icons.search_outlined),],
        ),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[];
            },
            body: Scaffold(
              backgroundColor: theme.backgroundColor,
              body: const TabBarView(
                children: <Widget>[
                  NestedTabBar(),
                  NestedTabBar2(),
                  NestedTabBar3(),
                ],
              ),
            )),

        // bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}

class _MarketMobile extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "nutrinax $index");

  _MarketMobile(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _MarketMobileState createState() => _MarketMobileState();
}

class _MarketMobileState extends State<_MarketMobile> {
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,

          elevation: 0.2,
          bottomOpacity: 1.0,
          shadowColor: theme.scaffoldBackgroundColor,
          backgroundColor: theme.scaffoldBackgroundColor,
          toolbarHeight: 50.0,
          title: Container(
              height: screenHeight * 0.080,
              child: Row(
                children: [
                  // Text('search'),
                  TabBar(
                    indicatorColor: Colors.grey[200],
                    labelColor: Colors.black87,
                    automaticIndicatorColorAdjustment: true,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    isScrollable: true,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                          child: Text('Spot',
                              style: TextStyle(
                                fontSize: 16 * textScale,
                              ))),
                      Tab(
                          child: Text('Futures',
                              style: TextStyle(
                                fontSize: 16 * textScale,
                              ))),
                      Tab(
                          child: Text('Discover',
                              style: TextStyle(
                                fontSize: 16 * textScale,
                              ))),
                    ],
                  ),
                  Expanded(child: Container(width: screenWidth * 0.18)),

                  IconButton(
                    color: Colors.black,
                    iconSize: 18,
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        // return DetailPage(bean);
                        return SearchList();
                      }));
                    },
                  ),
                ],
              )),
          // actions: [Icon(Icons.search_outlined),],
        ),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[];
            },
            body: Scaffold(
              backgroundColor: theme.backgroundColor,
              body: TabBarView(
                children: <Widget>[
                  NestedTabBar(),
                  NestedTabBar2(),
                  NestedTabBar3(),
                ],
              ),
            )),

        // bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
