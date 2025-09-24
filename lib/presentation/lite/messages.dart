import '../pro/announcements.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../businesslogic/blocs/coin/coin_bloc.dart';
import '../../businesslogic/blocs/news/news_bloc.dart';
import 'alerts.dart';
import 'sign_in.dart';
// import 'travel_bean.dart';
// import 'download2.dart';
// import 'downloads.dart';
//
import '../widgets/responsive.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
// import 'stream.dart';
import 'package:share/share.dart';
import 'package:flutter/cupertino.dart';

class Messages extends StatefulWidget {
  @override
  MessagesState createState() => MessagesState();
}

class MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: MessagesMobile(),
          tablet: MessagesTablet(),
        ),
      ),
    );
  }
}

class MessagesTablet extends StatefulWidget {
  @override
  MessagesTabletState createState() => MessagesTabletState();
}

class MessagesTabletState extends State<MessagesTablet> {
  BestTutorSite _site = BestTutorSite.javatpoint;
  bool isSwitched = false;

  String authState = "User not signed in";
  String hubEvent = "";
  String error = "";
  List<String> exceptions = [];

  @override
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // BackButtonInterceptor.remove(myInterceptor);

    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context);

    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  void showResult(_authState) async {}

  final String _content =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';

  void _shareContent() {
    Share.share(_content);
  }

  _showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text('Messages'),
                      leading: Radio(
                        value: BestTutorSite.javatpoint,
                        groupValue: _site,
                        onChanged: (value) {},
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    ListTile(
                      title: const Text('login notices'),
                      leading: Radio(
                          value: BestTutorSite.w3schools,
                          groupValue: _site,
                          onChanged: (value) {}),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    ListTile(
                      title: const Text('assets'),
                      leading: Radio(
                        value: BestTutorSite.tutorialandexample,
                        groupValue: _site,
                        onChanged: (value) {},
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Container(
                        height: 60,
                        // color: Colors.grey,

                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(' market alert '),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Messages();
                                }));
                              },
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ),
                          ],
                        )),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Container(
                        height: 60,
                        // color: Colors.grey,

                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(' market alert '),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Messages();
                                }));
                              },
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ),
                          ],
                        )),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
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
          title: Text(' Messages',
              style:
                  TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        ),
        body: Container(
            color: theme.backgroundColor,
            child: Column(
              children: <Widget>[
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.09,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(builder: (context) {
                              return Alert();
                            }));
                          },
                          child: Row(children: [
                            Text("Alert    ",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                )),
                            Expanded(child: Container()),
                            Text(
                                "                                                              22/08/2022",
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12,
                                )),
                          ])),
                      subtitle: Text(""),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.09,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(builder: (context) {
                              return Alert();
                            }));
                          },
                          child: Row(children: [
                            Text("Latest Events ",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                )),
                            Expanded(child: Container()),
                            Text(
                                "                                                22/08/2022",
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12,
                                )),
                          ])),
                      subtitle: Text(""),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.09,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(builder: (context) {
                              return Announcments();
                            }));
                          },
                          child: Row(children: [
                            Text("Annoncments",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                )),
                            Expanded(child: Container()),
                            Text(
                                "                                                22/08/2022",
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12,
                                )),
                          ])),
                      subtitle: Text(""),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                        color: Colors.black,
                      ),
                    )),
              ],
            )));
  }
}

class MessagesMobile extends StatefulWidget {
  @override
  MessagesMobileState createState() => MessagesMobileState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class MessagesMobileState extends State<MessagesMobile> {
  BestTutorSite _site = BestTutorSite.javatpoint;
  bool isSwitched = false;

  String authState = "User not signed in";
  String hubEvent = "";
  String error = "";
  List<String> exceptions = [];

  @override
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    // BackButtonInterceptor.remove(myInterceptor);

    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context);

    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  void showResult(_authState) async {}

  final String _content =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';

  void _shareContent() {
    Share.share(_content);
  }

  _showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text('Messages'),
                      leading: Radio(
                        value: BestTutorSite.javatpoint,
                        groupValue: _site,
                        onChanged: (value) {},
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    ListTile(
                      title: const Text('login notices'),
                      leading: Radio(
                          value: BestTutorSite.w3schools,
                          groupValue: _site,
                          onChanged: (value) {}),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    ListTile(
                      title: const Text('assets'),
                      leading: Radio(
                        value: BestTutorSite.tutorialandexample,
                        groupValue: _site,
                        onChanged: (value) {},
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Container(
                        height: 60,
                        // color: Colors.grey,

                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(' market alert '),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Messages();
                                }));
                              },
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ),
                          ],
                        )),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Container(
                        height: 60,
                        // color: Colors.grey,

                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(' market alert '),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Messages();
                                }));
                              },
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ),
                          ],
                        )),
                    Divider(
                      color: Colors.blueGrey[100],
                      height: 2,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
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
          title: Text(' Messages',
              style:
                  TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        ),
        body:
            //  BlocConsumer<NewsBloc, NewsState>(
            //   listener: (context, state) {
            //     // TODO: implement listener

            //   },
            //   builder: (context, state) {
            //     return
            Container(
                child:
                    //            (state is _ErrorAuthState)
                    // ?

                    // Container(
                    //     color: theme.backgroundColor,
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         // const SizedBox(height: 0.50),
                    //         Center(
                    //           child: Text(
                    //             "Network Error ",
                    //             style: TextStyle(
                    //                 fontSize: 14 * textScale,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Colors.black38),
                    //           ),
                    //         ),
                    //         Center(
                    //           child: Text(
                    //             "Please refresh the page and try again",
                    //             style: TextStyle(
                    //                 fontSize: 12 * textScale,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Colors.black38),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: screenHeight * 0.01,
                    //         ),
                    //         Row(
                    //           children: [
                    //             // const Padding(
                    //             // padding: EdgeInsets.only(
                    //             //   left: 10,
                    //             // ),
                    //             // ),
                    //             const Padding(
                    //               padding: EdgeInsets.only(
                    //                 left: 50,
                    //               ),
                    //             ),
                    //             Expanded(
                    //               child: Container(
                    //                   child: Center(
                    //                       child: SizedBox(
                    //                           width: screenWidth * 0.25,
                    //                           child: TextButton(
                    //                             style: ButtonStyle(
                    //                                 backgroundColor:
                    //                                     MaterialStateProperty
                    //                                         .all<Color>(
                    //                               const Color(0xFFf5f7fa),
                    //                             )),
                    //                             onPressed: () {
                    //                               // Navigator.of(context,
                    //                               //         rootNavigator:
                    //                               //             true)
                    //                               //     .push(MaterialPageRoute(
                    //                               //         builder:
                    //                               //             (context) {
                    //                               //   return Buy();
                    //                               // }));
                    //                             },
                    //                             child: Text(
                    //                               'Refresh',
                    //                               style: TextStyle(
                    //                                   fontSize:
                    //                                       14 * textScale,
                    //                                   fontWeight:
                    //                                       FontWeight.w600,
                    //                                   color:
                    //                                       Colors.black),
                    //                             ),
                    //                           )))),
                    //             ),
                    //             // const Padding(
                    //             //   padding: EdgeInsets.only(
                    //             //     left: 4,
                    //             //   ),
                    //             // ),

                    //             const Padding(
                    //               padding: EdgeInsets.only(
                    //                 left: 50,
                    //               ),
                    //             ),
                    //           ],
                    //         )

                    //       ],
                    //     ))

                    //
                    // :

                    Container(
                        color: theme.backgroundColor,
                        child: ListView.builder(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            // itemCount: state.memo.length,
                            padding: const EdgeInsets.all(0.0),
                            itemBuilder: (context, index) {
                              // var bean = _list[index];

                              return Container(
                                  color: theme.backgroundColor,
                                  height: screenHeight * 0.09,
                                  // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                                  child: ListTile(
                                    title: InkWell(
                                        onTap: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .push(MaterialPageRoute(
                                                  builder: (context) {
                                            return Alert();
                                          }));
                                        },
                                        child: Row(children: [
                                          const Text("Alert    ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              )),
                                          Expanded(child: Container()),
                                          Text("   22/08/2022",
                                              style: TextStyle(
                                                color: theme.hoverColor,
                                                fontSize: 12,
                                              )),
                                        ])),
                                    subtitle: Text(""),
                                    trailing: const Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ));
                            })

                        //       )
                        ))
        // ;
        //   },
        // )
        );
  }

  fetchSession() {}
}
