// import 'dart:html';

import 'dart:async';

import '../../data/extra/extra.dart';
import '../../data/models/coin.dart';
import '../pro/chat.dart';
import '../pro/deposit.dart';
import '../pro/repay.dart';
import '../pro/transfer.dart';
import '../pro/withdraw.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../data/dataproviders/coin_provider.dart';
// import '../../data/extra/extra.dart';
// import '../../businesslogic/blocs/account/account_bloc.dart';
// import '../../businesslogic/blocs/asset/asset_bloc.dart';

// import '../../data/models/asset.dart';
// import '../../data/models/coin.dart';
// import '../../data/models/user.dart';
// import '../../data/repositories/asset_repository.dart';

import '../../businesslogic/blocs/asset/asset_bloc.dart';
import 'borrow.dart';
import 'chart.dart';
import 'p2psell.dart';
import 'travel_bean.dart';
import 'collection.dart';

import 'movie_details_page.dart';

import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

void onSearch(String value) {}
late List<Coin> coins = [];

class SearchListAddresss extends StatefulWidget {
  const SearchListAddresss({Key? key}) : super(key: key);

  @override
  _SearchListAddresssState createState() => _SearchListAddresssState();
}

class _SearchListAddresssState extends State<SearchListAddresss>
    with TickerProviderStateMixin {
//

  // List<User> _foundedUsers = [];
  //late List <Fiat> fiats=[]
//  late List<Coin> coins=[];
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  Future init() async {
    // final coins = await CoinProvider.getMarketCoins(query);

    // setState(() => this.coins = coins);
  }

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    // coins = coinsdata;
    // init();
  }

  // void onSearch(String query) {
  //   // _foundedUsers = _users
  //   //     .where((user) => user.name.toLowerCase().contains(search))
  //   //     .toList();
  //   final coins = coinsdata.where((coin) {
  //     final titleLower = coin.symbol!.toLowerCase();
  //     final authorLower = coin.name!.toLowerCase();
  //     final searchLower = query.toLowerCase();

  //     return titleLower.contains(searchLower) ||
  //         authorLower.contains(searchLower);
  //   }).toList();

  //   setState(() {
  //     this.query = query;
  //     this.coins = coins;
  //   });
  // }

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

    // final style = widget.text.isEmpty ? styleHint : styleActive;

    // return
    //  BlocConsumer<AssetBloc, AssetState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    // if (state is SuccessAuthState) {
    //       ScaffoldMessenger.of(context).showSnackBar((
    //         const SnackBar(
    //           duration: Duration(seconds: 2),
    //           content: Text(' succeess ', textScaleFactor: 1.5),
    //         ),
    //       );
    //     }         else if (state is ErrorAuthcState) {

    //     ScaffoldMessenger.of(context).showSnackBar((
    //       const SnackBar(
    //         duration: Duration(seconds: 2),
    //         content: Text(' error ', textScaleFactor: 1.5),
    //       ),
    //     );
    //     }
    //   }, // @ts-ignore
    //   builder: (context, state) {

    // if (state is _ErrorAssetState) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //           backgroundColor: theme.backgroundColor,
    //           appBar: AppBar(
    //             automaticallyImplyLeading: false,
    //             elevation: 0.2,
    //             shadowColor: theme.scaffoldBackgroundColor,
    //             backgroundColor: theme.scaffoldBackgroundColor,
    //             title: Container(
    //               height: 28,
    //               child: TextField(
    //                 onChanged: onSearch,
    //                 decoration: InputDecoration(
    //                     suffixIcon: GestureDetector(
    //                       child: Icon(
    //                         Icons.close,
    //                       ),
    //                       onTap: () {
    //                         controller.clear();
    //                         // widget.onChanged('');
    //                         FocusScope.of(context)
    //                             .requestFocus(FocusNode());
    //                       },
    //                     ),
    //                     filled: true,
    //                     fillColor: theme.backgroundColor,
    //                     contentPadding: EdgeInsets.all(0),
    //                     prefixIcon: Icon(
    //                       Icons.search,
    //                       color: Colors.grey.shade500,
    //                     ),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(50),
    //                         borderSide: BorderSide.none),
    //                     hintStyle: TextStyle(
    //                         fontSize: 14, color: Colors.grey.shade500),
    //                     hintText: "Search Crypto or Currency"),
    //               ),
    //             ),
    //           ),
    //           body: Scaffold(
    //             backgroundColor: theme.backgroundColor,
    //             appBar: AppBar(
    //                 elevation: 0.2,
    //                 bottomOpacity: 1.0,
    //                 shadowColor: theme.scaffoldBackgroundColor,
    //                 backgroundColor: theme.scaffoldBackgroundColor,
    //                 automaticallyImplyLeading: false,
    //                 title: Padding(
    //                     padding: EdgeInsets.only(left: 0),
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: TabBar(
    //                         indicatorColor: theme.scaffoldBackgroundColor,
    //                         controller: _nestedTabController,
    //                         isScrollable: true,
    //                         tabs: [
    //                           Tab(
    //                               child: Text('Crypto',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                           Tab(
    //                               child: Text('Currency',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                         ],
    //                       ),
    //                     ))),
    //             body: Container(
    //          color: theme.canvasColor,
    //                 child: Container(
    //               color: theme.backgroundColor,
    //               child:  TabBarView(
    //                       controller: _nestedTabController,
    //                       children: <Widget>[

    //                           ListView.builder(
    //                             controller: _controller,
    //                             physics: const BouncingScrollPhysics(
    //                                 parent:
    //                                     AlwaysScrollableScrollPhysics()),
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: coins.length,
    //                             padding: const EdgeInsets.all(1.0),
    //                             itemBuilder: (context, index) {
    //                               var coin = coins[index];
    //                               return Container(
    //                                 color: Colors.white70,
    //                                 // width: screenWidth * 0.880,
    //                                                                           child:Text("Something Went Wrong Error Code :")

    //                               );
    //                             },
    //                           ),

    //                           ListView(
    //                               controller: _controller,
    //                               physics: const BouncingScrollPhysics(
    //                                   parent:
    //                                       AlwaysScrollableScrollPhysics()),
    //                               scrollDirection: Axis.vertical,
    //                               // itemCount: 8,
    //                               padding: const EdgeInsets.all(1.0),
    //                               // itemBuilder: (context, index) {
    //                               //   var bean = _list[index]; return
    //                               children: [
    //                                 Container(
    //                                   color: Colors.white70,
    //                                   // width: screenWidth * 0.880,
    //                                   child:Text("Something Went Wrong Error Code :")
    //                                 )
    //                               ]
    //                               // },
    //                               ),

    //                         ])
    //                   ),

    //                       ),
    //           )));
    // }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.2,
              shadowColor: theme.scaffoldBackgroundColor,
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Container(
                height: 28,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          controller.clear();
                          // widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search Crypto or Currency"),
                ),
              ),
            ),
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
                        child: TabBar(
                          indicatorColor: theme.scaffoldBackgroundColor,
                          controller: _nestedTabController,
                          isScrollable: true,
                          tabs: [
                            Tab(
                                child: Text('Crypto',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                            Tab(
                                child: Text('Currency',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                          ],
                        ),
                      ))),
              body: Container(
                  color: theme.canvasColor,
                  child: TabBarView(
                      controller: _nestedTabController,
                      children: <Widget>[
                        ListView.builder(
                          controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          itemCount: coins.length,
                          padding: const EdgeInsets.all(1.0),
                          itemBuilder: (context, index) {
                            var coin = coins[index];
                            return Container(
                              color: Colors.white70,
                              // width: screenWidth * 0.880,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    // return DetailPage(bean);
                                    return NftDetailsPage();
                                  }));
                                },
                                //                 child: (state is _LoadedAssetState)
                                // ?
                                // Column(children: [
                                //                   ListTile(
                                //                     title: Row(
                                //                       children: [
                                //                         Text(coin.name!,
                                //                             style: TextStyle(
                                //                               fontSize:
                                //                                   14 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             )),
                                //                         Expanded(
                                //                             child: Container(
                                //                                 width: screenWidth *
                                //                                     0.08)),
                                //                         Text(coin.symbol!,
                                //                             style: TextStyle(
                                //                               fontSize:
                                //                                   14 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             ))
                                //                       ],
                                //                     ),
                                //                     subtitle: Row(
                                //                       children: [
                                //                         // Text("EOS",
                                //                         //     style: TextStyle(
                                //                         //       fontSize: 12 * textScale,
                                //                         //     )),
                                //                         Expanded(
                                //                             child: Container(
                                //                                 width: screenWidth *
                                //                                     0.08)),
                                //                         Text("1.7575",
                                //                             style: TextStyle(
                                //                               color: theme.hoverColor,
                                //                               fontSize:
                                //                                   11 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             ))
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 ]): const Center(
                                //     child: CircularProgressIndicator(),
                                //   )
                              ),
                            );
                          },
                        ),
                        ListView(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            // itemCount: 8,
                            padding: const EdgeInsets.all(1.0),
                            // itemBuilder: (context, index) {
                            //   var bean = _list[index]; return
                            children: [
                              Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                // child: InkWell(
                                //   onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   // return DetailPage(bean);
                                //   return NftDetailsPage();
                                // }));
                                // },
                                // child:

                                //                                 (state is _LoadedAssetState)
                                //               ?
                                //                Column(children: [
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("ETH",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("EOS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.78",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),

                                //                                       onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Chart(token: "qwerty"),
                                //     ),
                                //   );
                                // },
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SHIB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.00001314.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.0000013",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BTC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("2610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("cx",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("FT",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BNB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("MATIC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("34.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("XRP",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("AVAX",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("22.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("NFTB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SPA",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("CPOOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("IXS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.29",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                 ])
                                //                                   : const Center(
                                //                   child: CircularProgressIndicator(),
                                //                 ))
                              )
                            ]
                            // },
                            ),
                      ])),
            )));
    //   },
    // );
  }
}

class SearchListWithdraw extends StatefulWidget {
  const SearchListWithdraw({Key? key}) : super(key: key);

  @override
  _SearchListWithdrawState createState() => _SearchListWithdrawState();
}

class _SearchListWithdrawState extends State<SearchListWithdraw>
    with TickerProviderStateMixin {
//

  late List<Coin> coins = [];
  // List<User> _foundedUsers = [];
  //late List <Fiat> fiats=[]
  //  // late List<Coin> coins;
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  Future init() async {
    // final coins = await CoinProvider.getMarketCoins(query);

    // setState(() => this.coins = coins);
  }

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    coins = coinsdata;
    //  init();
  }

  void onSearch(String query) {
    // _foundedUsers = _users
    //     .where((user) => user.name.toLowerCase().contains(search))
    //     .toList();
    coins = coinsdata.where((coin) {
      final titleLower = coin.symbol!.toLowerCase();
      final authorLower = coin.name!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.coins = coins;
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

    // final style = widget.text.isEmpty ? styleHint : styleActive;

    // return
    //  BlocConsumer<AssetBloc, AssetState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    // if (state is SuccessAssetcState) {
    //       ScaffoldMessenger.of(context).showSnackBar((
    //         const SnackBar(
    //           duration: Duration(seconds: 2),
    //           content: Text(' succeess ', textScaleFactor: 1.5),
    //         ),
    //       );
    //     }         else if (state is ErrorAssetState) {

    //     ScaffoldMessenger.of(context).showSnackBar((
    //       const SnackBar(
    //         duration: Duration(seconds: 2),
    //         content: Text(' error ', textScaleFactor: 1.5),
    //       ),
    //     );
    //     }
    //   }, // @ts-ignore
    //   builder: (context, state) {

    // if (state is _ErrorAssetState) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //           backgroundColor: theme.backgroundColor,
    //           appBar: AppBar(
    //             automaticallyImplyLeading: false,
    //             elevation: 0.2,
    //             shadowColor: theme.scaffoldBackgroundColor,
    //             backgroundColor: theme.scaffoldBackgroundColor,
    //             title: Container(
    //               height: 28,
    //               child: TextField(
    //                 onChanged: onSearch,
    //                 decoration: InputDecoration(
    //                     suffixIcon: GestureDetector(
    //                       child: Icon(
    //                         Icons.close,
    //                       ),
    //                       onTap: () {
    //                         controller.clear();
    //                         // widget.onChanged('');
    //                         FocusScope.of(context)
    //                             .requestFocus(FocusNode());
    //                       },
    //                     ),
    //                     filled: true,
    //                     fillColor: theme.backgroundColor,
    //                     contentPadding: EdgeInsets.all(0),
    //                     prefixIcon: Icon(
    //                       Icons.search,
    //                       color: Colors.grey.shade500,
    //                     ),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(50),
    //                         borderSide: BorderSide.none),
    //                     hintStyle: TextStyle(
    //                         fontSize: 14, color: Colors.grey.shade500),
    //                     hintText: "Search Crypto or Currency"),
    //               ),
    //             ),
    //           ),
    //           body: Scaffold(
    //             backgroundColor: theme.backgroundColor,
    //             appBar: AppBar(
    //                 elevation: 0.2,
    //                 bottomOpacity: 1.0,
    //                 shadowColor: theme.scaffoldBackgroundColor,
    //                 backgroundColor: theme.scaffoldBackgroundColor,
    //                 automaticallyImplyLeading: false,
    //                 title: Padding(
    //                     padding: EdgeInsets.only(left: 0),
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: TabBar(
    //                         indicatorColor: theme.scaffoldBackgroundColor,
    //                         controller: _nestedTabController,
    //                         isScrollable: true,
    //                         tabs: [
    //                           Tab(
    //                               child: Text('Crypto',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                           Tab(
    //                               child: Text('Currency',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                         ],
    //                       ),
    //                     ))),
    //             body: Container(
    // color: theme.canvasColor,
    //                 child: Container(
    //               color: theme.backgroundColor,
    //               child:  TabBarView(
    //                       controller: _nestedTabController,
    //                       children: <Widget>[

    //                           ListView.builder(
    //                             controller: _controller,
    //                             physics: const BouncingScrollPhysics(
    //                                 parent:
    //                                     AlwaysScrollableScrollPhysics()),
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: coins.length,
    //                             padding: const EdgeInsets.all(1.0),
    //                             itemBuilder: (context, index) {
    //                               var coin = coins[index];
    //                               return Container(
    //                                 color: Colors.white70,
    //                                 // width: screenWidth * 0.880,
    //                                                                           child:Text("Something Went Wrong Error Code :")

    //                               );
    //                             },
    //                           ),

    //                           ListView(
    //                               controller: _controller,
    //                               physics: const BouncingScrollPhysics(
    //                                   parent:
    //                                       AlwaysScrollableScrollPhysics()),
    //                               scrollDirection: Axis.vertical,
    //                               // itemCount: 8,
    //                               padding: const EdgeInsets.all(1.0),
    //                               // itemBuilder: (context, index) {
    //                               //   var bean = _list[index]; return
    //                               children: [
    //                                 Container(
    //                                   color: Colors.white70,
    //                                   // width: screenWidth * 0.880,
    //                                   child:Text("Something Went Wrong Error Code :")
    //                                 )
    //                               ]
    //                               // },
    //                               ),

    //                         ])
    //                   ),

    //                       ),
    //           )));
    // }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.2,
              shadowColor: theme.scaffoldBackgroundColor,
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Container(
                height: 28,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          controller.clear();
                          // widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search Crypto or Currency"),
                ),
              ),
            ),
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
                        child: TabBar(
                          indicatorColor: theme.scaffoldBackgroundColor,
                          controller: _nestedTabController,
                          isScrollable: true,
                          tabs: [
                            Tab(
                                child: Text('Crypto',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                            Tab(
                                child: Text('Currency',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                          ],
                        ),
                      ))),
              body: Container(
                  color: theme.canvasColor,
                  child: TabBarView(
                      controller: _nestedTabController,
                      children: <Widget>[
                        ListView.builder(
                          controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          itemCount: coins.length,
                          padding: const EdgeInsets.all(1.0),
                          itemBuilder: (context, index) {
                            var coin = coins[index];
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
                                  child:
                                      // (state is _LoadedAssetState)
                                      // ?
                                      Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Withdraw(token: coin.symbol!),
                                          ),
                                        );
                                      },
                                      title: Row(
                                        children: [
                                          Text(coin.name!,
                                              style: TextStyle(
                                                fontSize: 14 * textScale,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text(coin.symbol!,
                                              style: TextStyle(
                                                fontSize: 14 * textScale,
                                                fontWeight: FontWeight.w500,
                                              ))
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          // Text("EOS",
                                          //     style: TextStyle(
                                          //       fontSize: 12 * textScale,
                                          //     )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text("1.7575",
                                              style: TextStyle(
                                                color: theme.hoverColor,
                                                fontSize: 11 * textScale,
                                                fontWeight: FontWeight.w500,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ])
                                  //               : const Center(
                                  //   child: CircularProgressIndicator(),
                                  // )
                                  ),
                            );
                          },
                        ),
                        ListView(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            // itemCount: 8,
                            padding: const EdgeInsets.all(1.0),
                            // itemBuilder: (context, index) {
                            //   var bean = _list[index]; return
                            children: [
                              Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                // child: InkWell(
                                //   onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   // return DetailPage(bean);
                                //   return NftDetailsPage();
                                // }));
                                // },
                                // child:

                                //                                 (state is _LoadedAssetState)
                                //               ?
                                //                Column(children: [
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("ETH",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("EOS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.78",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),

                                //                                       onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Chart(token: "qwerty"),
                                //     ),
                                //   );
                                // },
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SHIB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.00001314.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.0000013",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BTC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("2610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("cx",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("FT",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BNB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("MATIC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("34.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("XRP",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("AVAX",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("22.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("NFTB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SPA",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("CPOOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("IXS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.29",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                 ])
                                //                                   : const Center(
                                //                   child: CircularProgressIndicator(),
                                //                 ))
                              )
                            ]
                            // },
                            ),
                      ])),
            )));

    //   },
    // );
  }
}

class SearchListTransfer extends StatefulWidget {
  const SearchListTransfer({Key? key}) : super(key: key);

  @override
  _SearchListTransferState createState() => _SearchListTransferState();
}

class _SearchListTransferState extends State<SearchListTransfer>
    with TickerProviderStateMixin {
//

  late List<Coin> coins = [];

  // List<User> _foundedUsers = [];
  //late List <Fiat> fiats=[]
  // late List<Coin> coins;
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  Future init() async {
    // final coins = await CoinProvider.getMarketCoins(query);

    // setState(() => this.coins = coins);
  }

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    coins = coinsdata;
    //  // init();
  }

  // void onSearch(String query) {
  //   // _foundedUsers = _users
  //   //     .where((user) => user.name.toLowerCase().contains(search))
  //   //     .toList();
  //   final coins = coinsdata.where((coin) {
  //     final titleLower = coin.symbol!.toLowerCase();
  //     final authorLower = coin.name!.toLowerCase();
  //     final searchLower = query.toLowerCase();

  //     return titleLower.contains(searchLower) ||
  //         authorLower.contains(searchLower);
  //   }).toList();

  //   setState(() {
  //     this.query = query;
  //     this.coins = coins;
  //   });
  // }

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

    // final style = widget.text.isEmpty ? styleHint : styleActive;

    // return
    //  BlocConsumer<AssetBloc, AssetState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    // if (state is SuccessAssetcState) {
    //       ScaffoldMessenger.of(context).showSnackBar((
    //         const SnackBar(
    //           duration: Duration(seconds: 2),
    //           content: Text(' succeess ', textScaleFactor: 1.5),
    //         ),
    //       );
    //     }         else if (state is ErrorAssetState) {

    //     ScaffoldMessenger.of(context).showSnackBar((
    //       const SnackBar(
    //         duration: Duration(seconds: 2),
    //         content: Text(' error ', textScaleFactor: 1.5),
    //       ),
    //     );
    //     }
    //   }, // @ts-ignore
    //   builder: (context, state) {

    // if (state is _ErrorAssetState) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //           backgroundColor: theme.backgroundColor,
    //           appBar: AppBar(
    //             automaticallyImplyLeading: false,
    //             elevation: 0.2,
    //             shadowColor: theme.scaffoldBackgroundColor,
    //             backgroundColor: theme.scaffoldBackgroundColor,
    //             title: Container(
    //               height: 28,
    //               child: TextField(
    //                 onChanged: onSearch,
    //                 decoration: InputDecoration(
    //                     suffixIcon: GestureDetector(
    //                       child: Icon(
    //                         Icons.close,
    //                       ),
    //                       onTap: () {
    //                         controller.clear();
    //                         // widget.onChanged('');
    //                         FocusScope.of(context)
    //                             .requestFocus(FocusNode());
    //                       },
    //                     ),
    //                     filled: true,
    //                     fillColor: theme.backgroundColor,
    //                     contentPadding: EdgeInsets.all(0),
    //                     prefixIcon: Icon(
    //                       Icons.search,
    //                       color: Colors.grey.shade500,
    //                     ),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(50),
    //                         borderSide: BorderSide.none),
    //                     hintStyle: TextStyle(
    //                         fontSize: 14, color: Colors.grey.shade500),
    //                     hintText: "Search Crypto or Currency"),
    //               ),
    //             ),
    //           ),
    //           body: Scaffold(
    //             backgroundColor: theme.backgroundColor,
    //             appBar: AppBar(
    //                 elevation: 0.2,
    //                 bottomOpacity: 1.0,
    //                 shadowColor: theme.scaffoldBackgroundColor,
    //                 backgroundColor: theme.scaffoldBackgroundColor,
    //                 automaticallyImplyLeading: false,
    //                 title: Padding(
    //                     padding: EdgeInsets.only(left: 0),
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: TabBar(
    //                         indicatorColor: theme.scaffoldBackgroundColor,
    //                         controller: _nestedTabController,
    //                         isScrollable: true,
    //                         tabs: [
    //                           Tab(
    //                               child: Text('Crypto',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                           Tab(
    //                               child: Text('Currency',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                         ],
    //                       ),
    //                     ))),
    //             body: Container(
    // color: theme.canvasColor,
    //                 child: Container(
    //               color: theme.backgroundColor,
    //               child:  TabBarView(
    //                       controller: _nestedTabController,
    //                       children: <Widget>[

    //                           ListView.builder(
    //                             controller: _controller,
    //                             physics: const BouncingScrollPhysics(
    //                                 parent:
    //                                     AlwaysScrollableScrollPhysics()),
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: coins.length,
    //                             padding: const EdgeInsets.all(1.0),
    //                             itemBuilder: (context, index) {
    //                               var coin = coins[index];
    //                               return Container(
    //                                 color: Colors.white70,
    //                                 // width: screenWidth * 0.880,
    //                                                                           child:Text("Something Went Wrong Error Code :")

    //                               );
    //                             },
    //                           ),

    //                           ListView(
    //                               controller: _controller,
    //                               physics: const BouncingScrollPhysics(
    //                                   parent:
    //                                       AlwaysScrollableScrollPhysics()),
    //                               scrollDirection: Axis.vertical,
    //                               // itemCount: 8,
    //                               padding: const EdgeInsets.all(1.0),
    //                               // itemBuilder: (context, index) {
    //                               //   var bean = _list[index]; return
    //                               children: [
    //                                 Container(
    //                                   color: Colors.white70,
    //                                   // width: screenWidth * 0.880,
    //                                   child:Text("Something Went Wrong Error Code :")
    //                                 )
    //                               ]
    //                               // },
    //                               ),

    //                         ])
    //                   ),

    //                       ),
    //           )));
    // }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.2,
              shadowColor: theme.scaffoldBackgroundColor,
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Container(
                height: 28,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          controller.clear();
                          // widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search Crypto or Currency"),
                ),
              ),
            ),
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
                        child: TabBar(
                          indicatorColor: theme.backgroundColor,
                          controller: _nestedTabController,
                          isScrollable: true,
                          tabs: [
                            Tab(
                                child: Text('Crypto',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                            Tab(
                                child: Text('Currency',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                          ],
                        ),
                      ))),
              body: Container(
                  color: theme.canvasColor,
                  child: TabBarView(
                      controller: _nestedTabController,
                      children: <Widget>[
                        ListView.builder(
                          controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          itemCount: coins.length,
                          padding: const EdgeInsets.all(1.0),
                          itemBuilder: (context, index) {
                            var coin = coins[index];
                            return Container(
                              color: theme.backgroundColor,
                              // width: screenWidth * 0.880,
                              child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context,rootNavigator: true)
                                    //     .push(MaterialPageRoute(builder: (context) {
                                    //   // return DetailPage(bean);
                                    //   return NftDetailsPage();
                                    // }));
                                  },
                                  child:
                                      // (state is _LoadedAssetState)
                                      // ?
                                      Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Transfer(
                                                  token: coin.symbol!)),
                                        );
                                      },
                                      title: Row(
                                        children: [
                                          Text(coin.name!,
                                              style: TextStyle(
                                                fontSize: 14 * textScale,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text(coin.symbol!,
                                              style: TextStyle(
                                                fontSize: 14 * textScale,
                                                fontWeight: FontWeight.w500,
                                              ))
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          // Text("EOS",
                                          //     style: TextStyle(
                                          //       fontSize: 12 * textScale,
                                          //     )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text("1.7575",
                                              style: TextStyle(
                                                color: theme.hoverColor,
                                                fontSize: 11 * textScale,
                                                fontWeight: FontWeight.w500,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ])
                                  //               : const Center(
                                  //   child: CircularProgressIndicator(),
                                  // )
                                  ),
                            );
                          },
                        ),
                        ListView(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            // itemCount: 8,
                            padding: const EdgeInsets.all(1.0),
                            // itemBuilder: (context, index) {
                            //   var bean = _list[index]; return
                            children: [
                              Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                // child: InkWell(
                                //   onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   // return DetailPage(bean);
                                //   return NftDetailsPage();
                                // }));
                                // },
                                // child:

                                //                                 (state is _LoadedAssetState)
                                //               ?
                                //                Column(children: [
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("ETH",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("EOS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.78",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),

                                //                                       onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Chart(token: "qwerty"),
                                //     ),
                                //   );
                                // },
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SHIB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.00001314.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.0000013",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BTC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("2610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("cx",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("FT",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BNB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("MATIC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("34.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("XRP",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("AVAX",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("22.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("NFTB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SPA",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("CPOOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("IXS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.29",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                 ])
                                //                                   : const Center(
                                //                   child: CircularProgressIndicator(),
                                //                 ))
                              )
                            ]
                            // },
                            ),
                      ])),
            )));

    // },
    //   },
    // );
  }
}

class SearchListDeposit extends StatefulWidget {
  const SearchListDeposit({Key? key}) : super(key: key);

  @override
  _SearchListDepositState createState() => _SearchListDepositState();
}

class _SearchListDepositState extends State<SearchListDeposit>
    with TickerProviderStateMixin {
  late List<Coin> coins = [];
  // List<User> _foundedUsers = [];
  //late List <Fiat> fiats=[]
  //  // late List<Coin> coins;
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  Future init() async {
    // final coins = await CoinProvider.getMarketCoins(query);

    // setState(() => this.coins = coins);
  }

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    coins = coinsdata;
    //  init();
  }

  void onSearch(String query) {
    // _foundedUsers = _users
    //     .where((user) => user.name.toLowerCase().contains(search))
    //     .toList();
    coins = coinsdata.where((coin) {
      final titleLower = coin.symbol!.toLowerCase();
      final authorLower = coin.name!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.coins = coins;
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

    // final style = widget.text.isEmpty ? styleHint : styleActive;

    // return
    //  BlocConsumer<AssetBloc, AssetState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    // if (state is SuccessAssetcState) {
    //       ScaffoldMessenger.of(context).showSnackBar((
    //         const SnackBar(
    //           duration: Duration(seconds: 2),
    //           content: Text(' succeess ', textScaleFactor: 1.5),
    //         ),
    //       );
    //     }         else if (state is ErrorAssetState) {

    //     ScaffoldMessenger.of(context).showSnackBar((
    //       const SnackBar(
    //         duration: Duration(seconds: 2),
    //         content: Text(' error ', textScaleFactor: 1.5),
    //       ),
    //     );
    //     }
    //   }, // @ts-ignore
    //   builder: (context, state) {

    // if (state is _ErrorAssetState) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //           backgroundColor: theme.backgroundColor,
    //           appBar: AppBar(
    //             automaticallyImplyLeading: false,
    //             elevation: 0.2,
    //             shadowColor: theme.scaffoldBackgroundColor,
    //             backgroundColor: theme.scaffoldBackgroundColor,
    //             title: Container(
    //               height: 28,
    //               child: TextField(
    //                 onChanged: onSearch,
    //                 decoration: InputDecoration(
    //                     suffixIcon: GestureDetector(
    //                       child: Icon(
    //                         Icons.close,
    //                       ),
    //                       onTap: () {
    //                         controller.clear();
    //                         // widget.onChanged('');
    //                         FocusScope.of(context)
    //                             .requestFocus(FocusNode());
    //                       },
    //                     ),
    //                     filled: true,
    //                     fillColor: theme.backgroundColor,
    //                     contentPadding: EdgeInsets.all(0),
    //                     prefixIcon: Icon(
    //                       Icons.search,
    //                       color: Colors.grey.shade500,
    //                     ),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(50),
    //                         borderSide: BorderSide.none),
    //                     hintStyle: TextStyle(
    //                         fontSize: 14, color: Colors.grey.shade500),
    //                     hintText: "Search Crypto or Currency"),
    //               ),
    //             ),
    //           ),
    //           body: Scaffold(
    //             backgroundColor: theme.backgroundColor,
    //             appBar: AppBar(
    //                 elevation: 0.2,
    //                 bottomOpacity: 1.0,
    //                 shadowColor: theme.scaffoldBackgroundColor,
    //                 backgroundColor: theme.scaffoldBackgroundColor,
    //                 automaticallyImplyLeading: false,
    //                 title: Padding(
    //                     padding: EdgeInsets.only(left: 0),
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: TabBar(
    //                         indicatorColor: theme.scaffoldBackgroundColor,
    //                         controller: _nestedTabController,
    //                         isScrollable: true,
    //                         tabs: [
    //                           Tab(
    //                               child: Text('Crypto',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                           Tab(
    //                               child: Text('Currency',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                         ],
    //                       ),
    //                     ))),
    //             body: Container(
    // color: theme.canvasColor,
    //                 child: Container(
    //               color: theme.backgroundColor,
    //               child:  TabBarView(
    //                       controller: _nestedTabController,
    //                       children: <Widget>[

    //                           ListView.builder(
    //                             controller: _controller,
    //                             physics: const BouncingScrollPhysics(
    //                                 parent:
    //                                     AlwaysScrollableScrollPhysics()),
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: coins.length,
    //                             padding: const EdgeInsets.all(1.0),
    //                             itemBuilder: (context, index) {
    //                               var coin = coins[index];
    //                               return Container(
    //                                 color: Colors.white70,
    //                                 // width: screenWidth * 0.880,
    //                                                                           child:Text("Something Went Wrong Error Code :")

    //                               );
    //                             },
    //                           ),

    //                           ListView(
    //                               controller: _controller,
    //                               physics: const BouncingScrollPhysics(
    //                                   parent:
    //                                       AlwaysScrollableScrollPhysics()),
    //                               scrollDirection: Axis.vertical,
    //                               // itemCount: 8,
    //                               padding: const EdgeInsets.all(1.0),
    //                               // itemBuilder: (context, index) {
    //                               //   var bean = _list[index]; return
    //                               children: [
    //                                 Container(
    //                                   color: Colors.white70,
    //                                   // width: screenWidth * 0.880,
    //                                   child:Text("Something Went Wrong Error Code :")
    //                                 )
    //                               ]
    //                               // },
    //                               ),

    //                         ])
    //                   ),

    //                       ),
    //           )));
    // }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.2,
              shadowColor: theme.scaffoldBackgroundColor,
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Container(
                height: 28,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          controller.clear();
                          // widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search Crypto or Currency"),
                ),
              ),
            ),
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
                        child: TabBar(
                          indicatorColor: theme.scaffoldBackgroundColor,
                          controller: _nestedTabController,
                          isScrollable: true,
                          tabs: [
                            Tab(
                                child: Text('Crypto',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                            Tab(
                                child: Text('Currency',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                          ],
                        ),
                      ))),
              body: Container(
                  color: theme.canvasColor,
                  child: TabBarView(
                      controller: _nestedTabController,
                      children: <Widget>[
                        ListView.builder(
                          controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          itemCount: coins.length,
                          padding: const EdgeInsets.all(1.0),
                          itemBuilder: (context, index) {
                            var coin = coins[index];
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
                                  child:
                                      // (state is _LoadedAssetState)
                                      // ?
                                      Column(children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Deposit(token: coin.symbol!),
                                          ),
                                        );
                                      },
                                      title: Row(
                                        children: [
                                          Text(coin.name!,
                                              style: TextStyle(
                                                fontSize: 14 * textScale,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text(coin.symbol!,
                                              style: TextStyle(
                                                fontSize: 14 * textScale,
                                                fontWeight: FontWeight.w500,
                                              ))
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          // Text("EOS",
                                          //     style: TextStyle(
                                          //       fontSize: 12 * textScale,
                                          //     )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text("1.7575",
                                              style: TextStyle(
                                                color: theme.hoverColor,
                                                fontSize: 11 * textScale,
                                                fontWeight: FontWeight.w500,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ])
                                  //               : const Center(
                                  //   child: CircularProgressIndicator(),
                                  // )
                                  ),
                            );
                          },
                        ),
                        ListView(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            // itemCount: 8,
                            padding: const EdgeInsets.all(1.0),
                            // itemBuilder: (context, index) {
                            //   var bean = _list[index]; return
                            children: [
                              Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                // child: InkWell(
                                //   onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   // return DetailPage(bean);
                                //   return NftDetailsPage();
                                // }));
                                // },
                                // child:

                                //                                 (state is _LoadedAssetState)
                                //               ?
                                //                Column(children: [
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("ETH",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("EOS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.78",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),

                                //                                       onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Chart(token: "qwerty"),
                                //     ),
                                //   );
                                // },
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SHIB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.00001314.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.0000013",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BTC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("2610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("cx",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("FT",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BNB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("MATIC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("34.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("XRP",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("AVAX",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("22.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("NFTB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SPA",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("CPOOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("IXS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.29",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                 ])
                                //                                   : const Center(
                                //                   child: CircularProgressIndicator(),
                                //                 ))
                              )
                            ]
                            // },
                            ),
                      ])),
            )));
    //   },
    // );
  }
}

class SearchListRepay extends StatefulWidget {
  const SearchListRepay({Key? key}) : super(key: key);

  @override
  _SearchListRepayState createState() => _SearchListRepayState();
}

class _SearchListRepayState extends State<SearchListRepay>
    with TickerProviderStateMixin {
  late List<Coin> coins = [];
  // List<User> _foundedUsers = [];
  //late List <Fiat> fiats=[]
  //  // late List<Coin> coins;
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  Future init() async {
    // final coins = await CoinProvider.getMarketCoins(query);

    // setState(() => this.coins = coins);
  }

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    coins = coinsdata;
    //  init();
  }

  void onSearch(String query) {
    // _foundedUsers = _users
    //     .where((user) => user.name.toLowerCase().contains(search))
    //     .toList();
    coins = coinsdata.where((coin) {
      final titleLower = coin.symbol!.toLowerCase();
      final authorLower = coin.name!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.coins = coins;
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

    // final style = widget.text.isEmpty ? styleHint : styleActive;

    // return
    //  BlocConsumer<AssetBloc, AssetState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    // if (state is SuccessAssetcState) {
    //       ScaffoldMessenger.of(context).showSnackBar((
    //         const SnackBar(
    //           duration: Duration(seconds: 2),
    //           content: Text(' succeess ', textScaleFactor: 1.5),
    //         ),
    //       );
    //     }         else if (state is ErrorAssetState) {

    //     ScaffoldMessenger.of(context).showSnackBar((
    //       const SnackBar(
    //         duration: Duration(seconds: 2),
    //         content: Text(' error ', textScaleFactor: 1.5),
    //       ),
    //     );
    //     }
    //   }, // @ts-ignore
    //   builder: (context, state) {

    // if (state is _ErrorAssetState) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //           backgroundColor: theme.backgroundColor,
    //           appBar: AppBar(
    //             automaticallyImplyLeading: false,
    //             elevation: 0.2,
    //             shadowColor: theme.scaffoldBackgroundColor,
    //             backgroundColor: theme.scaffoldBackgroundColor,
    //             title: Container(
    //               height: 28,
    //               child: TextField(
    //                 onChanged: onSearch,
    //                 decoration: InputDecoration(
    //                     suffixIcon: GestureDetector(
    //                       child: Icon(
    //                         Icons.close,
    //                       ),
    //                       onTap: () {
    //                         controller.clear();
    //                         // widget.onChanged('');
    //                         FocusScope.of(context)
    //                             .requestFocus(FocusNode());
    //                       },
    //                     ),
    //                     filled: true,
    //                     fillColor: theme.backgroundColor,
    //                     contentPadding: EdgeInsets.all(0),
    //                     prefixIcon: Icon(
    //                       Icons.search,
    //                       color: Colors.grey.shade500,
    //                     ),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(50),
    //                         borderSide: BorderSide.none),
    //                     hintStyle: TextStyle(
    //                         fontSize: 14, color: Colors.grey.shade500),
    //                     hintText: "Search Crypto or Currency"),
    //               ),
    //             ),
    //           ),
    //           body: Scaffold(
    //             backgroundColor: theme.backgroundColor,
    //             appBar: AppBar(
    //                 elevation: 0.2,
    //                 bottomOpacity: 1.0,
    //                 shadowColor: theme.scaffoldBackgroundColor,
    //                 backgroundColor: theme.scaffoldBackgroundColor,
    //                 automaticallyImplyLeading: false,
    //                 title: Padding(
    //                     padding: EdgeInsets.only(left: 0),
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: TabBar(
    //                         indicatorColor: theme.scaffoldBackgroundColor,
    //                         controller: _nestedTabController,
    //                         isScrollable: true,
    //                         tabs: [
    //                           Tab(
    //                               child: Text('Crypto',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                           Tab(
    //                               child: Text('Currency',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                         ],
    //                       ),
    //                     ))),
    //             body: Container(
    // color: theme.canvasColor,
    //                 child: Container(
    //               color: theme.backgroundColor,
    //               child:  TabBarView(
    //                       controller: _nestedTabController,
    //                       children: <Widget>[

    //                           ListView.builder(
    //                             controller: _controller,
    //                             physics: const BouncingScrollPhysics(
    //                                 parent:
    //                                     AlwaysScrollableScrollPhysics()),
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: coins.length,
    //                             padding: const EdgeInsets.all(1.0),
    //                             itemBuilder: (context, index) {
    //                               var coin = coins[index];
    //                               return Container(
    //                                 color: Colors.white70,
    //                                 // width: screenWidth * 0.880,
    //                                                                           child:Text("Something Went Wrong Error Code :")

    //                               );
    //                             },
    //                           ),

    //                           ListView(
    //                               controller: _controller,
    //                               physics: const BouncingScrollPhysics(
    //                                   parent:
    //                                       AlwaysScrollableScrollPhysics()),
    //                               scrollDirection: Axis.vertical,
    //                               // itemCount: 8,
    //                               padding: const EdgeInsets.all(1.0),
    //                               // itemBuilder: (context, index) {
    //                               //   var bean = _list[index]; return
    //                               children: [
    //                                 Container(
    //                                   color: Colors.white70,
    //                                   // width: screenWidth * 0.880,
    //                                   child:Text("Something Went Wrong Error Code :")
    //                                 )
    //                               ]
    //                               // },
    //                               ),

    //                         ])
    //                   ),

    //                       ),
    //           )));
    // }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.2,
              shadowColor: theme.scaffoldBackgroundColor,
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Container(
                height: 28,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          controller.clear();
                          // widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search Margin"),
                ),
              ),
            ),
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
                        child: TabBar(
                          indicatorColor: theme.scaffoldBackgroundColor,
                          controller: _nestedTabController,
                          isScrollable: true,
                          tabs: [
                            Tab(
                                child: Text('Cross Margin',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                            Tab(
                                child: Text('Isolated Margin',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                          ],
                        ),
                      ))),
              body: Container(
                  color: theme.canvasColor,
                  child: TabBarView(
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
                            //   var bean = _list[index]; return

                            return Container(
                              color: Colors.white70,
                              // width: screenWidth * 0.880,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    // return DetailPage(bean);
                                    return Repay();
                                  }));
                                },
                                child: Column(children: [
                                  Container(
                                    height: screenHeight * 0.058,
                                    color: theme.backgroundColor,
                                    child: ListTile(
                                        title: Row(
                                          children: [
                                            Text(
                                                "Amount                                                 Term",
                                                style: TextStyle(
                                                  fontSize: 11 * textScale,
                                                  color: Colors.black38,
                                                  fontWeight: FontWeight.w500,
                                                ))
                                          ],
                                        ),
                                        trailing: Text("          DailyRate",
                                            style: TextStyle(
                                              fontSize: 11 * textScale,
                                              color: Colors.black38,
                                              fontWeight: FontWeight.w500,
                                            ))),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text("ETH",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 14 * textScale,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Text("                       ",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 14 * textScale,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Text("                34.23",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 14 * textScale,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        ),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                        Text("1610.79",
                                            style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 14 * textScale,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
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
                          itemCount: 8,
                          padding: const EdgeInsets.all(1.0),
                          itemBuilder: (context, index) {
                            //   var bean = _list[index]; return

                            return Container(
                              color: Colors.white70,
                              // width: screenWidth * 0.880,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    // return DetailPage(bean);
                                    return Repay();
                                  }));
                                },
                                child: Column(children: [
                                  Container(
                                    height: screenHeight * 0.058,
                                    color: theme.backgroundColor,
                                    child: ListTile(
                                        title: Row(
                                          children: [
                                            Text(
                                                "Amount                                                 Term",
                                                style: TextStyle(
                                                  fontSize: 11 * textScale,
                                                  color: Colors.black38,
                                                  fontWeight: FontWeight.w500,
                                                ))
                                          ],
                                        ),
                                        trailing: Text("          DailyRate",
                                            style: TextStyle(
                                              fontSize: 11 * textScale,
                                              color: Colors.black38,
                                              fontWeight: FontWeight.w500,
                                            ))),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text("ETH",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 14 * textScale,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Text(
                                                "                                      34.23",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 14 * textScale,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        ),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                        Text("1610.79",
                                            style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 14 * textScale,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            );
                          },
                        ),
                      ])),
            )));
    //   },
    // );
  }
}

class SearchListBorrow extends StatefulWidget {
  const SearchListBorrow({Key? key}) : super(key: key);

  @override
  _SearchListBorrowState createState() => _SearchListBorrowState();
}

class _SearchListBorrowState extends State<SearchListBorrow>
    with TickerProviderStateMixin {
  late List<Coin> coins = [];
  // List<User> _foundedUsers = [];
  //late List <Fiat> fiats=[]
  //  // late List<Coin> coins;
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  Future init() async {
    // final coins = await CoinProvider.getMarketCoins(query);

    // setState(() => this.coins = coins);
  }

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    coins = coinsdata;
    //  init();
  }

  void onSearch(String query) {
    // _foundedUsers = _users
    //     .where((user) => user.name.toLowerCase().contains(search))
    //     .toList();
    coins = coinsdata.where((coin) {
      final titleLower = coin.symbol!.toLowerCase();
      final authorLower = coin.name!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.coins = coins;
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

    // final style = widget.text.isEmpty ? styleHint : styleActive;

    // return
    //  BlocConsumer<AssetBloc, AssetState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    // if (state is SuccessAssetcState) {
    //       ScaffoldMessenger.of(context).showSnackBar((
    //         const SnackBar(
    //           duration: Duration(seconds: 2),
    //           content: Text(' succeess ', textScaleFactor: 1.5),
    //         ),
    //       );
    //     }         else if (state is ErrorAssetState) {

    //     ScaffoldMessenger.of(context).showSnackBar((
    //       const SnackBar(
    //         duration: Duration(seconds: 2),
    //         content: Text(' error ', textScaleFactor: 1.5),
    //       ),
    //     );
    //     }
    //   }, // @ts-ignore
    //   builder: (context, state) {

    // if (state is _ErrorAssetState) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //           backgroundColor: theme.backgroundColor,
    //           appBar: AppBar(
    //             automaticallyImplyLeading: false,
    //             elevation: 0.2,
    //             shadowColor: theme.scaffoldBackgroundColor,
    //             backgroundColor: theme.scaffoldBackgroundColor,
    //             title: Container(
    //               height: 28,
    //               child: TextField(
    //                 onChanged: onSearch,
    //                 decoration: InputDecoration(
    //                     suffixIcon: GestureDetector(
    //                       child: Icon(
    //                         Icons.close,
    //                       ),
    //                       onTap: () {
    //                         controller.clear();
    //                         // widget.onChanged('');
    //                         FocusScope.of(context)
    //                             .requestFocus(FocusNode());
    //                       },
    //                     ),
    //                     filled: true,
    //                     fillColor: theme.backgroundColor,
    //                     contentPadding: EdgeInsets.all(0),
    //                     prefixIcon: Icon(
    //                       Icons.search,
    //                       color: Colors.grey.shade500,
    //                     ),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(50),
    //                         borderSide: BorderSide.none),
    //                     hintStyle: TextStyle(
    //                         fontSize: 14, color: Colors.grey.shade500),
    //                     hintText: "Search Crypto or Currency"),
    //               ),
    //             ),
    //           ),
    //           body: Scaffold(
    //             backgroundColor: theme.backgroundColor,
    //             appBar: AppBar(
    //                 elevation: 0.2,
    //                 bottomOpacity: 1.0,
    //                 shadowColor: theme.scaffoldBackgroundColor,
    //                 backgroundColor: theme.scaffoldBackgroundColor,
    //                 automaticallyImplyLeading: false,
    //                 title: Padding(
    //                     padding: EdgeInsets.only(left: 0),
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: TabBar(
    //                         indicatorColor: theme.scaffoldBackgroundColor,
    //                         controller: _nestedTabController,
    //                         isScrollable: true,
    //                         tabs: [
    //                           Tab(
    //                               child: Text('Crypto',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                           Tab(
    //                               child: Text('Currency',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                         ],
    //                       ),
    //                     ))),
    //             body: Container(
    // color: theme.canvasColor,
    //                 child: Container(
    //               color: theme.backgroundColor,
    //               child:  TabBarView(
    //                       controller: _nestedTabController,
    //                       children: <Widget>[

    //                           ListView.builder(
    //                             controller: _controller,
    //                             physics: const BouncingScrollPhysics(
    //                                 parent:
    //                                     AlwaysScrollableScrollPhysics()),
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: coins.length,
    //                             padding: const EdgeInsets.all(1.0),
    //                             itemBuilder: (context, index) {
    //                               var coin = coins[index];
    //                               return Container(
    //                                 color: Colors.white70,
    //                                 // width: screenWidth * 0.880,
    //                                                                           child:Text("Something Went Wrong Error Code :")

    //                               );
    //                             },
    //                           ),

    //                           ListView(
    //                               controller: _controller,
    //                               physics: const BouncingScrollPhysics(
    //                                   parent:
    //                                       AlwaysScrollableScrollPhysics()),
    //                               scrollDirection: Axis.vertical,
    //                               // itemCount: 8,
    //                               padding: const EdgeInsets.all(1.0),
    //                               // itemBuilder: (context, index) {
    //                               //   var bean = _list[index]; return
    //                               children: [
    //                                 Container(
    //                                   color: Colors.white70,
    //                                   // width: screenWidth * 0.880,
    //                                   child:Text("Something Went Wrong Error Code :")
    //                                 )
    //                               ]
    //                               // },
    //                               ),

    //                         ])
    //                   ),

    //                       ),
    //           )));
    // }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.2,
              shadowColor: theme.scaffoldBackgroundColor,
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Container(
                height: 28,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          controller.clear();
                          // widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search Margin"),
                ),
              ),
            ),
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
                        child: TabBar(
                          indicatorColor: theme.scaffoldBackgroundColor,
                          controller: _nestedTabController,
                          isScrollable: true,
                          tabs: [
                            Tab(
                                child: Text('Cross Margin',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                            Tab(
                                child: Text('Isolated Margin',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                          ],
                        ),
                      ))),
              body: Container(
                  color: theme.canvasColor,
                  child: TabBarView(
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
                            //   var bean = _list[index]; return

                            return Container(
                              color: Colors.white70,
                              // width: screenWidth * 0.880,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    // return DetailPage(bean);
                                    return Borrow();
                                  }));
                                },
                                child: Column(children: [
                                  Container(
                                    height: screenHeight * 0.058,
                                    color: theme.backgroundColor,
                                    child: ListTile(
                                        title: Row(
                                          children: [
                                            Text(
                                                "Amount                                                 Term",
                                                style: TextStyle(
                                                  fontSize: 11 * textScale,
                                                  color: Colors.black38,
                                                  fontWeight: FontWeight.w500,
                                                ))
                                          ],
                                        ),
                                        trailing: Text("          DailyRate",
                                            style: TextStyle(
                                              fontSize: 11 * textScale,
                                              color: Colors.black38,
                                              fontWeight: FontWeight.w500,
                                            ))),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text("ETH",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 14 * textScale,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Text("                       ",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 14 * textScale,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Text("                34.23",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 14 * textScale,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        ),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                        Text("1610.79",
                                            style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 14 * textScale,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
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
                          itemCount: 8,
                          padding: const EdgeInsets.all(1.0),
                          itemBuilder: (context, index) {
                            //   var bean = _list[index]; return

                            return Container(
                              color: Colors.white70,
                              // width: screenWidth * 0.880,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    // return DetailPage(bean);
                                    return Borrow();
                                  }));
                                },
                                child: Column(children: [
                                  Container(
                                    height: screenHeight * 0.058,
                                    color: theme.backgroundColor,
                                    child: ListTile(
                                        title: Row(
                                          children: [
                                            Text(
                                                "Amount                                                 Term",
                                                style: TextStyle(
                                                  fontSize: 11 * textScale,
                                                  color: Colors.black38,
                                                  fontWeight: FontWeight.w500,
                                                ))
                                          ],
                                        ),
                                        trailing: Text("          DailyRate",
                                            style: TextStyle(
                                              fontSize: 11 * textScale,
                                              color: Colors.black38,
                                              fontWeight: FontWeight.w500,
                                            ))),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text("ETH",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 14 * textScale,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Text(
                                                "                                      34.23",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 14 * textScale,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        ),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                        Text("1610.79",
                                            style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 14 * textScale,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            );
                          },
                        ),
                      ])),
            )));
    //   },
    // );
  }
}

class SearchListPaymentMeth extends StatefulWidget {
  const SearchListPaymentMeth({Key? key}) : super(key: key);

  @override
  _SearchListPaymentMethState createState() => _SearchListPaymentMethState();
}

class _SearchListPaymentMethState extends State<SearchListPaymentMeth>
    with TickerProviderStateMixin {
//

  // List<User> _foundedUsers = [];
  //late List <Fiat> fiats=[]
  // late List<Coin> coins;
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  Future init() async {
    // final coins = await CoinProvider.getMarketCoins(query);

    // setState(() => this.coins = coins);
  }

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    // coins = coinsdata;    // init();
  }

  // void onSearch(String query) {
  //   // _foundedUsers = _users
  //   //     .where((user) => user.name.toLowerCase().contains(search))
  //   //     .toList();
  //   final coins = coinsdata.where((coin) {
  //     final titleLower = coin.symbol!.toLowerCase();
  //     final authorLower = coin.name!.toLowerCase();
  //     final searchLower = query.toLowerCase();

  //     return titleLower.contains(searchLower) ||
  //         authorLower.contains(searchLower);
  //   }).toList();

  //   setState(() {
  //     this.query = query;
  //     this.coins = coins;
  //   });
  // }

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

    // final style = widget.text.isEmpty ? styleHint : styleActive;

    // return
    //  BlocConsumer<AssetBloc, AssetState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    // if (state is SuccessAssetcState) {
    //       ScaffoldMessenger.of(context).showSnackBar((
    //         const SnackBar(
    //           duration: Duration(seconds: 2),
    //           content: Text(' succeess ', textScaleFactor: 1.5),
    //         ),
    //       );
    //     }         else if (state is ErrorAssetState) {

    //     ScaffoldMessenger.of(context).showSnackBar((
    //       const SnackBar(
    //         duration: Duration(seconds: 2),
    //         content: Text(' error ', textScaleFactor: 1.5),
    //       ),
    //     );
    //     }
    //   }, // @ts-ignore
    //   builder: (context, state) {

    // if (state is _ErrorAssetState) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //           backgroundColor: theme.backgroundColor,
    //           appBar: AppBar(
    //             automaticallyImplyLeading: false,
    //             elevation: 0.2,
    //             shadowColor: theme.scaffoldBackgroundColor,
    //             backgroundColor: theme.scaffoldBackgroundColor,
    //             title: Container(
    //               height: 28,
    //               child: TextField(
    //                 onChanged: onSearch,
    //                 decoration: InputDecoration(
    //                     suffixIcon: GestureDetector(
    //                       child: Icon(
    //                         Icons.close,
    //                       ),
    //                       onTap: () {
    //                         controller.clear();
    //                         // widget.onChanged('');
    //                         FocusScope.of(context)
    //                             .requestFocus(FocusNode());
    //                       },
    //                     ),
    //                     filled: true,
    //                     fillColor: theme.backgroundColor,
    //                     contentPadding: EdgeInsets.all(0),
    //                     prefixIcon: Icon(
    //                       Icons.search,
    //                       color: Colors.grey.shade500,
    //                     ),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(50),
    //                         borderSide: BorderSide.none),
    //                     hintStyle: TextStyle(
    //                         fontSize: 14, color: Colors.grey.shade500),
    //                     hintText: "Search Crypto or Currency"),
    //               ),
    //             ),
    //           ),
    //           body: Scaffold(
    //             backgroundColor: theme.backgroundColor,
    //             appBar: AppBar(
    //                 elevation: 0.2,
    //                 bottomOpacity: 1.0,
    //                 shadowColor: theme.scaffoldBackgroundColor,
    //                 backgroundColor: theme.scaffoldBackgroundColor,
    //                 automaticallyImplyLeading: false,
    //                 title: Padding(
    //                     padding: EdgeInsets.only(left: 0),
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: TabBar(
    //                         indicatorColor: theme.scaffoldBackgroundColor,
    //                         controller: _nestedTabController,
    //                         isScrollable: true,
    //                         tabs: [
    //                           Tab(
    //                               child: Text('Crypto',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                           Tab(
    //                               child: Text('Currency',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                         ],
    //                       ),
    //                     ))),
    //             body: Container(
    // color: theme.canvasColor,
    //                 child: Container(
    //               color: theme.backgroundColor,
    //               child:  TabBarView(
    //                       controller: _nestedTabController,
    //                       children: <Widget>[

    //                           ListView.builder(
    //                             controller: _controller,
    //                             physics: const BouncingScrollPhysics(
    //                                 parent:
    //                                     AlwaysScrollableScrollPhysics()),
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: coins.length,
    //                             padding: const EdgeInsets.all(1.0),
    //                             itemBuilder: (context, index) {
    //                               var coin = coins[index];
    //                               return Container(
    //                                 color: Colors.white70,
    //                                 // width: screenWidth * 0.880,
    //                                                                           child:Text("Something Went Wrong Error Code :")

    //                               );
    //                             },
    //                           ),

    //                           ListView(
    //                               controller: _controller,
    //                               physics: const BouncingScrollPhysics(
    //                                   parent:
    //                                       AlwaysScrollableScrollPhysics()),
    //                               scrollDirection: Axis.vertical,
    //                               // itemCount: 8,
    //                               padding: const EdgeInsets.all(1.0),
    //                               // itemBuilder: (context, index) {
    //                               //   var bean = _list[index]; return
    //                               children: [
    //                                 Container(
    //                                   color: Colors.white70,
    //                                   // width: screenWidth * 0.880,
    //                                   child:Text("Something Went Wrong Error Code :")
    //                                 )
    //                               ]
    //                               // },
    //                               ),

    //                         ])
    //                   ),

    //                       ),
    //           )));
    // }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.2,
              shadowColor: theme.scaffoldBackgroundColor,
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Container(
                height: 28,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          controller.clear();
                          // widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search Crypto or Currency"),
                ),
              ),
            ),
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
                        child: TabBar(
                          indicatorColor: theme.scaffoldBackgroundColor,
                          controller: _nestedTabController,
                          isScrollable: true,
                          tabs: [
                            Tab(
                                child: Text('Crypto',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                            Tab(
                                child: Text('Currency',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                          ],
                        ),
                      ))),
              body: Container(
                  color: theme.canvasColor,
                  child: TabBarView(
                      controller: _nestedTabController,
                      children: <Widget>[
                        ListView.builder(
                          controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          itemCount: coins.length,
                          padding: const EdgeInsets.all(1.0),
                          itemBuilder: (context, index) {
                            var coin = coins[index];
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
                                //                 child: (state is _LoadedAssetState)
                                // ?
                                // Column(children: [
                                //                   ListTile(
                                //                     title: Row(
                                //                       children: [
                                //                         Text(coin.name!,
                                //                             style: TextStyle(
                                //                               fontSize:
                                //                                   14 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             )),
                                //                         Expanded(
                                //                             child: Container(
                                //                                 width: screenWidth *
                                //                                     0.08)),
                                //                         Text(coin.symbol!,
                                //                             style: TextStyle(
                                //                               fontSize:
                                //                                   14 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             ))
                                //                       ],
                                //                     ),
                                //                     subtitle: Row(
                                //                       children: [
                                //                         // Text("EOS",
                                //                         //     style: TextStyle(
                                //                         //       fontSize: 12 * textScale,
                                //                         //     )),
                                //                         Expanded(
                                //                             child: Container(
                                //                                 width: screenWidth *
                                //                                     0.08)),
                                //                         Text("1.7575",
                                //                             style: TextStyle(
                                //                               color: theme.hoverColor,
                                //                               fontSize:
                                //                                   11 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             ))
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 ]): const Center(
                                //     child: CircularProgressIndicator(),
                                //   )
                              ),
                            );
                          },
                        ),
                        ListView(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            // itemCount: 8,
                            padding: const EdgeInsets.all(1.0),
                            // itemBuilder: (context, index) {
                            //   var bean = _list[index]; return
                            children: [
                              Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                // child: InkWell(
                                //   onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   // return DetailPage(bean);
                                //   return NftDetailsPage();
                                // }));
                                // },
                                // child:

                                //                                 (state is _LoadedAssetState)
                                //               ?
                                //                Column(children: [
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("ETH",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("EOS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.78",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),

                                //                                       onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Chart(token: "qwerty"),
                                //     ),
                                //   );
                                // },
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SHIB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.00001314.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.0000013",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BTC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("2610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("cx",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("FT",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BNB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("MATIC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("34.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("XRP",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("AVAX",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("22.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("NFTB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SPA",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("CPOOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("IXS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.29",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                 ])
                                //                                   : const Center(
                                //                   child: CircularProgressIndicator(),
                                //                 ))
                              )
                            ]
                            // },
                            ),
                      ])),
            )));
    //   },
    // );
  }
}

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> with TickerProviderStateMixin {
//

  // List<User> _foundedUsers = [];
  //late List <Fiat> fiats=[]
  // late List<Coin> coins;
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  Future init() async {
    // final coins = await CoinProvider.getCoinsList(query);

    // setState(() => this.coins = coins);
  }

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    // coins = coinsdata;    // init();
  }

  // void onSearch(String query) {
  //   // _foundedUsers = _users
  //   //     .where((user) => user.name.toLowerCase().contains(search))
  //   //     .toList();
  //   final coins = coinsdata.where((coin) {
  //     final titleLower = coin.symbol!.toLowerCase();
  //     final authorLower = coin.name!.toLowerCase();
  //     final searchLower = query.toLowerCase();

  //     return titleLower.contains(searchLower) ||
  //         authorLower.contains(searchLower);
  //   }).toList();

  //   setState(() {
  //     this.query = query;
  //     this.coins = coins;
  //   });
  // }

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

    // final style = widget.text.isEmpty ? styleHint : styleActive;

    // return
    //  BlocConsumer<AssetBloc, AssetState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    // if (state is SuccessAssetcState) {
    //       ScaffoldMessenger.of(context).showSnackBar((
    //         const SnackBar(
    //           duration: Duration(seconds: 2),
    //           content: Text(' succeess ', textScaleFactor: 1.5),
    //         ),
    //       );
    //     }         else if (state is ErrorAssetState) {

    //     ScaffoldMessenger.of(context).showSnackBar((
    //       const SnackBar(
    //         duration: Duration(seconds: 2),
    //         content: Text(' error ', textScaleFactor: 1.5),
    //       ),
    //     );
    //     }
    //   }, // @ts-ignore
    //   builder: (context, state) {

    // if (state is _ErrorAssetState) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //           backgroundColor: theme.backgroundColor,
    //           appBar: AppBar(
    //             automaticallyImplyLeading: false,
    //             elevation: 0.2,
    //             shadowColor: theme.scaffoldBackgroundColor,
    //             backgroundColor: theme.scaffoldBackgroundColor,
    //             title: Container(
    //               height: 28,
    //               child: TextField(
    //                 onChanged: onSearch,
    //                 decoration: InputDecoration(
    //                     suffixIcon: GestureDetector(
    //                       child: Icon(
    //                         Icons.close,
    //                       ),
    //                       onTap: () {
    //                         controller.clear();
    //                         // widget.onChanged('');
    //                         FocusScope.of(context)
    //                             .requestFocus(FocusNode());
    //                       },
    //                     ),
    //                     filled: true,
    //                     fillColor: theme.backgroundColor,
    //                     contentPadding: EdgeInsets.all(0),
    //                     prefixIcon: Icon(
    //                       Icons.search,
    //                       color: Colors.grey.shade500,
    //                     ),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(50),
    //                         borderSide: BorderSide.none),
    //                     hintStyle: TextStyle(
    //                         fontSize: 14, color: Colors.grey.shade500),
    //                     hintText: "Search Crypto or Currency"),
    //               ),
    //             ),
    //           ),
    //           body: Scaffold(
    //             backgroundColor: theme.backgroundColor,
    //             appBar: AppBar(
    //                 elevation: 0.2,
    //                 bottomOpacity: 1.0,
    //                 shadowColor: theme.scaffoldBackgroundColor,
    //                 backgroundColor: theme.scaffoldBackgroundColor,
    //                 automaticallyImplyLeading: false,
    //                 title: Padding(
    //                     padding: EdgeInsets.only(left: 0),
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: TabBar(
    //                         indicatorColor: theme.scaffoldBackgroundColor,
    //                         controller: _nestedTabController,
    //                         isScrollable: true,
    //                         tabs: [
    //                           Tab(
    //                               child: Text('Crypto',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                           Tab(
    //                               child: Text('Currency',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                         ],
    //                       ),
    //                     ))),
    //             body: Container(
    // color: theme.canvasColor,
    //                 child: Container(
    //               color: theme.backgroundColor,
    //               child:  TabBarView(
    //                       controller: _nestedTabController,
    //                       children: <Widget>[

    //                           ListView.builder(
    //                             controller: _controller,
    //                             physics: const BouncingScrollPhysics(
    //                                 parent:
    //                                     AlwaysScrollableScrollPhysics()),
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: coins.length,
    //                             padding: const EdgeInsets.all(1.0),
    //                             itemBuilder: (context, index) {
    //                               var coin = coins[index];
    //                               return Container(
    //                                 color: Colors.white70,
    //                                 // width: screenWidth * 0.880,
    //                                                                           child:Text("Something Went Wrong Error Code :")

    //                               );
    //                             },
    //                           ),

    //                           ListView(
    //                               controller: _controller,
    //                               physics: const BouncingScrollPhysics(
    //                                   parent:
    //                                       AlwaysScrollableScrollPhysics()),
    //                               scrollDirection: Axis.vertical,
    //                               // itemCount: 8,
    //                               padding: const EdgeInsets.all(1.0),
    //                               // itemBuilder: (context, index) {
    //                               //   var bean = _list[index]; return
    //                               children: [
    //                                 Container(
    //                                   color: Colors.white70,
    //                                   // width: screenWidth * 0.880,
    //                                   child:Text("Something Went Wrong Error Code :")
    //                                 )
    //                               ]
    //                               // },
    //                               ),

    //                         ])
    //                   ),

    //                       ),
    //           )));
    // }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.2,
              shadowColor: theme.scaffoldBackgroundColor,
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Container(
                height: 28,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          controller.clear();
                          // widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search Crypto or Currency"),
                ),
              ),
            ),
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
                        child: TabBar(
                          indicatorColor: theme.scaffoldBackgroundColor,
                          controller: _nestedTabController,
                          isScrollable: true,
                          tabs: [
                            Tab(
                                child: Text('Crypto',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                            Tab(
                                child: Text('Currency',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                          ],
                        ),
                      ))),
              body: Container(
                  color: theme.canvasColor,
                  child: TabBarView(
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
                            return Container(
                                color: Colors.white70,
                                width: screenWidth * 0.880,
                                child: InkWell(
                                    child:

                                        //                   (state is _LoadedAssetState)
                                        // ?
                                        Column(children: [
                                  ListTile(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .push(MaterialPageRoute(
                                              builder: (context) {
                                        // return DetailPage(bean);
                                        return Chart();
                                      }));
                                    },
                                    title: Row(
                                      children: [
                                        Text("ETH",
                                            style: TextStyle(
                                              fontSize: 14 * textScale,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                        Text("1610.79",
                                            style: TextStyle(
                                              fontSize: 14 * textScale,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    ),
                                    subtitle: Row(
                                      children: [
                                        // Text("EOS",
                                        //     style: TextStyle(
                                        //       fontSize: 12 * textScale,
                                        //     )),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                        Text("1.7575",
                                            style: TextStyle(
                                              fontSize: 11 * textScale,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    ),
                                  ),
                                ])
                                    //                   : const Center(
                                    //   child: CircularProgressIndicator(),
                                    // ))
                                    ));
                          },
                        ),
                        ListView.builder(
                          controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          itemCount: 8,
                          padding: const EdgeInsets.all(1.0),
                          itemBuilder: (context, index) {
                            return Container(
                                color: Colors.white70,
                                width: screenWidth * 0.880,
                                child: InkWell(
                                    child:

                                        //                   (state is _LoadedAssetState)
                                        // ?
                                        Column(children: [
                                  ListTile(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .push(MaterialPageRoute(
                                              builder: (context) {
                                        // return DetailPage(bean);
                                        return Chart();
                                      }));
                                    },
                                    title: Row(
                                      children: [
                                        Text("USD",
                                            style: TextStyle(
                                              fontSize: 14 * textScale,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                        Text("1610.79",
                                            style: TextStyle(
                                              fontSize: 14 * textScale,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    ),
                                    subtitle: Row(
                                      children: [
                                        // Text("EOS",
                                        //     style: TextStyle(
                                        //       fontSize: 12 * textScale,
                                        //     )),
                                        Expanded(
                                            child: Container(
                                                width: screenWidth * 0.08)),
                                        Text("1.7575",
                                            style: TextStyle(
                                              fontSize: 11 * textScale,
                                              fontWeight: FontWeight.w500,
                                            ))
                                      ],
                                    ),
                                  ),
                                ])
                                    //                   : const Center(
                                    //   child: CircularProgressIndicator(),
                                    // ))
                                    ));
                          },
                        ),
                      ])),
            )));
    //   },
    // );
  }
}

class SearchListConvert extends StatefulWidget {
  const SearchListConvert({Key? key}) : super(key: key);

  @override
  _SearchListConvertState createState() => _SearchListConvertState();
}

class _SearchListConvertState extends State<SearchListConvert>
    with TickerProviderStateMixin {
//

  // List<User> _foundedUsers = [];
  //late List <Fiat> fiats=[]
  // late List<Coin> coins;
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  Future init() async {
    // final coins = await CoinProvider.getMarketCoins(query);

    // setState(() => this.coins = coins);
  }

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    // coins = coinsdata;    // init();
  }

  // void onSearch(String query) {
  //   // _foundedUsers = _users
  //   //     .where((user) => user.name.toLowerCase().contains(search))
  //   //     .toList();
  //   final coins = coinsdata.where((coin) {
  //     final titleLower = coin.symbol!.toLowerCase();
  //     final authorLower = coin.name!.toLowerCase();
  //     final searchLower = query.toLowerCase();

  //     return titleLower.contains(searchLower) ||
  //         authorLower.contains(searchLower);
  //   }).toList();

  //   setState(() {
  //     this.query = query;
  //     this.coins = coins;
  //   });
  // }

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

    // final style = widget.text.isEmpty ? styleHint : styleActive;

    // return
    //  BlocConsumer<AssetBloc, AssetState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    // if (state is SuccessAssetcState) {
    //       ScaffoldMessenger.of(context).showSnackBar((
    //         const SnackBar(
    //           duration: Duration(seconds: 2),
    //           content: Text(' succeess ', textScaleFactor: 1.5),
    //         ),
    //       );
    //     }         else if (state is ErrorAssetState) {

    //     ScaffoldMessenger.of(context).showSnackBar((
    //       const SnackBar(
    //         duration: Duration(seconds: 2),
    //         content: Text(' error ', textScaleFactor: 1.5),
    //       ),
    //     );
    //     }
    //   }, // @ts-ignore
    //   builder: (context, state) {

    // if (state is _ErrorAssetState) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //           backgroundColor: theme.backgroundColor,
    //           appBar: AppBar(
    //             automaticallyImplyLeading: false,
    //             elevation: 0.2,
    //             shadowColor: theme.scaffoldBackgroundColor,
    //             backgroundColor: theme.scaffoldBackgroundColor,
    //             title: Container(
    //               height: 28,
    //               child: TextField(
    //                 onChanged: onSearch,
    //                 decoration: InputDecoration(
    //                     suffixIcon: GestureDetector(
    //                       child: Icon(
    //                         Icons.close,
    //                       ),
    //                       onTap: () {
    //                         controller.clear();
    //                         // widget.onChanged('');
    //                         FocusScope.of(context)
    //                             .requestFocus(FocusNode());
    //                       },
    //                     ),
    //                     filled: true,
    //                     fillColor: theme.backgroundColor,
    //                     contentPadding: EdgeInsets.all(0),
    //                     prefixIcon: Icon(
    //                       Icons.search,
    //                       color: Colors.grey.shade500,
    //                     ),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(50),
    //                         borderSide: BorderSide.none),
    //                     hintStyle: TextStyle(
    //                         fontSize: 14, color: Colors.grey.shade500),
    //                     hintText: "Search Crypto or Currency"),
    //               ),
    //             ),
    //           ),
    //           body: Scaffold(
    //             backgroundColor: theme.backgroundColor,
    //             appBar: AppBar(
    //                 elevation: 0.2,
    //                 bottomOpacity: 1.0,
    //                 shadowColor: theme.scaffoldBackgroundColor,
    //                 backgroundColor: theme.scaffoldBackgroundColor,
    //                 automaticallyImplyLeading: false,
    //                 title: Padding(
    //                     padding: EdgeInsets.only(left: 0),
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: TabBar(
    //                         indicatorColor: theme.scaffoldBackgroundColor,
    //                         controller: _nestedTabController,
    //                         isScrollable: true,
    //                         tabs: [
    //                           Tab(
    //                               child: Text('Crypto',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                           Tab(
    //                               child: Text('Currency',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                         ],
    //                       ),
    //                     ))),
    //             body: Container(
    // color: theme.canvasColor,
    //                 child: Container(
    //               color: theme.backgroundColor,
    //               child:  TabBarView(
    //                       controller: _nestedTabController,
    //                       children: <Widget>[

    //                           ListView.builder(
    //                             controller: _controller,
    //                             physics: const BouncingScrollPhysics(
    //                                 parent:
    //                                     AlwaysScrollableScrollPhysics()),
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: coins.length,
    //                             padding: const EdgeInsets.all(1.0),
    //                             itemBuilder: (context, index) {
    //                               var coin = coins[index];
    //                               return Container(
    //                                 color: Colors.white70,
    //                                 // width: screenWidth * 0.880,
    //                                                                           child:Text("Something Went Wrong Error Code :")

    //                               );
    //                             },
    //                           ),

    //                           ListView(
    //                               controller: _controller,
    //                               physics: const BouncingScrollPhysics(
    //                                   parent:
    //                                       AlwaysScrollableScrollPhysics()),
    //                               scrollDirection: Axis.vertical,
    //                               // itemCount: 8,
    //                               padding: const EdgeInsets.all(1.0),
    //                               // itemBuilder: (context, index) {
    //                               //   var bean = _list[index]; return
    //                               children: [
    //                                 Container(
    //                                   color: Colors.white70,
    //                                   // width: screenWidth * 0.880,
    //                                   child:Text("Something Went Wrong Error Code :")
    //                                 )
    //                               ]
    //                               // },
    //                               ),

    //                         ])
    //                   ),

    //                       ),
    //           )));
    // }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.2,
              shadowColor: theme.scaffoldBackgroundColor,
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Container(
                height: 28,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          controller.clear();
                          // widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search Crypto or Currency"),
                ),
              ),
            ),
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
                        child: TabBar(
                          indicatorColor: theme.scaffoldBackgroundColor,
                          controller: _nestedTabController,
                          isScrollable: true,
                          tabs: [
                            Tab(
                                child: Text('Crypto',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                            Tab(
                                child: Text('Currency',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                          ],
                        ),
                      ))),
              body: Container(
                  color: theme.canvasColor,
                  child: TabBarView(
                      controller: _nestedTabController,
                      children: <Widget>[
                        ListView.builder(
                          controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          itemCount: coins.length,
                          padding: const EdgeInsets.all(1.0),
                          itemBuilder: (context, index) {
                            var coin = coins[index];
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
                                //                 child: (state is _LoadedAssetState)
                                // ?
                                // Column(children: [
                                //                   ListTile(
                                //                     title: Row(
                                //                       children: [
                                //                         Text(coin.name!,
                                //                             style: TextStyle(
                                //                               fontSize:
                                //                                   14 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             )),
                                //                         Expanded(
                                //                             child: Container(
                                //                                 width: screenWidth *
                                //                                     0.08)),
                                //                         Text(coin.symbol!,
                                //                             style: TextStyle(
                                //                               fontSize:
                                //                                   14 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             ))
                                //                       ],
                                //                     ),
                                //                     subtitle: Row(
                                //                       children: [
                                //                         // Text("EOS",
                                //                         //     style: TextStyle(
                                //                         //       fontSize: 12 * textScale,
                                //                         //     )),
                                //                         Expanded(
                                //                             child: Container(
                                //                                 width: screenWidth *
                                //                                     0.08)),
                                //                         Text("1.7575",
                                //                             style: TextStyle(
                                //                               color: theme.hoverColor,
                                //                               fontSize:
                                //                                   11 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             ))
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 ]): const Center(
                                //     child: CircularProgressIndicator(),
                                //   )
                              ),
                            );
                          },
                        ),
                        ListView(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            // itemCount: 8,
                            padding: const EdgeInsets.all(1.0),
                            // itemBuilder: (context, index) {
                            //   var bean = _list[index]; return
                            children: [
                              Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                // child: InkWell(
                                //   onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   // return DetailPage(bean);
                                //   return NftDetailsPage();
                                // }));
                                // },
                                // child:

                                //                                 (state is _LoadedAssetState)
                                //               ?
                                //                Column(children: [
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("ETH",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("EOS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.78",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),

                                //                                       onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Chart(token: "qwerty"),
                                //     ),
                                //   );
                                // },
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SHIB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.00001314.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.0000013",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BTC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("2610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("cx",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("FT",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BNB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("MATIC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("34.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("XRP",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("AVAX",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("22.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("NFTB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SPA",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("CPOOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("IXS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.29",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                 ])
                                //                                   : const Center(
                                //                   child: CircularProgressIndicator(),
                                //                 ))
                              )
                            ]
                            // },
                            ),
                      ])),
            )));
    //   },
    // );
  }
}

class SearchListAppeal extends StatefulWidget {
  const SearchListAppeal({Key? key}) : super(key: key);

  @override
  _SearchListAppealState createState() => _SearchListAppealState();
}

class _SearchListAppealState extends State<SearchListAppeal>
    with TickerProviderStateMixin {
//

  // List<User> _foundedUsers = [];
  //late List <Fiat> fiats=[]
  // late List<Coin> coins;
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  Future init() async {
    // final coins = await CoinProvider.getMarketCoins(query);

    // setState(() => this.coins = coins);
  }

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    // coins = coinsdata;    // init();
  }

  // void onSearch(String query) {
  //   // _foundedUsers = _users
  //   //     .where((user) => user.name.toLowerCase().contains(search))
  //   //     .toList();
  //   final coins = coinsdata.where((coin) {
  //     final titleLower = coin.symbol!.toLowerCase();
  //     final authorLower = coin.name!.toLowerCase();
  //     final searchLower = query.toLowerCase();

  //     return titleLower.contains(searchLower) ||
  //         authorLower.contains(searchLower);
  //   }).toList();

  //   setState(() {
  //     this.query = query;
  //     this.coins = coins;
  //   });
  // }

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

    // final style = widget.text.isEmpty ? styleHint : styleActive;

    // return
    //  BlocConsumer<AssetBloc, AssetState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    // if (state is SuccessAssetcState) {
    //       ScaffoldMessenger.of(context).showSnackBar((
    //         const SnackBar(
    //           duration: Duration(seconds: 2),
    //           content: Text(' succeess ', textScaleFactor: 1.5),
    //         ),
    //       );
    //     }         else if (state is ErrorAssetState) {

    //     ScaffoldMessenger.of(context).showSnackBar((
    //       const SnackBar(
    //         duration: Duration(seconds: 2),
    //         content: Text(' error ', textScaleFactor: 1.5),
    //       ),
    //     );
    //     }
    //   }, // @ts-ignore
    //   builder: (context, state) {

    // if (state is _ErrorAssetState) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //           backgroundColor: theme.backgroundColor,
    //           appBar: AppBar(
    //             automaticallyImplyLeading: false,
    //             elevation: 0.2,
    //             shadowColor: theme.scaffoldBackgroundColor,
    //             backgroundColor: theme.scaffoldBackgroundColor,
    //             title: Container(
    //               height: 28,
    //               child: TextField(
    //                 onChanged: onSearch,
    //                 decoration: InputDecoration(
    //                     suffixIcon: GestureDetector(
    //                       child: Icon(
    //                         Icons.close,
    //                       ),
    //                       onTap: () {
    //                         controller.clear();
    //                         // widget.onChanged('');
    //                         FocusScope.of(context)
    //                             .requestFocus(FocusNode());
    //                       },
    //                     ),
    //                     filled: true,
    //                     fillColor: theme.backgroundColor,
    //                     contentPadding: EdgeInsets.all(0),
    //                     prefixIcon: Icon(
    //                       Icons.search,
    //                       color: Colors.grey.shade500,
    //                     ),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(50),
    //                         borderSide: BorderSide.none),
    //                     hintStyle: TextStyle(
    //                         fontSize: 14, color: Colors.grey.shade500),
    //                     hintText: "Search Crypto or Currency"),
    //               ),
    //             ),
    //           ),
    //           body: Scaffold(
    //             backgroundColor: theme.backgroundColor,
    //             appBar: AppBar(
    //                 elevation: 0.2,
    //                 bottomOpacity: 1.0,
    //                 shadowColor: theme.scaffoldBackgroundColor,
    //                 backgroundColor: theme.scaffoldBackgroundColor,
    //                 automaticallyImplyLeading: false,
    //                 title: Padding(
    //                     padding: EdgeInsets.only(left: 0),
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: TabBar(
    //                         indicatorColor: theme.scaffoldBackgroundColor,
    //                         controller: _nestedTabController,
    //                         isScrollable: true,
    //                         tabs: [
    //                           Tab(
    //                               child: Text('Crypto',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                           Tab(
    //                               child: Text('Currency',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                         ],
    //                       ),
    //                     ))),
    //             body: Container(
    //                 color: theme.canvasColor,
    //                 child: Container(
    //               color: theme.backgroundColor,
    //               child:  TabBarView(
    //                       controller: _nestedTabController,
    //                       children: <Widget>[

    //                           ListView.builder(
    //                             controller: _controller,
    //                             physics: const BouncingScrollPhysics(
    //                                 parent:
    //                                     AlwaysScrollableScrollPhysics()),
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: coins.length,
    //                             padding: const EdgeInsets.all(1.0),
    //                             itemBuilder: (context, index) {
    //                               var coin = coins[index];
    //                               return Container(
    //                                 color: Colors.white70,
    //                                 // width: screenWidth * 0.880,
    //                                                                           child:Text("Something Went Wrong Error Code :")

    //                               );
    //                             },
    //                           ),

    //                           ListView(
    //                               controller: _controller,
    //                               physics: const BouncingScrollPhysics(
    //                                   parent:
    //                                       AlwaysScrollableScrollPhysics()),
    //                               scrollDirection: Axis.vertical,
    //                               // itemCount: 8,
    //                               padding: const EdgeInsets.all(1.0),
    //                               // itemBuilder: (context, index) {
    //                               //   var bean = _list[index]; return
    //                               children: [
    //                                 Container(
    //                                   color: Colors.white70,
    //                                   // width: screenWidth * 0.880,
    //                                   child:Text("Something Went Wrong Error Code :")
    //                                 )
    //                               ]
    //                               // },
    //                               ),

    //                         ])
    //                   ),

    //                       ),
    //           )));
    // }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.2,
              shadowColor: theme.scaffoldBackgroundColor,
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Container(
                height: 28,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          controller.clear();
                          // widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search Crypto or Currency"),
                ),
              ),
            ),
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
                        child: TabBar(
                          indicatorColor: theme.scaffoldBackgroundColor,
                          controller: _nestedTabController,
                          isScrollable: true,
                          tabs: [
                            Tab(
                                child: Text('Crypto',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                            Tab(
                                child: Text('Currency',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                          ],
                        ),
                      ))),
              body: Container(
                  color: theme.canvasColor,
                  child: TabBarView(
                      controller: _nestedTabController,
                      children: <Widget>[
                        ListView.builder(
                          controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          itemCount: coins.length,
                          padding: const EdgeInsets.all(1.0),
                          itemBuilder: (context, index) {
                            var coin = coins[index];
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
                                //                 child: (state is _LoadedAssetState)
                                // ?
                                // Column(children: [
                                //                   ListTile(
                                //                     title: Row(
                                //                       children: [
                                //                         Text(coin.name!,
                                //                             style: TextStyle(
                                //                               fontSize:
                                //                                   14 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             )),
                                //                         Expanded(
                                //                             child: Container(
                                //                                 width: screenWidth *
                                //                                     0.08)),
                                //                         Text(coin.symbol!,
                                //                             style: TextStyle(
                                //                               fontSize:
                                //                                   14 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             ))
                                //                       ],
                                //                     ),
                                //                     subtitle: Row(
                                //                       children: [
                                //                         // Text("EOS",
                                //                         //     style: TextStyle(
                                //                         //       fontSize: 12 * textScale,
                                //                         //     )),
                                //                         Expanded(
                                //                             child: Container(
                                //                                 width: screenWidth *
                                //                                     0.08)),
                                //                         Text("1.7575",
                                //                             style: TextStyle(
                                //                               color: theme.hoverColor,
                                //                               fontSize:
                                //                                   11 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             ))
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 ]): const Center(
                                //     child: CircularProgressIndicator(),
                                //   )
                              ),
                            );
                          },
                        ),
                        ListView(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            // itemCount: 8,
                            padding: const EdgeInsets.all(1.0),
                            // itemBuilder: (context, index) {
                            //   var bean = _list[index]; return
                            children: [
                              Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                // child: InkWell(
                                //   onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   // return DetailPage(bean);
                                //   return NftDetailsPage();
                                // }));
                                // },
                                // child:

                                //                                 (state is _LoadedAssetState)
                                //               ?
                                //                Column(children: [
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("ETH",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("EOS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.78",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),

                                //                                       onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Chart(token: "qwerty"),
                                //     ),
                                //   );
                                // },
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SHIB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.00001314.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.0000013",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BTC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("2610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("cx",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("FT",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BNB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("MATIC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("34.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("XRP",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("AVAX",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("22.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("NFTB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SPA",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("CPOOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("IXS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.29",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                 ])
                                //                                   : const Center(
                                //                   child: CircularProgressIndicator(),
                                //                 ))
                              )
                            ]
                            // },
                            ),
                      ])),
            )));
    //   },
    // );
  }
}

class SearchListBuy extends StatefulWidget {
  const SearchListBuy({Key? key}) : super(key: key);

  @override
  _SearchListBuyState createState() => _SearchListBuyState();
}

class _SearchListBuyState extends State<SearchListBuy>
    with TickerProviderStateMixin {
//

  // List<User> _foundedUsers = [];
  //late List <Fiat> fiats=[]
  // late List<Coin> coins;
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  Future init() async {
    // final coins = await CoinProvider.getMarketCoins(query);

    // setState(() => this.coins = coins);
  }

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    // coins = coinsdata;
    // init();
  }

  // void onSearch(String query) {
  //   // _foundedUsers = _users
  //   //     .where((user) => user.name.toLowerCase().contains(search))
  //   //     .toList();
  //   final coins = coinsdata.where((coin) {
  //     final titleLower = coin.symbol!.toLowerCase();
  //     final authorLower = coin.name!.toLowerCase();
  //     final searchLower = query.toLowerCase();

  //     return titleLower.contains(searchLower) ||
  //         authorLower.contains(searchLower);
  //   }).toList();

  //   setState(() {
  //     this.query = query;
  //     this.coins = coins;
  //   });
  // }

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

    // final style = widget.text.isEmpty ? styleHint : styleActive;

    // return
    //  BlocConsumer<AssetBloc, AssetState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    // if (state is SuccessAssetcState) {
    //       ScaffoldMessenger.of(context).showSnackBar((
    //         const SnackBar(
    //           duration: Duration(seconds: 2),
    //           content: Text(' succeess ', textScaleFactor: 1.5),
    //         ),
    //       );
    //     }         else if (state is ErrorAssetState) {

    //     ScaffoldMessenger.of(context).showSnackBar((
    //       const SnackBar(
    //         duration: Duration(seconds: 2),
    //         content: Text(' error ', textScaleFactor: 1.5),
    //       ),
    //     );
    //     }
    //   }, // @ts-ignore
    //   builder: (context, state) {

    // if (state is _ErrorAssetState) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //           backgroundColor: theme.backgroundColor,
    //           appBar: AppBar(
    //             automaticallyImplyLeading: false,
    //             elevation: 0.2,
    //             shadowColor: theme.scaffoldBackgroundColor,
    //             backgroundColor: theme.scaffoldBackgroundColor,
    //             title: Container(
    //               height: 28,
    //               child: TextField(
    //                 onChanged: onSearch,
    //                 decoration: InputDecoration(
    //                     suffixIcon: GestureDetector(
    //                       child: Icon(
    //                         Icons.close,
    //                       ),
    //                       onTap: () {
    //                         controller.clear();
    //                         // widget.onChanged('');
    //                         FocusScope.of(context)
    //                             .requestFocus(FocusNode());
    //                       },
    //                     ),
    //                     filled: true,
    //                     fillColor: theme.backgroundColor,
    //                     contentPadding: EdgeInsets.all(0),
    //                     prefixIcon: Icon(
    //                       Icons.search,
    //                       color: Colors.grey.shade500,
    //                     ),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(50),
    //                         borderSide: BorderSide.none),
    //                     hintStyle: TextStyle(
    //                         fontSize: 14, color: Colors.grey.shade500),
    //                     hintText: "Search Crypto or Currency"),
    //               ),
    //             ),
    //           ),
    //           body: Scaffold(
    //             backgroundColor: theme.backgroundColor,
    //             appBar: AppBar(
    //                 elevation: 0.2,
    //                 bottomOpacity: 1.0,
    //                 shadowColor: theme.scaffoldBackgroundColor,
    //                 backgroundColor: theme.scaffoldBackgroundColor,
    //                 automaticallyImplyLeading: false,
    //                 title: Padding(
    //                     padding: EdgeInsets.only(left: 0),
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: TabBar(
    //                         indicatorColor: theme.scaffoldBackgroundColor,
    //                         controller: _nestedTabController,
    //                         isScrollable: true,
    //                         tabs: [
    //                           Tab(
    //                               child: Text('Crypto',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                           Tab(
    //                               child: Text('Currency',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                         ],
    //                       ),
    //                     ))),
    //             body: Container(
    //                                  color: theme.canvasColor,

    //                 child: Container(
    //               color: theme.backgroundColor,
    //               child:  TabBarView(
    //                       controller: _nestedTabController,
    //                       children: <Widget>[

    //                           ListView.builder(
    //                             controller: _controller,
    //                             physics: const BouncingScrollPhysics(
    //                                 parent:
    //                                     AlwaysScrollableScrollPhysics()),
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: coins.length,
    //                             padding: const EdgeInsets.all(1.0),
    //                             itemBuilder: (context, index) {
    //                               var coin = coins[index];
    //                               return Container(
    //                                 color: Colors.white70,
    //                                 // width: screenWidth * 0.880,
    //                                                                           child:Text("Something Went Wrong Error Code :")

    //                               );
    //                             },
    //                           ),

    //                           ListView(
    //                               controller: _controller,
    //                               physics: const BouncingScrollPhysics(
    //                                   parent:
    //                                       AlwaysScrollableScrollPhysics()),
    //                               scrollDirection: Axis.vertical,
    //                               // itemCount: 8,
    //                               padding: const EdgeInsets.all(1.0),
    //                               // itemBuilder: (context, index) {
    //                               //   var bean = _list[index]; return
    //                               children: [
    //                                 Container(
    //                                   color: Colors.white70,
    //                                   // width: screenWidth * 0.880,
    //                                   child:Text("Something Went Wrong Error Code :")
    //                                 )
    //                               ]
    //                               // },
    //                               ),

    //                         ])
    //                   ),

    //                       ),
    //           )));
    // }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.2,
              shadowColor: theme.scaffoldBackgroundColor,
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Container(
                height: 28,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          controller.clear();
                          // widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search Crypto or Currency"),
                ),
              ),
            ),
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
                        child: TabBar(
                          indicatorColor: theme.scaffoldBackgroundColor,
                          controller: _nestedTabController,
                          isScrollable: true,
                          tabs: [
                            Tab(
                                child: Text('Crypto',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                            Tab(
                                child: Text('Currency',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                          ],
                        ),
                      ))),
              body: Container(
                  color: theme.canvasColor,
                  child: TabBarView(
                      controller: _nestedTabController,
                      children: <Widget>[
                        ListView.builder(
                          controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          itemCount: coins.length,
                          padding: const EdgeInsets.all(1.0),
                          itemBuilder: (context, index) {
                            var coin = coins[index];
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
                                //                 child: (state is _LoadedAssetState)
                                // ?
                                // Column(children: [
                                //                   ListTile(
                                //                     title: Row(
                                //                       children: [
                                //                         Text(coin.name!,
                                //                             style: TextStyle(
                                //                               fontSize:
                                //                                   14 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             )),
                                //                         Expanded(
                                //                             child: Container(
                                //                                 width: screenWidth *
                                //                                     0.08)),
                                //                         Text(coin.symbol!,
                                //                             style: TextStyle(
                                //                               fontSize:
                                //                                   14 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             ))
                                //                       ],
                                //                     ),
                                //                     subtitle: Row(
                                //                       children: [
                                //                         // Text("EOS",
                                //                         //     style: TextStyle(
                                //                         //       fontSize: 12 * textScale,
                                //                         //     )),
                                //                         Expanded(
                                //                             child: Container(
                                //                                 width: screenWidth *
                                //                                     0.08)),
                                //                         Text("1.7575",
                                //                             style: TextStyle(
                                //                               color: theme.hoverColor,
                                //                               fontSize:
                                //                                   11 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             ))
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 ]): const Center(
                                //     child: CircularProgressIndicator(),
                                //   )
                              ),
                            );
                          },
                        ),
                        ListView(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            // itemCount: 8,
                            padding: const EdgeInsets.all(1.0),
                            // itemBuilder: (context, index) {
                            //   var bean = _list[index]; return
                            children: [
                              Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                // child: InkWell(
                                //   onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   // return DetailPage(bean);
                                //   return NftDetailsPage();
                                // }));
                                // },
                                // child:

                                //                                 (state is _LoadedAssetState)
                                //               ?
                                //                Column(children: [
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("ETH",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("EOS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.78",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),

                                //                                       onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Chart(token: "qwerty"),
                                //     ),
                                //   );
                                // },
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SHIB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.00001314.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.0000013",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BTC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("2610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("cx",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("FT",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BNB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("MATIC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("34.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("XRP",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("AVAX",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("22.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("NFTB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SPA",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("CPOOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("IXS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.29",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                 ])
                                //                                   : const Center(
                                //                   child: CircularProgressIndicator(),
                                //                 ))
                              )
                            ]
                            // },
                            ),
                      ])),
            )));
    //   },
    // );
  }
}

class SearchListAdvert extends StatefulWidget {
  const SearchListAdvert({Key? key}) : super(key: key);

  @override
  _SearchListAdvertState createState() => _SearchListAdvertState();
}

class _SearchListAdvertState extends State<SearchListAdvert>
    with TickerProviderStateMixin {
//

  // List<User> _foundedUsers = [];
  //late List <Fiat> fiats=[]
  // late List<Coin> coins;
  // late List<Coin> fiats = [];
  String query = "";
  Timer? debouncer;
  late TabController _nestedTabController;
  // List<TravelBean> _list = TravelBean.generateMostPopularBean();
  Future init() async {
    // final coins = await CoinProvider.getMarketCoins(query);

    // setState(() => this.coins = coins);
  }

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
    // coins = coinsdata;    // init();
  }

  // void onSearch(String query) {
  //   // _foundedUsers = _users
  //   //     .where((user) => user.name.toLowerCase().contains(search))
  //   //     .toList();
  //   final coins = coinsdata.where((coin) {
  //     final titleLower = coin.symbol!.toLowerCase();
  //     final authorLower = coin.name!.toLowerCase();
  //     final searchLower = query.toLowerCase();

  //     return titleLower.contains(searchLower) ||
  //         authorLower.contains(searchLower);
  //   }).toList();

  //   setState(() {
  //     this.query = query;
  //     this.coins = coins;
  //   });
  // }

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

    // final style = widget.text.isEmpty ? styleHint : styleActive;

    // return
    //  BlocConsumer<AssetBloc, AssetState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    // if (state is SuccessAssetcState) {
    //       ScaffoldMessenger.of(context).showSnackBar((
    //         const SnackBar(
    //           duration: Duration(seconds: 2),
    //           content: Text(' succeess ', textScaleFactor: 1.5),
    //         ),
    //       );
    //     }         else if (state is ErrorAssetState) {

    //     ScaffoldMessenger.of(context).showSnackBar((
    //       const SnackBar(
    //         duration: Duration(seconds: 2),
    //         content: Text(' error ', textScaleFactor: 1.5),
    //       ),
    //     );
    //     }
    //   }, // @ts-ignore
    //   builder: (context, state) {

    // if (state is _ErrorAssetState) {
    //   return DefaultTabController(
    //       length: 2,
    //       child: Scaffold(
    //           backgroundColor: theme.backgroundColor,
    //           appBar: AppBar(
    //             automaticallyImplyLeading: false,
    //             elevation: 0.2,
    //             shadowColor: theme.scaffoldBackgroundColor,
    //             backgroundColor: theme.scaffoldBackgroundColor,
    //             title: Container(
    //               height: 28,
    //               child: TextField(
    //                 onChanged: onSearch,
    //                 decoration: InputDecoration(
    //                     suffixIcon: GestureDetector(
    //                       child: Icon(
    //                         Icons.close,
    //                       ),
    //                       onTap: () {
    //                         controller.clear();
    //                         // widget.onChanged('');
    //                         FocusScope.of(context)
    //                             .requestFocus(FocusNode());
    //                       },
    //                     ),
    //                     filled: true,
    //                     fillColor: theme.backgroundColor,
    //                     contentPadding: EdgeInsets.all(0),
    //                     prefixIcon: Icon(
    //                       Icons.search,
    //                       color: Colors.grey.shade500,
    //                     ),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(50),
    //                         borderSide: BorderSide.none),
    //                     hintStyle: TextStyle(
    //                         fontSize: 14, color: Colors.grey.shade500),
    //                     hintText: "Search Crypto or Currency"),
    //               ),
    //             ),
    //           ),
    //           body: Scaffold(
    //             backgroundColor: theme.backgroundColor,
    //             appBar: AppBar(
    //                 elevation: 0.2,
    //                 bottomOpacity: 1.0,
    //                 shadowColor: theme.scaffoldBackgroundColor,
    //                 backgroundColor: theme.scaffoldBackgroundColor,
    //                 automaticallyImplyLeading: false,
    //                 title: Padding(
    //                     padding: EdgeInsets.only(left: 0),
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: TabBar(
    //                         indicatorColor: theme.scaffoldBackgroundColor,
    //                         controller: _nestedTabController,
    //                         isScrollable: true,
    //                         tabs: [
    //                           Tab(
    //                               child: Text('Crypto',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                           Tab(
    //                               child: Text('Currency',
    //                                   style: TextStyle(
    //                                       fontSize: 14 * textScale,
    //                                       color: Colors.black87))),
    //                         ],
    //                       ),
    //                     ))),
    //             body: Container(
    // color: theme.canvasColor,
    //                 child: Container(
    //               color: theme.backgroundColor,
    //               child:  TabBarView(
    //                       controller: _nestedTabController,
    //                       children: <Widget>[

    //                           ListView.builder(
    //                             controller: _controller,
    //                             physics: const BouncingScrollPhysics(
    //                                 parent:
    //                                     AlwaysScrollableScrollPhysics()),
    //                             scrollDirection: Axis.vertical,
    //                             itemCount: coins.length,
    //                             padding: const EdgeInsets.all(1.0),
    //                             itemBuilder: (context, index) {
    //                               var coin = coins[index];
    //                               return Container(
    //                                 color: Colors.white70,
    //                                 // width: screenWidth * 0.880,
    //                                                                           child:Text("Something Went Wrong Error Code :")

    //                               );
    //                             },
    //                           ),

    //                           ListView(
    //                               controller: _controller,
    //                               physics: const BouncingScrollPhysics(
    //                                   parent:
    //                                       AlwaysScrollableScrollPhysics()),
    //                               scrollDirection: Axis.vertical,
    //                               // itemCount: 8,
    //                               padding: const EdgeInsets.all(1.0),
    //                               // itemBuilder: (context, index) {
    //                               //   var bean = _list[index]; return
    //                               children: [
    //                                 Container(
    //                                   color: Colors.white70,
    //                                   // width: screenWidth * 0.880,
    //                                   child:Text("Something Went Wrong Error Code :")
    //                                 )
    //                               ]
    //                               // },
    //                               ),

    //                         ])
    //                   ),

    //                       ),
    //           )));
    // }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.2,
              shadowColor: theme.scaffoldBackgroundColor,
              backgroundColor: theme.scaffoldBackgroundColor,
              title: Container(
                height: 28,
                child: TextField(
                  onChanged: onSearch,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                        ),
                        onTap: () {
                          controller.clear();
                          // widget.onChanged('');
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      filled: true,
                      fillColor: theme.backgroundColor,
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                      hintText: "Search Crypto or Currency"),
                ),
              ),
            ),
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
                        child: TabBar(
                          indicatorColor: theme.scaffoldBackgroundColor,
                          controller: _nestedTabController,
                          isScrollable: true,
                          tabs: [
                            Tab(
                                child: Text('Crypto',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                            Tab(
                                child: Text('Currency',
                                    style: TextStyle(
                                        fontSize: 14 * textScale,
                                        color: Colors.black87))),
                          ],
                        ),
                      ))),
              body: Container(
                  color: theme.canvasColor,
                  child: TabBarView(
                      controller: _nestedTabController,
                      children: <Widget>[
                        ListView.builder(
                          controller: _controller,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          scrollDirection: Axis.vertical,
                          itemCount: coins.length,
                          padding: const EdgeInsets.all(1.0),
                          itemBuilder: (context, index) {
                            var coin = coins[index];
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
                                //                 child: (state is _LoadedAssetState)
                                // ?
                                // Column(children: [
                                //                   ListTile(
                                //                     title: Row(
                                //                       children: [
                                //                         Text(coin.name!,
                                //                             style: TextStyle(
                                //                               fontSize:
                                //                                   14 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             )),
                                //                         Expanded(
                                //                             child: Container(
                                //                                 width: screenWidth *
                                //                                     0.08)),
                                //                         Text(coin.symbol!,
                                //                             style: TextStyle(
                                //                               fontSize:
                                //                                   14 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             ))
                                //                       ],
                                //                     ),
                                //                     subtitle: Row(
                                //                       children: [
                                //                         // Text("EOS",
                                //                         //     style: TextStyle(
                                //                         //       fontSize: 12 * textScale,
                                //                         //     )),
                                //                         Expanded(
                                //                             child: Container(
                                //                                 width: screenWidth *
                                //                                     0.08)),
                                //                         Text("1.7575",
                                //                             style: TextStyle(
                                //                               color: theme.hoverColor,
                                //                               fontSize:
                                //                                   11 * textScale,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                             ))
                                //                       ],
                                //                     ),
                                //                   ),
                                //                 ]): const Center(
                                //     child: CircularProgressIndicator(),
                                //   )
                              ),
                            );
                          },
                        ),
                        ListView(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            // itemCount: 8,
                            padding: const EdgeInsets.all(1.0),
                            // itemBuilder: (context, index) {
                            //   var bean = _list[index]; return
                            children: [
                              Container(
                                color: Colors.white70,
                                // width: screenWidth * 0.880,
                                // child: InkWell(
                                //   onTap: () {
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   // return DetailPage(bean);
                                //   return NftDetailsPage();
                                // }));
                                // },
                                // child:

                                //                                 (state is _LoadedAssetState)
                                //               ?
                                //                Column(children: [
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("ETH",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("EOS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.78",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),

                                //                                       onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Chart(token: "qwerty"),
                                //     ),
                                //   );
                                // },
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SHIB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.00001314.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.0000013",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BTC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("2610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("cx",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("FT",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("BNB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("DOGE",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("MATIC",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("34.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("XRP",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1610.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("AVAX",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("22.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("NFTB",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("SPA",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.079",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("1.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   11 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("CPOOL",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.79",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                   ListTile(
                                //                                     title: Row(
                                //                                       children: [
                                //                                         Text("IXS",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.29",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   14 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                     subtitle: Row(
                                //                                       children: [
                                //                                         // Text("EOS",
                                //                                         //     style: TextStyle(
                                //                                         //       fontSize: 12 * textScale,
                                //                                         //     )),
                                //                                         Expanded(
                                //                                             child: Container(
                                //                                                 width: screenWidth *
                                //                                                     0.08)),
                                //                                         Text("0.7575",
                                //                                             style: TextStyle(
                                //                                               fontSize:
                                //                                                   12 * textScale,
                                //                                               fontWeight:
                                //                                                   FontWeight.w500,
                                //                                             ))
                                //                                       ],
                                //                                     ),
                                //                                   ),
                                //                                 ])
                                //                                   : const Center(
                                //                   child: CircularProgressIndicator(),
                                //                 ))
                              )
                            ]
                            // },
                            ),
                      ])),
            )));
    //   },
    // );
  }
}
