import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import 'orders.dart';
import 'p2psell.dart';
import 'paymentmethodlist.dart';
import 'tradingbotlistdetail.dart';
import 'travel_bean.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'coustom_bottom_nav_bar.dart';
import 'homepage.dart';
import 'myads.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../main.dart';

class User {
  final String name;
  final String username;
  final String image;
  bool isFollowedByMe;

  User(this.name, this.username, this.image, this.isFollowedByMe,
      {required password});
}

class Main extends StatefulWidget {
  String? token;
  String? accounttype;

  Main({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _MainState createState() =>
      _MainState(token: this.token, accounttype: this.accounttype);
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _MainState({this.token, this.accounttype});
  late TabController _nestedTabController;

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
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
    bool _genderHasError = false;
    final _formKey = GlobalKey<FormBuilderState>();
    var genderOptions = ['Male', 'Female', 'Other'];

    List<TravelBean> _list = TravelBean.generateMostPopularBean();

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Scaffold(
            backgroundColor: theme.backgroundColor,
            body:
                // Column(
                // // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
                // children: <Widget>[

                Container(
                    color: theme.backgroundColor,
                    // height: screenHeight * 1.0,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      children: <Widget>[
                        //                 Container(
                        //                   color: theme.backgroundColor,
                        //                   // height: screenHeight * 0.50,
                        //                   width: screenWidth,

                        //        child: TextField(
                        //           decoration: InputDecoration(
                        //               prefixIcon: Icon(Icons.search)
                        //           ),
                        //           controller: urlController,
                        //           keyboardType: TextInputType.url,
                        //           onSubmitted: (value) {
                        //             var url = Uri.parse(value);
                        //             if (url.scheme.isEmpty) {
                        //               url = Uri.parse(" cs://www.google.com/search?q=" + value);
                        //             }
                        //             webViewController?.loadUrl(
                        //                 urlRequest: URLRequest(url: url));
                        //           },
                        //         ),
                        //  ),

                        Container(
                          color: theme.backgroundColor,
                          height: screenHeight * 0.50,
                          child:
                              // Expanded(
                              //   child:
                              InAppWebView(
                            gestureRecognizers: Set()
                              ..add(Factory<VerticalDragGestureRecognizer>(
                                  () => VerticalDragGestureRecognizer())),
                            key: webViewKey,
                            initialUrlRequest: URLRequest(
                                url: Uri.parse(
                                    "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                            initialOptions: options,
                            pullToRefreshController: pullToRefreshController,
                            onWebViewCreated: (controller) {
                              webViewController = controller;
                            },
                            onLoadStart: (controller, url) {
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            androidOnPermissionRequest:
                                (controller, origin, resources) async {
                              return PermissionRequestResponse(
                                  resources: resources,
                                  action:
                                      PermissionRequestResponseAction.GRANT);
                            },
                            shouldOverrideUrlLoading:
                                (controller, navigationAction) async {
                              var uri = navigationAction.request.url!;

                              if (![
                                "http",
                                "https",
                                "file",
                                "chrome",
                                "data",
                                "javascript",
                                "about"
                              ].contains(uri.scheme)) {
                                if (await canLaunch(url)) {
                                  // Launch the App
                                  await launch(
                                    url,
                                  );
                                  // and cancel the request
                                  return NavigationActionPolicy.CANCEL;
                                }
                              }

                              return NavigationActionPolicy.ALLOW;
                            },
                            onLoadStop: (controller, url) async {
                              pullToRefreshController.endRefreshing();
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            onLoadError: (controller, url, code, message) {
                              pullToRefreshController.endRefreshing();
                            },
                            onProgressChanged: (controller, progress) {
                              if (progress == 100) {
                                pullToRefreshController.endRefreshing();
                              }
                              setState(() {
                                this.progress = progress / 100;
                                urlController.text = this.url;
                              });
                            },
                            onUpdateVisitedHistory:
                                (controller, url, androidIsReload) {
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            onConsoleMessage: (controller, consoleMessage) {
                              print(consoleMessage);
                            },
                          ),
                          // )
                        ),

                        Container(
                            color: theme.backgroundColor,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TabBar(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.grey),
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
                                    child: Text(
                                      "Daily Ranking",
                                      style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "7 Day Ranking",
                                      style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Column(
                          children: [
                            Container(
                              color: theme.backgroundColor,
                              height: screenHeight * 0.40,
                              child: TabBarView(
                                controller: _nestedTabController,
                                children: <Widget>[
                                  ListView.builder(
                                    controller: _controller,
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
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
                                            // Navigator.of(context,rootNavigator: true)
                                            //     .push(MaterialPageRoute(builder: (context) {
                                            //   // return DetailPage(bean);
                                            //   return NftDetailsPage();
                                            // }));
                                          },
                                          child: Column(children: [
                                            Container(
                                              height: screenHeight * 0.058,
                                              color: theme.backgroundColor,
                                              child: ListTile(
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                          "Username/Pair                  Buy Price   ",
                                                          style: TextStyle(
                                                            fontSize:
                                                                11 * textScale,
                                                            color:
                                                                Colors.black38,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ))
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                      "          APR",
                                                      style: TextStyle(
                                                        fontSize:
                                                            11 * textScale,
                                                        color: Colors.black38,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                       34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                    ],
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.08)),
                                                  Text("1610.79",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize:
                                                            14 * textScale,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
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
                                            // Navigator.of(context,rootNavigator: true)
                                            //     .push(MaterialPageRoute(builder: (context) {
                                            //   // return DetailPage(bean);
                                            //   return NftDetailsPage();
                                            // }));
                                          },
                                          child: Column(children: [
                                            Container(
                                              height: screenHeight * 0.058,
                                              color: theme.backgroundColor,
                                              child: ListTile(
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                          "Username/Pair                  Buy Price   ",
                                                          style: TextStyle(
                                                            fontSize:
                                                                11 * textScale,
                                                            color:
                                                                Colors.black38,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ))
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                      "          APR",
                                                      style: TextStyle(
                                                        fontSize:
                                                            11 * textScale,
                                                        color: Colors.black38,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                       34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                    ],
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.08)),
                                                  Text("1610.79",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize:
                                                            14 * textScale,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ))
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
                    ))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Column(
            // verticalDirection:VerticalDirection.down ,

            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                // width: screenWidth,
                height: screenHeight * 0.075,
                color: theme.scaffoldBackgroundColor,
                child: Row(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                      ),
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.85,
                          height: screenHeight * 0.055,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: Color(0xFF1da2b4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return Tradingbotlistdetail1();
                                }));
                              },
                              child: Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]));
  }
}

class Tradingbotoptionlist extends StatefulWidget {
  String? token;
  String? accounttype;
  Tradingbotoptionlist({Key? key, this.token, this.accounttype})
      : super(key: key);

  @override
  _TradingbotoptionlistState createState() => _TradingbotoptionlistState(
      token: this.token, accounttype: this.accounttype);
}

class _TradingbotoptionlistState extends State<Tradingbotoptionlist> {
  String? token;
  String? accounttype;
  _TradingbotoptionlistState({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _TradingbotoptionlistMobile(
              token: token, accounttype: accounttype),
          tablet: _TradingbotoptionlistTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _TradingbotoptionlistTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _TradingbotoptionlistTablet(

      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __TradingbotoptionlistTabletState createState() =>
      __TradingbotoptionlistTabletState();
}

class __TradingbotoptionlistTabletState
    extends State<_TradingbotoptionlistTablet> with TickerProviderStateMixin {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _nestedTabController;
  List<User> _users = [];

  List<User> _foundedUsers = [];

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  final ScrollController _controller = ScrollController();
// ////////

//////////////////////////

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _nestedTabController = new TabController(length: 2, vsync: this);

    setState(() {
      _foundedUsers = _users;
    });
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
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,

        key: _scaffoldKey,

        //       leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(
        //         Icons.humb,
        //         size: 18.0,
        //       ),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),

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
                child: Text('Tradingbotoptionlist',
                    style: TextStyle(
                      fontSize: 16 * textScale,
                    ))),
          ],
        ),
      ),
      body: Main(),
      drawer: Container(
        width: screenWidth * 1.15,
        child: Drawer(
            child: Scaffold(
                backgroundColor: theme.backgroundColor,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0.5,
                  shadowColor: theme.scaffoldBackgroundColor,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: Container(
                    height: 28,
                    child: TextField(
                      // onChanged: (value) => onSearch(value),
                      decoration: InputDecoration(
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
                          hintStyle: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
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
                      color: theme.backgroundColor,
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
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .push(MaterialPageRoute(
                                                  builder: (context) {
                                            // return DetailPage(bean);
                                            return Tradingbotoptionlist();
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
                                          // Navigator.of(context, rootNavigator: true)
                                          //     .push(MaterialPageRoute(
                                          //         builder: (context) {
                                          //   // return DetailPage(bean);
                                          //   return Tradingbotoptionlist();
                                          // }));
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
                ))),
      ),
    );

    // bottomNavigationBar: CustomBottomNavBar(),
  }
}

class _TradingbotoptionlistMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _TradingbotoptionlistMobile({Key? key, this.token, this.accounttype})
      : super(key: key);

  @override
  _TradingbotoptionlistMobileState createState() =>
      _TradingbotoptionlistMobileState(
          token: this.token, accounttype: this.accounttype);
}

class _TradingbotoptionlistMobileState
    extends State<_TradingbotoptionlistMobile> with TickerProviderStateMixin {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _TradingbotoptionlistMobileState({this.token, this.accounttype});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String value;
  late TabController _nestedTabController;
  List<User> _users = [];

  List<User> _foundedUsers = [];

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _nestedTabController = new TabController(length: 2, vsync: this);

    setState(() {
      _foundedUsers = _users;
    });
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
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,

        key: _scaffoldKey,

        //       leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(
        //         Icons.humb,
        //         size: 18.0,
        //       ),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),

        title: Text('Spot Grid',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16 * textScale,
            )),
      ),
      body: Scaffold(
        body: Main(token: token, accounttype: accounttype),
      ),

      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

// ////////////////

class Main2 extends StatefulWidget {
  String? token;
  String? accounttype;

  Main2({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _Main2State createState() =>
      _Main2State(token: this.token, accounttype: this.accounttype);
}

class _Main2State extends State<Main2> with TickerProviderStateMixin {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _Main2State({this.token, this.accounttype});
  late TabController _nestedTabController;

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
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
    bool _genderHasError = false;
    final _formKey = GlobalKey<FormBuilderState>();
    var genderOptions = ['Male', 'Female', 'Other'];

    List<TravelBean> _list = TravelBean.generateMostPopularBean();

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Scaffold(
            backgroundColor: theme.backgroundColor,
            body:
                // Column(
                // // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
                // children: <Widget>[

                Container(
                    color: theme.backgroundColor,
                    // height: screenHeight * 1.0,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      children: <Widget>[
                        //                 Container(
                        //                   color: theme.backgroundColor,
                        //                   // height: screenHeight * 0.50,
                        //                   width: screenWidth,

                        //        child: TextField(
                        //           decoration: InputDecoration(
                        //               prefixIcon: Icon(Icons.search)
                        //           ),
                        //           controller: urlController,
                        //           keyboardType: TextInputType.url,
                        //           onSubmitted: (value) {
                        //             var url = Uri.parse(value);
                        //             if (url.scheme.isEmpty) {
                        //               url = Uri.parse(" cs://www.google.com/search?q=" + value);
                        //             }
                        //             webViewController?.loadUrl(
                        //                 urlRequest: URLRequest(url: url));
                        //           },
                        //         ),
                        //  ),

                        Container(
                          color: theme.backgroundColor,
                          height: screenHeight * 0.50,
                          child:
                              // Expanded(
                              //   child:
                              InAppWebView(
                            gestureRecognizers: Set()
                              ..add(Factory<VerticalDragGestureRecognizer>(
                                  () => VerticalDragGestureRecognizer())),
                            key: webViewKey,
                            initialUrlRequest: URLRequest(
                                url: Uri.parse(
                                    "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                            initialOptions: options,
                            pullToRefreshController: pullToRefreshController,
                            onWebViewCreated: (controller) {
                              webViewController = controller;
                            },
                            onLoadStart: (controller, url) {
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            androidOnPermissionRequest:
                                (controller, origin, resources) async {
                              return PermissionRequestResponse(
                                  resources: resources,
                                  action:
                                      PermissionRequestResponseAction.GRANT);
                            },
                            shouldOverrideUrlLoading:
                                (controller, navigationAction) async {
                              var uri = navigationAction.request.url!;

                              if (![
                                "http",
                                "https",
                                "file",
                                "chrome",
                                "data",
                                "javascript",
                                "about"
                              ].contains(uri.scheme)) {
                                if (await canLaunch(url)) {
                                  // Launch the App
                                  await launch(
                                    url,
                                  );
                                  // and cancel the request
                                  return NavigationActionPolicy.CANCEL;
                                }
                              }

                              return NavigationActionPolicy.ALLOW;
                            },
                            onLoadStop: (controller, url) async {
                              pullToRefreshController.endRefreshing();
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            onLoadError: (controller, url, code, message) {
                              pullToRefreshController.endRefreshing();
                            },
                            onProgressChanged: (controller, progress) {
                              if (progress == 100) {
                                pullToRefreshController.endRefreshing();
                              }
                              setState(() {
                                this.progress = progress / 100;
                                urlController.text = this.url;
                              });
                            },
                            onUpdateVisitedHistory:
                                (controller, url, androidIsReload) {
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            onConsoleMessage: (controller, consoleMessage) {
                              print(consoleMessage);
                            },
                          ),
                          // )
                        ),

                        Container(
                            color: theme.backgroundColor,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TabBar(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.grey),
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
                                    child: Text(
                                      "Daily Ranking",
                                      style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "7 Day Ranking",
                                      style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Column(
                          children: [
                            Container(
                              color: theme.backgroundColor,
                              height: screenHeight * 0.40,
                              child: TabBarView(
                                controller: _nestedTabController,
                                children: <Widget>[
                                  ListView.builder(
                                    controller: _controller,
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
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
                                            // Navigator.of(context,rootNavigator: true)
                                            //     .push(MaterialPageRoute(builder: (context) {
                                            //   // return DetailPage(bean);
                                            //   return NftDetailsPage();
                                            // }));
                                          },
                                          child: Column(children: [
                                            Container(
                                              height: screenHeight * 0.058,
                                              color: theme.backgroundColor,
                                              child: ListTile(
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                          "Username/Pair                  Buy Price   ",
                                                          style: TextStyle(
                                                            fontSize:
                                                                11 * textScale,
                                                            color:
                                                                Colors.black38,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ))
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                      "          APR",
                                                      style: TextStyle(
                                                        fontSize:
                                                            11 * textScale,
                                                        color: Colors.black38,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                       34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                    ],
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.08)),
                                                  Text("1610.79",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize:
                                                            14 * textScale,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
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
                                            // Navigator.of(context,rootNavigator: true)
                                            //     .push(MaterialPageRoute(builder: (context) {
                                            //   // return DetailPage(bean);
                                            //   return NftDetailsPage();
                                            // }));
                                          },
                                          child: Column(children: [
                                            Container(
                                              height: screenHeight * 0.058,
                                              color: theme.backgroundColor,
                                              child: ListTile(
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                          "Username/Pair                  Buy Price   ",
                                                          style: TextStyle(
                                                            fontSize:
                                                                11 * textScale,
                                                            color:
                                                                Colors.black38,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ))
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                      "          APR",
                                                      style: TextStyle(
                                                        fontSize:
                                                            11 * textScale,
                                                        color: Colors.black38,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                       34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                    ],
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.08)),
                                                  Text("1610.79",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize:
                                                            14 * textScale,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ))
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
                    ))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Column(
            // verticalDirection:VerticalDirection.down ,

            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                // width: screenWidth,
                height: screenHeight * 0.075,
                color: theme.scaffoldBackgroundColor,
                child: Row(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                      ),
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.85,
                          height: screenHeight * 0.055,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: Color(0xFF1da2b4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return Tradingbotlistdetail2();
                                }));
                              },
                              child: Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]));
  }
}

class Tradingbotoptionlist2 extends StatefulWidget {
  String? token;
  String? accounttype;
  Tradingbotoptionlist2({Key? key, this.token, this.accounttype})
      : super(key: key);

  @override
  _Tradingbotoptionlist2State createState() => _Tradingbotoptionlist2State(
      token: this.token, accounttype: this.accounttype);
}

class _Tradingbotoptionlist2State extends State<Tradingbotoptionlist2> {
  String? token;
  String? accounttype;
  _Tradingbotoptionlist2State({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _Tradingbotoptionlist2Mobile(
              token: token, accounttype: accounttype),
          tablet: _Tradingbotoptionlist2Tablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _Tradingbotoptionlist2Tablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _Tradingbotoptionlist2Tablet(

      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __Tradingbotoptionlist2TabletState createState() =>
      __Tradingbotoptionlist2TabletState();
}

class __Tradingbotoptionlist2TabletState
    extends State<_Tradingbotoptionlist2Tablet> with TickerProviderStateMixin {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _nestedTabController;
  List<User> _users = [];

  List<User> _foundedUsers = [];

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  final ScrollController _controller = ScrollController();
// ////////

//////////////////////////

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _nestedTabController = new TabController(length: 2, vsync: this);

    setState(() {
      _foundedUsers = _users;
    });
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
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,

        key: _scaffoldKey,

        //       leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(
        //         Icons.humb,
        //         size: 18.0,
        //       ),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),

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
                child: Text('Tradingbotoptionlist',
                    style: TextStyle(
                      fontSize: 16 * textScale,
                    ))),
          ],
        ),
      ),
      body: Main(),
      drawer: Container(
        width: screenWidth * 1.15,
        child: Drawer(
            child: Scaffold(
                backgroundColor: theme.backgroundColor,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0.5,
                  shadowColor: theme.scaffoldBackgroundColor,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: Container(
                    height: 28,
                    child: TextField(
                      // onChanged: (value) => onSearch(value),
                      decoration: InputDecoration(
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
                          hintStyle: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
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
                      color: theme.backgroundColor,
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
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .push(MaterialPageRoute(
                                                  builder: (context) {
                                            // return DetailPage(bean);
                                            return Tradingbotoptionlist();
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
                                          // Navigator.of(context, rootNavigator: true)
                                          //     .push(MaterialPageRoute(
                                          //         builder: (context) {
                                          //   // return DetailPage(bean);
                                          //   return Tradingbotoptionlist();
                                          // }));
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
                ))),
      ),
    );

    // bottomNavigationBar: CustomBottomNavBar(),
  }
}

class _Tradingbotoptionlist2Mobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _Tradingbotoptionlist2Mobile({Key? key, this.token, this.accounttype})
      : super(key: key);

  @override
  _Tradingbotoptionlist2MobileState createState() =>
      _Tradingbotoptionlist2MobileState(
          token: this.token, accounttype: this.accounttype);
}

class _Tradingbotoptionlist2MobileState
    extends State<_Tradingbotoptionlist2Mobile> with TickerProviderStateMixin {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _Tradingbotoptionlist2MobileState({this.token, this.accounttype});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String value;
  late TabController _nestedTabController;
  List<User> _users = [];

  List<User> _foundedUsers = [];

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _nestedTabController = new TabController(length: 2, vsync: this);

    setState(() {
      _foundedUsers = _users;
    });
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
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,

        key: _scaffoldKey,

        //       leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(
        //         Icons.humb,
        //         size: 18.0,
        //       ),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),

        title: Text('Futures Grid',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16 * textScale,
            )),
      ),
      body: Scaffold(
        body: Main(token: token, accounttype: accounttype),
      ),

      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

// //////////////////./
class Main3 extends StatefulWidget {
  String? token;
  String? accounttype;

  Main3({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _Main3State createState() =>
      _Main3State(token: this.token, accounttype: this.accounttype);
}

class _Main3State extends State<Main3> with TickerProviderStateMixin {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _Main3State({this.token, this.accounttype});
  late TabController _nestedTabController;

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
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
    bool _genderHasError = false;
    final _formKey = GlobalKey<FormBuilderState>();
    var genderOptions = ['Male', 'Female', 'Other'];

    List<TravelBean> _list = TravelBean.generateMostPopularBean();

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Scaffold(
            backgroundColor: theme.backgroundColor,
            body:
                // Column(
                // // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
                // children: <Widget>[

                Container(
                    color: theme.backgroundColor,
                    // height: screenHeight * 1.0,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      children: <Widget>[
                        //                 Container(
                        //                   color: theme.backgroundColor,
                        //                   // height: screenHeight * 0.50,
                        //                   width: screenWidth,

                        //        child: TextField(
                        //           decoration: InputDecoration(
                        //               prefixIcon: Icon(Icons.search)
                        //           ),
                        //           controller: urlController,
                        //           keyboardType: TextInputType.url,
                        //           onSubmitted: (value) {
                        //             var url = Uri.parse(value);
                        //             if (url.scheme.isEmpty) {
                        //               url = Uri.parse(" cs://www.google.com/search?q=" + value);
                        //             }
                        //             webViewController?.loadUrl(
                        //                 urlRequest: URLRequest(url: url));
                        //           },
                        //         ),
                        //  ),

                        Container(
                          color: theme.backgroundColor,
                          height: screenHeight * 0.50,
                          child:
                              // Expanded(
                              //   child:
                              InAppWebView(
                            gestureRecognizers: Set()
                              ..add(Factory<VerticalDragGestureRecognizer>(
                                  () => VerticalDragGestureRecognizer())),
                            key: webViewKey,
                            initialUrlRequest: URLRequest(
                                url: Uri.parse(
                                    "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                            initialOptions: options,
                            pullToRefreshController: pullToRefreshController,
                            onWebViewCreated: (controller) {
                              webViewController = controller;
                            },
                            onLoadStart: (controller, url) {
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            androidOnPermissionRequest:
                                (controller, origin, resources) async {
                              return PermissionRequestResponse(
                                  resources: resources,
                                  action:
                                      PermissionRequestResponseAction.GRANT);
                            },
                            shouldOverrideUrlLoading:
                                (controller, navigationAction) async {
                              var uri = navigationAction.request.url!;

                              if (![
                                "http",
                                "https",
                                "file",
                                "chrome",
                                "data",
                                "javascript",
                                "about"
                              ].contains(uri.scheme)) {
                                if (await canLaunch(url)) {
                                  // Launch the App
                                  await launch(
                                    url,
                                  );
                                  // and cancel the request
                                  return NavigationActionPolicy.CANCEL;
                                }
                              }

                              return NavigationActionPolicy.ALLOW;
                            },
                            onLoadStop: (controller, url) async {
                              pullToRefreshController.endRefreshing();
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            onLoadError: (controller, url, code, message) {
                              pullToRefreshController.endRefreshing();
                            },
                            onProgressChanged: (controller, progress) {
                              if (progress == 100) {
                                pullToRefreshController.endRefreshing();
                              }
                              setState(() {
                                this.progress = progress / 100;
                                urlController.text = this.url;
                              });
                            },
                            onUpdateVisitedHistory:
                                (controller, url, androidIsReload) {
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            onConsoleMessage: (controller, consoleMessage) {
                              print(consoleMessage);
                            },
                          ),
                          // )
                        ),

                        Container(
                            color: theme.backgroundColor,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TabBar(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.grey),
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
                                    child: Text(
                                      "Daily Ranking",
                                      style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "7 Day Ranking",
                                      style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Column(
                          children: [
                            Container(
                              color: theme.backgroundColor,
                              height: screenHeight * 0.40,
                              child: TabBarView(
                                controller: _nestedTabController,
                                children: <Widget>[
                                  ListView.builder(
                                    controller: _controller,
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
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
                                            // Navigator.of(context,rootNavigator: true)
                                            //     .push(MaterialPageRoute(builder: (context) {
                                            //   // return DetailPage(bean);
                                            //   return NftDetailsPage();
                                            // }));
                                          },
                                          child: Column(children: [
                                            Container(
                                              height: screenHeight * 0.058,
                                              color: theme.backgroundColor,
                                              child: ListTile(
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                          "Username/Pair                  Buy Price   ",
                                                          style: TextStyle(
                                                            fontSize:
                                                                11 * textScale,
                                                            color:
                                                                Colors.black38,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ))
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                      "          APR",
                                                      style: TextStyle(
                                                        fontSize:
                                                            11 * textScale,
                                                        color: Colors.black38,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                       34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                    ],
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.08)),
                                                  Text("1610.79",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize:
                                                            14 * textScale,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
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
                                            // Navigator.of(context,rootNavigator: true)
                                            //     .push(MaterialPageRoute(builder: (context) {
                                            //   // return DetailPage(bean);
                                            //   return NftDetailsPage();
                                            // }));
                                          },
                                          child: Column(children: [
                                            Container(
                                              height: screenHeight * 0.058,
                                              color: theme.backgroundColor,
                                              child: ListTile(
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                          "Username/Pair                  Buy Price   ",
                                                          style: TextStyle(
                                                            fontSize:
                                                                11 * textScale,
                                                            color:
                                                                Colors.black38,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ))
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                      "          APR",
                                                      style: TextStyle(
                                                        fontSize:
                                                            11 * textScale,
                                                        color: Colors.black38,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                       34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                    ],
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.08)),
                                                  Text("1610.79",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize:
                                                            14 * textScale,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ))
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
                    ))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Column(
            // verticalDirection:VerticalDirection.down ,

            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                // width: screenWidth,
                height: screenHeight * 0.075,
                color: theme.scaffoldBackgroundColor,
                child: Row(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                      ),
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.85,
                          height: screenHeight * 0.055,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: Color(0xFF1da2b4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return Tradingbotlistdetail3();
                                }));
                              },
                              child: Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]));
  }
}

class Tradingbotoptionlist3 extends StatefulWidget {
  String? token;
  String? accounttype;
  Tradingbotoptionlist3({Key? key, this.token, this.accounttype})
      : super(key: key);

  @override
  _Tradingbotoptionlist3State createState() => _Tradingbotoptionlist3State(
      token: this.token, accounttype: this.accounttype);
}

class _Tradingbotoptionlist3State extends State<Tradingbotoptionlist3> {
  String? token;
  String? accounttype;
  _Tradingbotoptionlist3State({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _Tradingbotoptionlist3Mobile(
              token: token, accounttype: accounttype),
          tablet: _Tradingbotoptionlist3Tablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _Tradingbotoptionlist3Tablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _Tradingbotoptionlist3Tablet(

      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __Tradingbotoptionlist3TabletState createState() =>
      __Tradingbotoptionlist3TabletState();
}

class __Tradingbotoptionlist3TabletState
    extends State<_Tradingbotoptionlist3Tablet> with TickerProviderStateMixin {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _nestedTabController;
  List<User> _users = [];

  List<User> _foundedUsers = [];

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  final ScrollController _controller = ScrollController();
// ////////

//////////////////////////

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _nestedTabController = new TabController(length: 2, vsync: this);

    setState(() {
      _foundedUsers = _users;
    });
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
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,

        key: _scaffoldKey,

        //       leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(
        //         Icons.humb,
        //         size: 18.0,
        //       ),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),

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
                child: Text('Tradingbotoptionlist',
                    style: TextStyle(
                      fontSize: 16 * textScale,
                    ))),
          ],
        ),
      ),
      body: Main(),
      drawer: Container(
        width: screenWidth * 1.15,
        child: Drawer(
            child: Scaffold(
                backgroundColor: theme.backgroundColor,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0.5,
                  shadowColor: theme.scaffoldBackgroundColor,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: Container(
                    height: 28,
                    child: TextField(
                      // onChanged: (value) => onSearch(value),
                      decoration: InputDecoration(
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
                          hintStyle: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
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
                      color: theme.backgroundColor,
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
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .push(MaterialPageRoute(
                                                  builder: (context) {
                                            // return DetailPage(bean);
                                            return Tradingbotoptionlist();
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
                                          // Navigator.of(context, rootNavigator: true)
                                          //     .push(MaterialPageRoute(
                                          //         builder: (context) {
                                          //   // return DetailPage(bean);
                                          //   return Tradingbotoptionlist();
                                          // }));
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
                ))),
      ),
    );

    // bottomNavigationBar: CustomBottomNavBar(),
  }
}

class _Tradingbotoptionlist3Mobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _Tradingbotoptionlist3Mobile({Key? key, this.token, this.accounttype})
      : super(key: key);

  @override
  _Tradingbotoptionlist3MobileState createState() =>
      _Tradingbotoptionlist3MobileState(
          token: this.token, accounttype: this.accounttype);
}

class _Tradingbotoptionlist3MobileState
    extends State<_Tradingbotoptionlist3Mobile> with TickerProviderStateMixin {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _Tradingbotoptionlist3MobileState({this.token, this.accounttype});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String value;
  late TabController _nestedTabController;
  List<User> _users = [];

  List<User> _foundedUsers = [];

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _nestedTabController = new TabController(length: 2, vsync: this);

    setState(() {
      _foundedUsers = _users;
    });
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
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,

        key: _scaffoldKey,

        //       leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(
        //         Icons.humb,
        //         size: 18.0,
        //       ),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),

        title: Text('Spot DCA',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16 * textScale,
            )),
      ),
      body: Scaffold(
        body: Main3(token: token, accounttype: accounttype),
      ),

      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

// //////////////////./
class Main4 extends StatefulWidget {
  String? token;
  String? accounttype;

  Main4({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _Main4State createState() =>
      _Main4State(token: this.token, accounttype: this.accounttype);
}

class _Main4State extends State<Main4> with TickerProviderStateMixin {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _Main4State({this.token, this.accounttype});
  late TabController _nestedTabController;

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
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
    bool _genderHasError = false;
    final _formKey = GlobalKey<FormBuilderState>();
    var genderOptions = ['Male', 'Female', 'Other'];

    List<TravelBean> _list = TravelBean.generateMostPopularBean();

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Scaffold(
            backgroundColor: theme.backgroundColor,
            body:
                // Column(
                // // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
                // children: <Widget>[

                Container(
                    color: theme.backgroundColor,
                    // height: screenHeight * 1.0,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      children: <Widget>[
                        //                 Container(
                        //                   color: theme.backgroundColor,
                        //                   // height: screenHeight * 0.50,
                        //                   width: screenWidth,

                        //        child: TextField(
                        //           decoration: InputDecoration(
                        //               prefixIcon: Icon(Icons.search)
                        //           ),
                        //           controller: urlController,
                        //           keyboardType: TextInputType.url,
                        //           onSubmitted: (value) {
                        //             var url = Uri.parse(value);
                        //             if (url.scheme.isEmpty) {
                        //               url = Uri.parse(" cs://www.google.com/search?q=" + value);
                        //             }
                        //             webViewController?.loadUrl(
                        //                 urlRequest: URLRequest(url: url));
                        //           },
                        //         ),
                        //  ),

                        Container(
                          color: theme.backgroundColor,
                          height: screenHeight * 0.50,
                          child:
                              // Expanded(
                              //   child:
                              InAppWebView(
                            gestureRecognizers: Set()
                              ..add(Factory<VerticalDragGestureRecognizer>(
                                  () => VerticalDragGestureRecognizer())),
                            key: webViewKey,
                            initialUrlRequest: URLRequest(
                                url: Uri.parse(
                                    "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                            initialOptions: options,
                            pullToRefreshController: pullToRefreshController,
                            onWebViewCreated: (controller) {
                              webViewController = controller;
                            },
                            onLoadStart: (controller, url) {
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            androidOnPermissionRequest:
                                (controller, origin, resources) async {
                              return PermissionRequestResponse(
                                  resources: resources,
                                  action:
                                      PermissionRequestResponseAction.GRANT);
                            },
                            shouldOverrideUrlLoading:
                                (controller, navigationAction) async {
                              var uri = navigationAction.request.url!;

                              if (![
                                "http",
                                "https",
                                "file",
                                "chrome",
                                "data",
                                "javascript",
                                "about"
                              ].contains(uri.scheme)) {
                                if (await canLaunch(url)) {
                                  // Launch the App
                                  await launch(
                                    url,
                                  );
                                  // and cancel the request
                                  return NavigationActionPolicy.CANCEL;
                                }
                              }

                              return NavigationActionPolicy.ALLOW;
                            },
                            onLoadStop: (controller, url) async {
                              pullToRefreshController.endRefreshing();
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            onLoadError: (controller, url, code, message) {
                              pullToRefreshController.endRefreshing();
                            },
                            onProgressChanged: (controller, progress) {
                              if (progress == 100) {
                                pullToRefreshController.endRefreshing();
                              }
                              setState(() {
                                this.progress = progress / 100;
                                urlController.text = this.url;
                              });
                            },
                            onUpdateVisitedHistory:
                                (controller, url, androidIsReload) {
                              setState(() {
                                this.url = url.toString();
                                urlController.text = this.url;
                              });
                            },
                            onConsoleMessage: (controller, consoleMessage) {
                              print(consoleMessage);
                            },
                          ),
                          // )
                        ),

                        Container(
                            color: theme.backgroundColor,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TabBar(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.grey),
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
                                    child: Text(
                                      "Daily Ranking",
                                      style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "7 Day Ranking",
                                      style: TextStyle(
                                        fontSize: 14 * textScale,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Column(
                          children: [
                            Container(
                              color: theme.backgroundColor,
                              height: screenHeight * 0.40,
                              child: TabBarView(
                                controller: _nestedTabController,
                                children: <Widget>[
                                  ListView.builder(
                                    controller: _controller,
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
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
                                            // Navigator.of(context,rootNavigator: true)
                                            //     .push(MaterialPageRoute(builder: (context) {
                                            //   // return DetailPage(bean);
                                            //   return NftDetailsPage();
                                            // }));
                                          },
                                          child: Column(children: [
                                            Container(
                                              height: screenHeight * 0.058,
                                              color: theme.backgroundColor,
                                              child: ListTile(
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                          "Username/Pair                  Buy Price   ",
                                                          style: TextStyle(
                                                            fontSize:
                                                                11 * textScale,
                                                            color:
                                                                Colors.black38,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ))
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                      "          APR",
                                                      style: TextStyle(
                                                        fontSize:
                                                            11 * textScale,
                                                        color: Colors.black38,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                       34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                    ],
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.08)),
                                                  Text("1610.79",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize:
                                                            14 * textScale,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
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
                                            // Navigator.of(context,rootNavigator: true)
                                            //     .push(MaterialPageRoute(builder: (context) {
                                            //   // return DetailPage(bean);
                                            //   return NftDetailsPage();
                                            // }));
                                          },
                                          child: Column(children: [
                                            Container(
                                              height: screenHeight * 0.058,
                                              color: theme.backgroundColor,
                                              child: ListTile(
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                          "Username/Pair                  Buy Price   ",
                                                          style: TextStyle(
                                                            fontSize:
                                                                11 * textScale,
                                                            color:
                                                                Colors.black38,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ))
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                      "          APR",
                                                      style: TextStyle(
                                                        fontSize:
                                                            11 * textScale,
                                                        color: Colors.black38,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                       34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                          "                34.23",
                                                          style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize:
                                                                14 * textScale,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                    ],
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                          width: screenWidth *
                                                              0.08)),
                                                  Text("1610.79",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize:
                                                            14 * textScale,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ))
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
                    ))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Column(
            // verticalDirection:VerticalDirection.down ,

            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                // width: screenWidth,
                height: screenHeight * 0.075,
                color: theme.scaffoldBackgroundColor,
                child: Row(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                      ),
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.85,
                          height: screenHeight * 0.055,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: Color(0xFF1da2b4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return Tradingbotlistdetail4();
                                }));
                              },
                              child: Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]));
  }
}

class Tradingbotoptionlist4 extends StatefulWidget {
  String? token;
  String? accounttype;
  Tradingbotoptionlist4({Key? key, this.token, this.accounttype})
      : super(key: key);

  @override
  _Tradingbotoptionlist4State createState() => _Tradingbotoptionlist4State(
      token: this.token, accounttype: this.accounttype);
}

class _Tradingbotoptionlist4State extends State<Tradingbotoptionlist4> {
  String? token;
  String? accounttype;
  _Tradingbotoptionlist4State({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _Tradingbotoptionlist4Mobile(
              token: token, accounttype: accounttype),
          tablet: _Tradingbotoptionlist4Tablet(),
        ),
      ),
    );
  }
}

class _Tradingbotoptionlist4Tablet extends StatefulWidget {
  _Tradingbotoptionlist4Tablet();

  @override
  __Tradingbotoptionlist4TabletState createState() =>
      __Tradingbotoptionlist4TabletState();
}

class __Tradingbotoptionlist4TabletState
    extends State<_Tradingbotoptionlist4Tablet> with TickerProviderStateMixin {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _nestedTabController;
  List<User> _users = [];

  List<User> _foundedUsers = [];

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  final ScrollController _controller = ScrollController();
// ////////

//////////////////////////

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _nestedTabController = new TabController(length: 2, vsync: this);

    setState(() {
      _foundedUsers = _users;
    });
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
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,

        key: _scaffoldKey,

        //       leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(
        //         Icons.humb,
        //         size: 18.0,
        //       ),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),

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
                child: Text('Tradingbotoption4list1',
                    style: TextStyle(
                      fontSize: 16 * textScale,
                    ))),
          ],
        ),
      ),
      body: Main(),
      drawer: Container(
        width: screenWidth * 1.15,
        child: Drawer(
            child: Scaffold(
                backgroundColor: theme.backgroundColor,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0.5,
                  shadowColor: theme.scaffoldBackgroundColor,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: Container(
                    height: 28,
                    child: TextField(
                      // onChanged: (value) => onSearch(value),
                      decoration: InputDecoration(
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
                          hintStyle: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
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
                      color: theme.backgroundColor,
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
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .push(MaterialPageRoute(
                                                  builder: (context) {
                                            // return DetailPage(bean);
                                            return Tradingbotoptionlist();
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
                                          // Navigator.of(context, rootNavigator: true)
                                          //     .push(MaterialPageRoute(
                                          //         builder: (context) {
                                          //   // return DetailPage(bean);
                                          //   return Tradingbotoptionlist();
                                          // }));
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
                ))),
      ),
    );

    // bottomNavigationBar: CustomBottomNavBar(),
  }
}

class _Tradingbotoptionlist4Mobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _Tradingbotoptionlist4Mobile({Key? key, this.token, this.accounttype})
      : super(key: key);

  @override
  _Tradingbotoptionlist4MobileState createState() =>
      _Tradingbotoptionlist4MobileState(
          token: this.token, accounttype: this.accounttype);
}

class _Tradingbotoptionlist4MobileState
    extends State<_Tradingbotoptionlist4Mobile> with TickerProviderStateMixin {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _Tradingbotoptionlist4MobileState({this.token, this.accounttype});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String value;
  late TabController _nestedTabController;
  List<User> _users = [];

  List<User> _foundedUsers = [];

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.name.toLowerCase().contains(search))
          .toList();
    });
  }

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _nestedTabController = new TabController(length: 2, vsync: this);

    setState(() {
      _foundedUsers = _users;
    });
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
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 0.2,

        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,

        key: _scaffoldKey,

        //       leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(
        //         Icons.humb,
        //         size: 18.0,
        //       ),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),

        title: Text('Future DCA',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16 * textScale,
            )),
      ),
      body: Scaffold(
        body: Main4(token: token, accounttype: accounttype),
      ),

      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
