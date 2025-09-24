import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/paymentmethod/paymentmethod_bloc.dart';
import 'add_payment_method.dart';
import 'package:flutter/services.dart';
import 'editpaymentmethod.dart';
import 'sign_in.dart';
import 'travel_bean.dart';
// import 'create_profile.dart';

import '../widgets/responsive.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter/cupertino.dart';

class CashPaymentMethodList extends StatefulWidget {
  @override
  CashPaymentMethodListState createState() => CashPaymentMethodListState();
}

class CashPaymentMethodListState extends State<CashPaymentMethodList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: CashPaymentMethodListMobile(),
          tablet: CashPaymentMethodListTablet(),
        ),
      ),
    );
  }
}

class CashPaymentMethodListTablet extends StatefulWidget {
  @override
  CashPaymentMethodListTabletState createState() =>
      CashPaymentMethodListTabletState();
}

class CashPaymentMethodListTabletState
    extends State<CashPaymentMethodListTablet> {
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

  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   Navigator.pop(context);

  //   print("BACK BUTTON!"); // Do some stuff.
  //   return true;
  // }

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
                borderRadius: BorderRadius.circular(18.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text('CashPaymentMethodList'),
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
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return Download();
                                // }));
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
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return Download();
                                // }));
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
          elevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: Text(
            'Cash Payment Methods',
            style: TextStyle(fontSize: 14 * textScale, color: Colors.black87),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(builder: (context) {
                  return PaymentMethod();
                }));
              },
              child: const Icon(
                Icons.add_box_sharp,
                color: Colors.black87,
              ),
            )
          ],
        ),
        body: Container(
            color: theme.backgroundColor,
            child: Column(
              children: <Widget>[
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                          onTap: () {
                            // Navigator.of(context,rootNavigator: true)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return VerificationPersonal();
                            // }));
                          },
                          child: Text(
                            "Lorem ipsum",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.draw_outlined),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return EditPaymentMethod();
                          }));
                        },
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                          onTap: () {
                            // Navigator.of(context,rootNavigator: true)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return Security();
                            // }));
                          },
                          child: Text(
                            "Lorem ipsum",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.draw_outlined),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return EditPaymentMethod();
                          }));
                        },
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                          onTap: () {
                            // Navigator.of(context,rootNavigator: true)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return CashPaymentMethodList();
                            // }));
                          },
                          child: Text(
                            "Lorem ipsum",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.draw_outlined),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return EditPaymentMethod();
                          }));
                        },
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                          onTap: () {
                            // Navigator.of(context,rootNavigator: true)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return AddressList();
                            // }));
                          },
                          child: Text(
                            "Lorem ipsum",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.draw_outlined),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return EditPaymentMethod();
                          }));
                        },
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                          onTap: () {
                            // Navigator.of(context,rootNavigator: true)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return Tradingpassword();
                            // }));
                          },
                          child: Text(
                            "LangLorem ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.draw_outlined),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return EditPaymentMethod();
                          }));
                        },
                      ),
                    )),
                Container(
                    color: theme.backgroundColor,
                    height: screenHeight * 0.06,
                    // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ListTile(
                      title: InkWell(
                          onTap: () {
                            // Navigator.of(context,rootNavigator: true)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return Help();
                            // }));
                          },
                          child: Text(
                            " Lorem ipsum",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.draw_outlined),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return EditPaymentMethod();
                          }));
                        },
                      ),
                    )),
              ],
            )));
  }

  fetchSession() {}
}

class CashPaymentMethodListMobile extends StatefulWidget {
  @override
  CashPaymentMethodListMobileState createState() =>
      CashPaymentMethodListMobileState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class CashPaymentMethodListMobileState
    extends State<CashPaymentMethodListMobile> {
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

  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   Navigator.pop(context);

  //   print("BACK BUTTON!"); // Do some stuff.
  //   return true;
  // }

  void showResult(_authState) async {}

  final String _content =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';

  void _shareContent() {
    Share.share(_content);
  }

  final ScrollController _controller = ScrollController();

  _showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text('CashPaymentMethodList'),
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
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return Download();
                                // }));
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
                                // Navigator.of(context,rootNavigator: true)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return Download();
                                // }));
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
          elevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: Text(
            'Cash Payment Methods',
            style: TextStyle(fontSize: 14 * textScale, color: Colors.black87),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(builder: (context) {
                  return PaymentMethod();
                }));
              },
              child: const Icon(
                Icons.add_box_sharp,
                color: Colors.black87,
              ),
            )
          ],
        ),
        body:
            //  BlocConsumer<PaymentmethodBloc, PaymentmethodState>(
            //   listener: (context, state) {
            // TODO: implement listener
            //    if (state is SuccessPaymentmethodState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' succeess ', textScaleFactor: 1.5),
            //     ),
            //   );
            // } else if (state is ErrorPaymentmethodState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' error ', textScaleFactor: 1.5),
            //     ),
            //   );
            // }
            // },
            // builder: (context, state) {
            //   return
            Container(
                color: theme.backgroundColor,
                child: ListView.builder(
                    controller: _controller,
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.vertical,
                    // itemCount: state.paymentmethod.length,
                    padding: const EdgeInsets.all(1.0),
                    itemBuilder: (context, index) {
                      return Container(
                          color: theme.backgroundColor,
                          height: screenHeight * 0.06,
                          // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: ListTile(
                            title: InkWell(
                                onTap: () {
                                  // Navigator.of(context,rootNavigator: true)
                                  //     .push(MaterialPageRoute(builder: (context) {
                                  //   return VerificationPersonal();
                                  // }));
                                },
                                child: Text(
                                  "Lorem ipsum",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15 * textScale),
                                )),
                            trailing: IconButton(
                              padding: const EdgeInsets.all(0.0),
                              iconSize: 18,
                              icon: const Icon(Icons.draw_outlined),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return EditPaymentMethod();
                                }));
                              },
                            ),
                          ));
                    }))

        //   },
        // )
        );
  }

  fetchSession() {}
}
