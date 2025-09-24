import 'dart:ui';
import 'convert.dart';
import 'deposit.dart';

import 'tokendetail.dart';
import 'transfer.dart';
import 'travel_bean.dart';
import 'withdraw.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'coustom_bottom_nav_bar.dart';
import 'orderdetails.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';

import '../../main.dart';

class Devicemanagement extends StatefulWidget {
  Devicemanagement();

  @override
  _DevicemanagementState createState() => _DevicemanagementState();
}

class _DevicemanagementState extends State<Devicemanagement> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _DevicemanagementMobile(),
          tablet: _DevicemanagementTablet(),
        ),
      ),
    );
  }
}



class _DevicemanagementTablet extends StatefulWidget {
  const _DevicemanagementTablet({Key? key}) : super(key: key);

  @override
  _DevicemanagementTabletState createState() =>_DevicemanagementTabletState();
}

class _DevicemanagementTabletState extends State<_DevicemanagementTablet>
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

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    List<TravelBean> _list = TravelBean.generateMostPopularBean();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          ' Device Managememt',
          style: TextStyle(fontSize: 14 * textScale, color: Colors.black87),
        ),
      ),
      body: Container(
        color: theme.backgroundColor,
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
                        height: screenHeight * 1.15,
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
                                child: Expanded(child:Container(
                                  // width: screenWidth * 1.2,
                                  // color: theme.backgroundColor,
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
                                            Text('Sumsung Note 10 GN 1233',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 105.0)),
                                          ]),
                                        ),
                                        Divider(
                                          color: Colors.blueGrey[100],
                                          height: 2,
                                          thickness: 1,
                                          indent: 0,
                                          endIndent: 0,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Location:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Time:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "IP Address:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 12),
                                child:  Expanded(child:Container(
                                  // width: screenWidth * 1.2,
                                  // color: theme.backgroundColor,
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
                                            Text('Xiaomi pro 9',
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
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Location:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Time:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "IP Address:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 12),
                                child: Expanded(child:Container(
                                  // width: screenWidth * 1.2,
                                  // color: theme.backgroundColor,
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
                                            Text('Nokia ',
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
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Available Balance ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  ":0.00 USD",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  ":0.0000 BTC",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 12),
                                child: Expanded(child:Container(
                                  // width: screenWidth * 1.2,
                                  // color: theme.backgroundColor,
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
                                            Text('IPhone 13',
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
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Location:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Time:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "IP Address:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),),
                              ),
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
        ),
      ),
    );
  }
}


class _DevicemanagementMobile extends StatefulWidget {
  const _DevicemanagementMobile({Key? key}) : super(key: key);

  @override
  _DevicemanagementMobileState createState() =>_DevicemanagementMobileState();
}

class _DevicemanagementMobileState extends State<_DevicemanagementMobile>
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

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    List<TravelBean> _list = TravelBean.generateMostPopularBean();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          ' Device Managememt',
          style: TextStyle(fontSize: 14 * textScale, color: Colors.black87),
        ),
      ),
      body: Container(
        color: theme.backgroundColor,
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
                        height: screenHeight * 1.15,
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
                                child:Expanded(child:  Container(
                                  // width: screenWidth * 1.2,
                                  // color: theme.backgroundColor,
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
                                            Text('Sumsung Note 10 GN 1233',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 105.0)),
                                          ]),
                                        ),
                                        Divider(
                                          color: Colors.blueGrey[100],
                                          height: 2,
                                          thickness: 1,
                                          indent: 0,
                                          endIndent: 0,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Location:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Time:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "IP Address:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 12),
                                child: Expanded(child:Container(
                                  // width: screenWidth * 1.2,
                                  // color: theme.backgroundColor,
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
                                            Text('Xiaomi pro 9',
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
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Location:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Time:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "IP Address:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 12),
                                child:Expanded(child: Container(
                                  width: screenWidth * 1.2,
                                  // color: theme.backgroundColor,
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
                                            Text('Nokia ',
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
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Available Balance ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  ":0.00 USD",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  ":0.0000 BTC",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 12),
                           child:  Expanded(child:Container(
                                  width: screenWidth * 1.2,
                                  // color: theme.backgroundColor,
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
                                            Text('IPhone 13',
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
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Location:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Time:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "IP Address:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 1,
                                                    left: 12,
                                                    right: 12),
                                                child: Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.65)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),),
                              ),
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
        ),
      ),
    );
  }
}
