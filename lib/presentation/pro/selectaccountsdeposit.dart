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

import 'deposit.dart';
import 'p2psell.dart';
import 'travel_bean.dart';
import 'collection.dart';

import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class SearchAccountsDeposits extends StatefulWidget {
  const SearchAccountsDeposits({Key? key}) : super(key: key);

  @override
  _SearchAccountsDepositsState createState() => _SearchAccountsDepositsState();
}

class _SearchAccountsDepositsState extends State<SearchAccountsDeposits>
    with TickerProviderStateMixin {
  List _foundedUsers = [];

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
                        child: Text('Accounts',
                            style: TextStyle(
                                fontSize: 14 * textScale,
                                color: Colors.black87))),
                  )),
              body: Container(
                  color: theme.backgroundColor,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(
                            context,
                            rootNavigator: true,
                          ).push(MaterialPageRoute(builder: (context) {
                            return Deposit();
                          }));
                        },
                        title: Row(
                          children: [
                            Text('Main Account',
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
                        //                  onTap:() {

                        //               Navigator.of(context,
                        //                       rootNavigator: true,
                        //                )
                        //                   .push(MaterialPageRoute(
                        //                       builder: (context) {
                        //                 return Deposit( account: 'Spot Account');
                        //               }));

                        //  },
                        title: Row(
                          children: [
                            Text('Spot Account',
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
                        //                 onTap:() {

                        //               Navigator.of(context,
                        //                       rootNavigator: true,
                        //                )
                        //                   .push(MaterialPageRoute(
                        //                       builder: (context) {
                        //                 return Deposit( account: 'Margins Account');
                        //               }));

                        //  },
                        title: Row(
                          children: [
                            Text('Margins Account',
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
                        //                 onTap:() {

                        //               Navigator.of(context,
                        //                       rootNavigator: true,
                        //                )
                        //                   .push(MaterialPageRoute(
                        //                       builder: (context) {
                        //                 return Deposit( account: 'Futures Account');
                        //               }));

                        //  },
                        title: Row(
                          children: [
                            Text('Futures Account',
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
                        //                 onTap:() {

                        //               Navigator.of(context,
                        //                       rootNavigator: true,
                        //                )
                        //                   .push(MaterialPageRoute(
                        //                       builder: (context) {
                        //                 return Deposit( account: 'Earns Account');
                        //               }));

                        //  },
                        title: Row(
                          children: [
                            Text('Earns Account',
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
