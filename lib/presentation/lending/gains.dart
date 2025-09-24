import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../main.dart';

class Earn extends StatefulWidget {
  const Earn({Key? key}) : super(key: key);

  @override
  _EarnState createState() => _EarnState();
}

class _EarnState extends State<Earn> with TickerProviderStateMixin {
  late TabController _nestedTabController;

  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  late String value;
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
    _nestedTabController = new TabController(length: 6, vsync: this);

    setState(() {
      _foundedUsers = _users;
    });

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
                        child: Text("Xearn",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("Simple Earn",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("ETH2.0",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("Dual Investment",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("LaunchPad",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("LaunchPool",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                  ],
                ),
              ),
            ),
          
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
                //                   fontWeight: FontWeight.w500)),
                //           Expanded(child: Container(width: screenWidth * 0.08)),
                //         ],
                //       ),

                //               ),
                // ),
             
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
                         
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      // height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                      // )
                                    ),
                                
                             
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                    ),
                                  
                                
                               
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                      // )
                                    ),
                                
                                
                              
                            
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                      // )
                                    )
                                
                            ,   
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                      // )
                                    )
                                
                             ,      Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                    Expanded(
                                      child:
                                        InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                    )),
                                      // )
                                    )
                                
                            ,],
                      )
                      // ;
                      // }),
                      )
            
           
          ],
        ));
  }
}

class Finance extends StatefulWidget {
  const Finance({Key? key}) : super(key: key);

  @override
  _FinanceState createState() => _FinanceState();
}

class _FinanceState extends State<Finance> with TickerProviderStateMixin {
  late TabController _nestedTabController;

  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  late String value;
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
    _nestedTabController = new TabController(length: 6, vsync: this);

    setState(() {
      _foundedUsers = _users;
    });

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
                        child: Text("Xearn",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("Simple Earn",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("ETH2.0",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("Dual Investment",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("LaunchPad",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("LaunchPool",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                  ],
                ),
              ),
            ),
          
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
                //                   fontWeight: FontWeight.w500)),
                //           Expanded(child: Container(width: screenWidth * 0.08)),
                //         ],
                //       ),

                //               ),
                // ),
             
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
                         
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      // height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                      // )
                                    ),
                                
                             
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                    ),
                                  
                                
                               
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                      // )
                                    ),
                                
                                
                              
                            
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                      // )
                                    )
                                
                            ,   
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                      // )
                                    )
                                
                             ,      Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                    Expanded(
                                      child:
                                        InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                    )),
                                      // )
                                    )
                                
                            ,],
                      )
                      // ;
                      // }),
                      )
            
           
          ],
        ));
  }
}


class Extra extends StatefulWidget {
  const Extra({Key? key}) : super(key: key);

  @override
  _ExtraState createState() => _ExtraState();
}

class _ExtraState extends State<Extra> with TickerProviderStateMixin {
  late TabController _nestedTabController;

  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  late String value;
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
    _nestedTabController = new TabController(length: 6, vsync: this);

    setState(() {
      _foundedUsers = _users;
    });

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
                        child: Text("Xearn",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("Simple Earn",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("ETH2.0",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("Dual Investment",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("LaunchPad",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                    Tab(
                        child: Text("LaunchPool",
                            style: TextStyle(
                              fontSize: 12 * textScale,
                              fontWeight: FontWeight.w500,
                            ))),
                  ],
                ),
              ),
            ),
          
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
                //                   fontWeight: FontWeight.w500)),
                //           Expanded(child: Container(width: screenWidth * 0.08)),
                //         ],
                //       ),

                //               ),
                // ),
             
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
                         
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      // height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                      // )
                                    ),
                                
                             
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                    ),
                                  
                                
                               
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                      // )
                                    ),
                                
                                
                              
                            
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                      // )
                                    )
                                
                            ,   
                                   Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                      InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                      ),
                                      // )
                                    )
                                
                             ,      Container(
                                      color: theme.scaffoldBackgroundColor,
                                      height: screenHeight * 0.90,
                                      width: screenWidth ,
                                      child: 
                                    Expanded(
                                      child:
                                        InAppWebView(
                                         
                                        gestureRecognizers: Set()
                                          ..add(Factory<
                                                  VerticalDragGestureRecognizer>(
                                              () =>
                                                  VerticalDragGestureRecognizer())),
                                        key: webViewKey,
                                        initialUrlRequest: URLRequest(
                                            url: Uri.parse(
                                                "https://www.tradingview.com/tradingbotoptionlist/?symbol=BITSTAMP%3ABTCUSD")),
                                        initialOptions: options,
                                        pullToRefreshController:
                                            pullToRefreshController,
                                        onWebViewCreated: (controller) {
                                          webViewController = controller;
                                        },
                                        onLoadStart: (controller, url) {
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        androidOnPermissionRequest: (controller,
                                            origin, resources) async {
                                          return PermissionRequestResponse(
                                              resources: resources,
                                              action:
                                                  PermissionRequestResponseAction
                                                      .GRANT);
                                        },
                                        shouldOverrideUrlLoading: (controller,
                                            navigationAction) async {
                                          var uri =
                                              navigationAction.request.url!;

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
                                              return NavigationActionPolicy
                                                  .CANCEL;
                                            }
                                          }

                                          return NavigationActionPolicy.ALLOW;
                                        },
                                        onLoadStop: (controller, url) async {
                                          pullToRefreshController
                                              .endRefreshing();
                                          setState(() {
                                            this.url = url.toString();
                                            urlController.text = this.url;
                                          });
                                        },
                                        onLoadError:
                                            (controller, url, code, message) {
                                          pullToRefreshController
                                              .endRefreshing();
                                        },
                                        onProgressChanged:
                                            (controller, progress) {
                                          if (progress == 100) {
                                            pullToRefreshController
                                                .endRefreshing();
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
                                        onConsoleMessage:
                                            (controller, consoleMessage) {
                                          print(consoleMessage);
                                        },
                                    )),
                                      // )
                                    )
                                
                            ,],
                      )
                      // ;
                      // }),
                      )
            
           
          ],
        ));
  }
}

class Gain extends StatefulWidget {
  Gain();

  @override
  _GainState createState() => _GainState();
}

class _GainState extends State<Gain> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _GainMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _GainTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _GainTablet extends StatefulWidget {
  _GainTablet();

  @override
  __GainTabletState createState() => __GainTabletState();
  final List<String> list = List.generate(10, (index) => "nutrinax $index");
}

class __GainTabletState extends State<_GainTablet> {
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
      length: 4,
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
                    color: theme.scaffoldBackgroundColor,
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
                  Earn(),
                  Finance(),
                  Extra(),
                ],
              ),
            )),

        // bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}

class _GainMobile extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "nutrinax $index");

  _GainMobile(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _GainMobileState createState() => _GainMobileState();
}

class _GainMobileState extends State<_GainMobile> {
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
      length: 2,
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          
          elevation: 0.2,
          bottomOpacity: 1.0,
          shadowColor: theme.scaffoldBackgroundColor,
          backgroundColor: theme.scaffoldBackgroundColor,
          toolbarHeight: 50.0,
                    // actions: [],

              // height: screenHeight * 0.080,

              // Text('search'),
           title: Column( 
             mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start, 
             children:[ 
          //  Text(
          //   'Nfts  ',
          //   style: TextStyle(color: Colors.black),
          // ),
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
                  child: Text('Earn',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
              Tab(
                  child: Text('FInance',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
              Tab(
                  child: Text('Extra',
                      style: TextStyle(
                        fontSize: 16 * textScale,
                      ))),
              Expanded(child: Container(width: screenWidth * 0.18)),
              IconButton(
                color: theme.scaffoldBackgroundColor,
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
          ),]),
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
                  Earn(),
                  Finance(),
                  Extra(),
                ],
              ),
            )),

        // bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
