// import 'dart:html';

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cx/data/dataproviders/coin_provider.dart';
// import 'package:cx/data/extra/extra.dart';
// import 'package:cx/businesslogic/blocs/account/account_bloc.dart';
// import 'package:cx/businesslogic/blocs/asset/asset_bloc.dart';

// import 'package:cx/data/models/asset.dart';
// import 'package:cx/data/models/coin.dart';
// import 'package:cx/data/models/user.dart';
// import 'package:cx/data/repositories/asset_repository.dart';

import 'p2psell.dart';
import 'travel_bean.dart';
import 'collection.dart';

import 'movie_details_page.dart';

import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class SearchOrders extends StatefulWidget {
  const SearchOrders({Key? key}) : super(key: key);

  @override
  _SearchOrdersState createState() => _SearchOrdersState();
}

class _SearchOrdersState extends State<SearchOrders>
    with TickerProviderStateMixin {
  // List<User> _foundedUsers = [];

  // late List<Coin> cryptos = [];
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  // Future init() async {
  //   final cyrptos = await CoinProvider.getMarketCoins(query);

  //   setState(() => this.cryptos = cyrptos);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);

    // init();
  }

  onSearch(String search) {
    setState(() {
      // _foundedUsers = _users
      //     .where((user) => user.name.toLowerCase().contains(search))
      //     .toList();
    });
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
    _nestedTabController.dispose();
  }

  final ScrollController _controller = ScrollController();

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    // return BlocConsumer<AccountBloc, AccountState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    //   }, // @ts-ignore
    //   builder: (context, state) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            // appBar: AppBar(
            //   automaticallyImplyLeading: false,
            //   elevation: 0.2,
            //   shadowColor: theme.scaffoldBackgroundColor,
            //   backgroundColor: theme.scaffoldBackgroundColor,

            // ),
            body: Scaffold(
              backgroundColor: theme.backgroundColor,
              appBar: AppBar(
                  elevation: 0.2,
                  bottomOpacity: 1.0,
                  shadowColor: theme.scaffoldBackgroundColor,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  automaticallyImplyLeading: false,
                  title: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text('Orders',
                            style: TextStyle(
                                fontSize: 14 * textScale,
                                color: Colors.black87))),
                  )),
              body: Container(
                  color: theme.backgroundColor,
                  child: ListView(
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            Text('Limit order',
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text("",
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text('Advanced Limit Order',
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text("",
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text('Market Order',
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text("",
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text('Stop Order',
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text("",
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text('Trailing Order',
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text("",
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text('Trigger Order',
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                )),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text("",
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                      ),
                    ],
                  )),
            )));
    //   },
    // );
  }
}
