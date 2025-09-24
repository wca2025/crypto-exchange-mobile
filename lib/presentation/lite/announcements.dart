import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/coin/coin_bloc.dart';
import 'confirmorder.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

class Announcments extends StatefulWidget {
  Announcments();

  @override
  _AnnouncmentsState createState() => _AnnouncmentsState();
}

class _AnnouncmentsState extends State<Announcments> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _AnnouncmentsMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _AnnouncmentsTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _AnnouncmentsTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _AnnouncmentsTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __AnnouncmentsTabletState createState() => __AnnouncmentsTabletState();
}

class __AnnouncmentsTabletState extends State<_AnnouncmentsTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  static const genderOptions = ['1', '2', '3'];
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  @override
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Padding(
        padding: EdgeInsets.only(right: 270),
        child: Text(
          item,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
      ));

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
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
    final ScrollController _controller = ScrollController();

    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: screenHeight * 0.08,
          elevation: 0.2,
          automaticallyImplyLeading: false,
          title: Text("Announcements",
              style: TextStyle(fontSize: 14 * textScale, color: Colors.black)),
          backgroundColor: theme.scaffoldBackgroundColor,
        ),
        body: DefaultTabController(
            length: 4,
            child: Container(
                color: theme.backgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      color: theme.scaffoldBackgroundColor,

                      // child: const Align(
                      //   alignment: Alignment.centerRight,
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: TabBar(
                                    overlayColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.grey),
                                    indicatorColor: Colors.white,
                                    labelColor: Colors.black87,
                                    automaticIndicatorColorAdjustment: true,
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    isScrollable: true,
                                    unselectedLabelColor: Colors.grey,
                                    tabs: <Widget>[
                                      Tab(
                                        child: Text('All',
                                            style: TextStyle(
                                                fontSize: 14 * textScale)),
                                      ),
                                      Tab(
                                        child: Text('Newlistings',
                                            style: TextStyle(
                                                fontSize: 14 * textScale)),
                                      ),
                                      Tab(
                                        child: Text('Lastest activities',
                                            style: TextStyle(
                                                fontSize: 14 * textScale)),
                                      ),
                                      Tab(
                                        child: Text('Product Upadtes',
                                            style: TextStyle(
                                                fontSize: 14 * textScale)),
                                      ),
                                    ],
                                  )),
                            ]),
                      ),
                      // ),
                    ),
                    Expanded(
                        child: Container(
                            child: TabBarView(
                      children: [
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
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context,rootNavigator: true)
                                    //     .push(MaterialPageRoute(builder: (context) {
                                    //   // return DetailPage(bean);
                                    //   return NftDetailsPage();
                                    // }));
                                  },
                                  child: Column(children: [
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(' News Headline'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text(
                                          '22/08/22',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                  ]),
                                ),
                              )
                            ]
                            // },
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
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context,rootNavigator: true)
                                    //     .push(MaterialPageRoute(builder: (context) {
                                    //   // return DetailPage(bean);
                                    //   return NftDetailsPage();
                                    // }));
                                  },
                                  child: Column(children: [
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(' News Headline'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text(
                                          '22/08/22',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                  ]),
                                ),
                              )
                            ]
                            // },
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
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context,rootNavigator: true)
                                    //     .push(MaterialPageRoute(builder: (context) {
                                    //   // return DetailPage(bean);
                                    //   return NftDetailsPage();
                                    // }));
                                  },
                                  child: Column(children: [
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(' News Headline'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text(
                                          '22/08/22',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                  ]),
                                ),
                              )
                            ]
                            // },
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
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context,rootNavigator: true)
                                    //     .push(MaterialPageRoute(builder: (context) {
                                    //   // return DetailPage(bean);
                                    //   return NftDetailsPage();
                                    // }));
                                  },
                                  child: Column(children: [
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(' News Headline'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text(
                                          '22/08/22',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                    ListTile(
                                      isThreeLine: true,
                                      title: Row(children: [
                                        Text(
                                          ' News Headline',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15 * textScale),
                                        ),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                      subtitle: Row(children: [
                                        Text('22/08/22'),

                                        // Padding(padding: EdgeInsets.only(left: 237.0)),
                                      ]),
                                    ),
                                  ]),
                                ),
                              )
                            ]
                            // },
                            ),
                      ],
                    ))),
                  ],
                ))));
  }
}

class _AnnouncmentsMobile extends StatefulWidget {
  // final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _AnnouncmentsMobile(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _AnnouncmentsMobileState createState() => _AnnouncmentsMobileState();
}

class _AnnouncmentsMobileState extends State<_AnnouncmentsMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  static const genderOptions = ['1', '2', '3'];
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  @override
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Padding(
        padding: EdgeInsets.only(right: 270),
        child: Text(
          item,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
      ));

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
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
    final ScrollController _controller = ScrollController();

    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: screenHeight * 0.08,
          elevation: 0.2,
          automaticallyImplyLeading: false,
          title: Text("Announcements",
              style: TextStyle(fontSize: 14 * textScale, color: Colors.black)),
          backgroundColor: theme.scaffoldBackgroundColor,
        ),
        body:
            //  BlocConsumer<CoinBloc,  CoinState>(
            //   listener: (context, state) {
            //     // TODO: implement listener

            //   },
            // builder: (context, state) {
            //         if (state is _InitialNewsState) {
            //   context.read<NewsBloc>().add(const FetchNews());
            // }

            //  if (state is _InitialNewState) {
            //  return
            DefaultTabController(
                length: 4,
                child: Container(
                    color: theme.backgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          color: theme.scaffoldBackgroundColor,

                          // child: const Align(
                          //   alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: TabBar(
                                        overlayColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.grey),
                                        indicatorColor: Colors.white,
                                        labelColor: Colors.black87,
                                        automaticIndicatorColorAdjustment: true,
                                        physics: const BouncingScrollPhysics(
                                            parent:
                                                AlwaysScrollableScrollPhysics()),
                                        isScrollable: true,
                                        unselectedLabelColor: Colors.grey,
                                        tabs: <Widget>[
                                          Tab(
                                            child: Text('All',
                                                style: TextStyle(
                                                    fontSize: 14 * textScale)),
                                          ),
                                          Tab(
                                            child: Text('Newlistings',
                                                style: TextStyle(
                                                    fontSize: 14 * textScale)),
                                          ),
                                          Tab(
                                            child: Text('Lastest activities',
                                                style: TextStyle(
                                                    fontSize: 14 * textScale)),
                                          ),
                                          Tab(
                                            child: Text('Product Upadtes',
                                                style: TextStyle(
                                                    fontSize: 14 * textScale)),
                                          ),
                                        ],
                                      )),
                                ]),
                          ),
                          // ),
                        ),
                        Expanded(
                            child: Container(
                                child: TabBarView(
                          children: [
                            ListView.builder(
                              controller: _controller,
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              scrollDirection: Axis.vertical,
                              // itemCount: state.news.length,
                              padding: const EdgeInsets.all(1.0),
                              itemBuilder: (context, index) {
                                return Container(
                                  color: Colors.white70,
                                  // width: screenWidth * 0.880,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Column(children: [
                                      ListTile(
                                        isThreeLine: true,
                                        title: Row(children: [
                                          Text(
                                            ' News Headline',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15 * textScale),
                                          ),

                                          // Padding(padding: EdgeInsets.only(left: 237.0)),
                                        ]),
                                        subtitle: Row(children: [
                                          Text('22/08/22'),

                                          // Padding(padding: EdgeInsets.only(left: 237.0)),
                                        ]),
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
                              // itemCount: state.news.length,

                              padding: const EdgeInsets.all(1.0),
                              itemBuilder: (context, index) {
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
                                      ListTile(
                                        isThreeLine: true,
                                        title: Row(children: [
                                          Text(
                                            ' News Headline',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15 * textScale),
                                          ),

                                          // Padding(padding: EdgeInsets.only(left: 237.0)),
                                        ]),
                                        subtitle: Row(children: [
                                          Text('22/08/22'),

                                          // Padding(padding: EdgeInsets.only(left: 237.0)),
                                        ]),
                                      ),
                                    ]),
                                  ),
                                );
                              },
                            ),
                          ],
                        ))),
                      ],
                    )))
        // }
        //   },
        // )
        );
  }
}
