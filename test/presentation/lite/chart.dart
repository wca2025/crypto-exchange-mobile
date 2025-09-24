import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import 'orders.dart';
import 'p2psell.dart';
import 'paymentmethodlist.dart';
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
    _nestedTabController = new TabController(length: 4, vsync: this);

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        toolbarHeight: 35,
        title: Row(children: [
          Icon(
            Icons.drag_handle_outlined,
            color: Colors.black,
            semanticLabel: "Drag From Left",
          ),
          Text(
            '${token}' + '/' + '${accounttype}',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ]),
        actions: [
//  Icon(Icons.ac_unit_outlined),
//             Icon(Icons.ac_unit_outlined),
//             Icon(Icons.ac_unit_outlined),

          Container(
            child: InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(builder: (context) {
                  return Order();
                }));
              },
              child: Icon(
                Icons.history_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
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
                                  "https://www.tradingview.com/chart/?symbol=BITSTAMP%3ABTCUSD")),
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
                                action: PermissionRequestResponseAction.GRANT);
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
                        child: TabBar(
                          overlayColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
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
                                "Order Book",
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Trades",
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Money Flow",
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Info",
                                style: TextStyle(
                                  fontSize: 14 * textScale,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                                        "Quantity                  Buy Price                      Sell Price",
                                                        style: TextStyle(
                                                          fontSize:
                                                              11 * textScale,
                                                          color: Colors.black38,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                                trailing: Text(
                                                    "          Quantity",
                                                    style: TextStyle(
                                                      fontSize: 11 * textScale,
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
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                       34.23",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                34.23",
                                                        style: TextStyle(
                                                          color: Colors.black38,
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
                                                      fontSize: 14 * textScale,
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
                                                        "Time                        Direction                      Price",
                                                        style: TextStyle(
                                                          fontSize:
                                                              11 * textScale,
                                                          color: Colors.black38,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                                trailing: Text(
                                                    "          Quantity",
                                                    style: TextStyle(
                                                      fontSize: 11 * textScale,
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
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                       34.23",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                34.23",
                                                        style: TextStyle(
                                                          color: Colors.black38,
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
                                                      fontSize: 14 * textScale,
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
                                          // Navigator.of(context,rootNavigator: true)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   // return DetailPage(bean);
                                          //   return NftDetailsPage();
                                          // }));
                                        },
                                        child: Column(children: []),
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
                                          // Navigator.of(context,rootNavigator: true)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   // return DetailPage(bean);
                                          //   return NftDetailsPage();
                                          // }));
                                        },
                                        child: Column(children: [
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Row(
                                              children: [
                                                Text("OP Optimism",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.08)),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Row(
                                              children: [
                                                Text("Release Date",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.08)),
                                                Text("2022-05-25",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Row(
                                              children: [
                                                Text("Market Cap",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.08)),
                                                Text("",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Row(
                                              children: [
                                                Text("Website",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.08)),
                                                Text("https://app/optimism.io",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Row(
                                              children: [
                                                Text("White Paper",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.08)),
                                                Text(
                                                    "https://community.optimism.io",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Row(
                                              children: [
                                                Text("About",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.08)),
                                                Text("",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 14 * textScale,
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
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.055,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: Color(0xFF1da2b4),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(1.0),
                            child: InkWell(
                              // onTap: _signUp,
                              child: Center(
                                child: Text(
                                  'Buy',
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
                    SizedBox(
                      width: 5.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0,
                      ),
                      child: GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.055,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: Colors.red[400],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(1.0),
                            child: InkWell(
                              // onTap: _signUp,
                              child: Center(
                                child: Text(
                                  'Sell',
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
                    SizedBox(
                      width: 5.0,
                    ),
                  ])),
        ],
      ),
    );
  }
}

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> with TickerProviderStateMixin {
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
    _nestedTabController = new TabController(length: 4, vsync: this);

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
        body: Container(
            color: theme.backgroundColor,
            height: screenHeight * 1.10,
            child: ListView(
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
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   // return DetailPage(bean);
                        //   return NftDetailsPage();
                        // }));
                      },
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text("OP (Optimism)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14 * textScale,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              // Text("2022-05-25",
                              //     style: TextStyle(
                              //       color: Colors.black38,
                              //       fontSize: 14 * textScale,
                              //       fontWeight: FontWeight.w500,
                              //     ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text("Release Date",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14 * textScale,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              Text("2022-05-25",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text("Market Cap",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14 * textScale,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              Text("",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text("Website",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14 * textScale,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              Text("https://app/optimism.io",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text("White Paper",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14 * textScale,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              Text("https://community.optimism.io",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14 * textScale,
                                    fontWeight: FontWeight.w500,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text("About",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14 * textScale,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 1.0)),
                              Text("",
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
                  ),
                  Container(
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
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text("About",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16 * textScale,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text("Release Date",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 14 * textScale,
                                      fontWeight: FontWeight.w500)),
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text("Learn More",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 16 * textScale,
                                      fontWeight: FontWeight.w500)),
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text("Official White Paper",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 14 * textScale,
                                      fontWeight: FontWeight.w500)),
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              Text("https://app/optimism.io",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 14 * textScale,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text("White Paper",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 14 * textScale,
                                      fontWeight: FontWeight.w500)),
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                              Text("https://community.optimism.io",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 14 * textScale,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text("Github",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 14 * textScale,
                                      fontWeight: FontWeight.w500)),
                              Expanded(
                                  child: Container(width: screenWidth * 0.08)),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  )
                ]
                // },
                )));
  }
}

class ChartTrade extends StatefulWidget {
  const ChartTrade({Key? key}) : super(key: key);

  @override
  _ChartTradeState createState() => _ChartTradeState();
}

class _ChartTradeState extends State<ChartTrade> with TickerProviderStateMixin {
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
    _nestedTabController = new TabController(length: 4, vsync: this);

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
      body: Container(
          color: theme.backgroundColor,
          height: screenHeight * 1.10,
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
                                                Text('Spots ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 135.0)),
                                              ]),
                                            ),
                                            Divider(
                                              color: Colors.blueGrey[100],
                                              height: 2,
                                              thickness: 1,
                                              indent: 0,
                                              endIndent: 0,
                                            ),
                                            ListTile(
                                              title: Row(children: [
                                                Text('BTC/USD ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left:
                                                            screenWidth * 0.1)),
                                                Text('32.52 ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 50.0)),
                                              ]),
                                              trailing: Text('56.12 ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
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
                                                Text('Margins ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 135.0)),
                                              ]),
                                            ),
                                            Divider(
                                              color: Colors.blueGrey[100],
                                              height: 2,
                                              thickness: 1,
                                              indent: 0,
                                              endIndent: 0,
                                            ),
                                            ListTile(
                                              title: Row(children: [
                                                Text('BTC/USD ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left:
                                                            screenWidth * 0.1)),
                                                Text('32.52 ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 65.0)),
                                              ]),
                                              trailing: Text('56.12 ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
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
                                                Text('Futures ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 135.0)),
                                              ]),
                                            ),
                                            Divider(
                                              color: Colors.blueGrey[100],
                                              height: 2,
                                              thickness: 1,
                                              indent: 0,
                                              endIndent: 0,
                                            ),
                                            ListTile(
                                              title: Row(children: [
                                                Text('BTC/USD ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left:
                                                            screenWidth * 0.1)),
                                                Text('32.52 ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 65.0)),
                                              ]),
                                              trailing: Text('56.12 ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
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
                                                  Text('Earns ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 135.0)),
                                                ]),
                                              ),
                                              Divider(
                                                color: Colors.blueGrey[100],
                                                height: 2,
                                                thickness: 1,
                                                indent: 0,
                                                endIndent: 0,
                                              ),
                                              ListTile(
                                                title: Row(children: [
                                                  Text('BTC/USD ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: screenWidth *
                                                              0.1)),
                                                  Text('32.52 ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 65.0)),
                                                ]),
                                                trailing: Text('56.12 ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
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

class Chart extends StatefulWidget {
  String? token;
  String? accounttype;
  Chart({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _ChartState createState() =>
      _ChartState(token: this.token, accounttype: this.accounttype);
}

class _ChartState extends State<Chart> {
  String? token;
  String? accounttype;
  _ChartState({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _ChartMobile(token: token, accounttype: accounttype),
          tablet: _ChartTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _ChartTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _ChartTablet(

      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __ChartTabletState createState() => __ChartTabletState();
}

class __ChartTabletState extends State<_ChartTablet>
    with TickerProviderStateMixin {
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

    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                  child: Text('Chart',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
              Tab(
                  child: Text('Overview',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
              Tab(
                  child: Text('Trade',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
            ],
          ),
        ),
        body: Scaffold(
          body: TabBarView(
            children: <Widget>[
              Main(),
              Overview(),
              ChartTrade(),
            ],
          ),
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
                                                return Chart();
                                              }));
                                            },
                                            title: Row(
                                              children: [
                                                Text("ETH",
                                                    style: TextStyle(
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.08)),
                                                Text("1610.79",
                                                    style: TextStyle(
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                        width: screenWidth *
                                                            0.08)),
                                                Text("1.7575",
                                                    style: TextStyle(
                                                      fontSize: 11 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                              //   return Chart();
                                              // }));
                                            },
                                            title: Row(
                                              children: [
                                                Text("USD",
                                                    style: TextStyle(
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                Expanded(
                                                    child: Container(
                                                        width: screenWidth *
                                                            0.08)),
                                                Text("1610.79",
                                                    style: TextStyle(
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                        width: screenWidth *
                                                            0.08)),
                                                Text("1.7575",
                                                    style: TextStyle(
                                                      fontSize: 11 * textScale,
                                                      fontWeight:
                                                          FontWeight.w500,
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
        ),

        // bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}

class _ChartMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _ChartMobile({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _ChartMobileState createState() =>
      _ChartMobileState(token: this.token, accounttype: this.accounttype);
}

class _ChartMobileState extends State<_ChartMobile>
    with TickerProviderStateMixin {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _ChartMobileState({this.token, this.accounttype});

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

    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                  child: Text('Chart',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
              Tab(
                  child: Text('Overview',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
              Tab(
                  child: Text('Trade',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
            ],
          ),
        ),
        body: Scaffold(
          body: TabBarView(
            children: <Widget>[
              Main(token: token, accounttype: accounttype),
              Overview(),
              ChartTrade(),
            ],
          ),
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
                              padding: const EdgeInsets.only(left: 95),
                              child: Align(
                                alignment: Alignment.topLeft,
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
                        child: _foundedUsers.length > 0
                            ? TabBarView(
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
                                        var bean = _list[index];
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
                                                    Text("lorem"),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.08)),
                                                    Text("lorem")
                                                  ],
                                                ),
                                                subtitle: Row(
                                                  children: [
                                                    Text("lorem",
                                                        style: TextStyle(
                                                          fontSize:
                                                              12 * textScale,
                                                        )),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.08)),
                                                    Text("lorem",
                                                        style: TextStyle(
                                                          fontSize:
                                                              11 * textScale,
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
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              14 * textScale,
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
                                          parent:
                                              AlwaysScrollableScrollPhysics()),
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
                                                            width: screenWidth *
                                                                0.08)),
                                                    Text("lorem")
                                                  ],
                                                ),
                                                subtitle: Row(
                                                  children: [
                                                    Text("lorem",
                                                        style: TextStyle(
                                                          fontSize:
                                                              12 * textScale,
                                                        )),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.08)),
                                                    Text("lorem",
                                                        style: TextStyle(
                                                          fontSize:
                                                              11 * textScale,
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
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              14 * textScale,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                        );
                                      },
                                    ),
                                  ])
                            : Center(
                                child: Text(
                                "No data",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14 * textScale),
                              )),
                      ),
                    ))),
          ),
        ),

        // bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
