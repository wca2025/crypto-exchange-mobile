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
    _nestedTabController = new TabController(length: 3, vsync: this);
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
    List<TravelBean> _list = TravelBean.generateMostPopularBean();

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // Container(
            //   color: theme.backgroundColor,
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child:Text("BTC",
            //                 style: TextStyle(
            //                   fontSize: 12 * textScale,
            //                   fontWeight: FontWeight.w500,
            //                 ))
            //   ),
            // ),
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
                         
                          ListView.builder(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            itemCount:8,
                            //itemCount:state.btccoin.length,
                            padding: const EdgeInsets.all(1.0),
                            itemBuilder: (context, index) {
                              var bean = _list[index];
                              return Container(
                                color: Color.fromRGBO(255, 255, 255, 0.702),
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
                                          Text("lorem"),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text("lorem")
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text("lorem",
                                              style: TextStyle(
                                                fontSize: 12 * textScale,
                                              )),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.08)),
                                          Text("lorem",
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
                                          child: Text('Text',
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

class LeveragedTokem extends StatefulWidget {
  LeveragedTokem();

  @override
  _LeveragedTokemState createState() => _LeveragedTokemState();
}

class _LeveragedTokemState extends State<LeveragedTokem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _LeveragedTokemMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _LeveragedTokemTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _LeveragedTokemTablet extends StatefulWidget {
  _LeveragedTokemTablet();

  @override
  __LeveragedTokemTabletState createState() => __LeveragedTokemTabletState();
  final List<String> list = List.generate(10, (index) => "nutrinax $index");
}

class __LeveragedTokemTabletState extends State<_LeveragedTokemTablet> {
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

    return  Scaffold(
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
               
                         Text('Spot',
                              style: TextStyle(
                                fontSize: 16 * textScale,
                              )),
                 
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
              body: 
                  NestedTabBar(),
                
              
             
            )),

        // bottomNavigationBar: CustomBottomNavBar(),
      
    );
  }
}

class _LeveragedTokemMobile extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "nutrinax $index");

  _LeveragedTokemMobile(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _LeveragedTokemMobileState createState() => _LeveragedTokemMobileState();
}

class _LeveragedTokemMobileState extends State<_LeveragedTokemMobile> {
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

    return  Scaffold(
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
               Text('Levereaged  Token',
                              style: TextStyle(
                                fontSize: 16 * textScale,
                              )),
                
                  
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
              body:
                  NestedTabBar(),
                
             
            )),

        // bottomNavigationBar: CustomBottomNavBar(),
      
    );
  }
}
