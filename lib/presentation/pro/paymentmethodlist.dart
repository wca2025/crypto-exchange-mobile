import 'add_payment_method.dart';
import 'package:flutter/services.dart';
import 'cash_paymentmethodlist.dart';
import 'p2p_paymentmethodlist.dart';
import 'editpaymentmethod.dart';
import 'sign_in.dart';
import 'travel_bean.dart';
// import 'create_profile.dart';

import '../widgets/responsive.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter/cupertino.dart';

class PaymentMethodList extends StatefulWidget {
  @override
  PaymentMethodListState createState() => PaymentMethodListState();
}

class PaymentMethodListState extends State<PaymentMethodList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: PaymentMethodListMobile(),
          tablet: PaymentMethodListTablet(),
        ),
      ),
    );
  }
}

class PaymentMethodListTablet extends StatefulWidget {
  @override
  PaymentMethodListTabletState createState() => PaymentMethodListTabletState();
}

class PaymentMethodListTabletState extends State<PaymentMethodListTablet> {
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
                      title: const Text('PaymentMethodList'),
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
            ' PaymentMethods',
            style: TextStyle(fontSize: 14 * textScale, color: Colors.black87),
          ),
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
                          "P2P Settings",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15 * textScale),
                        ),
                      ),
                      subtitle: Text(
                          "Trade crypto instantly through our peer to peer exchamge"),
                    )),
                SizedBox(height: screenHeight * 0.02),
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
                            "P2P Payment Methods",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.keyboard_arrow_right),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return P2PPaymentMethodList();
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
                            "P2P Help Center",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.keyboard_arrow_right),
                        onPressed: () {
                          // Navigator.of(context,rootNavigator: true)
                          //     .push(MaterialPageRoute(builder: (context) {
                          //   return EditPaymentMethod();
                          // }));
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
                            //   return PaymentMethodList();
                            // }));
                          },
                          child: Text(
                            "User Center",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.keyboard_arrow_right),
                        onPressed: () {
                          // Navigator.of(context,rootNavigator: true)
                          //     .push(MaterialPageRoute(builder: (context) {
                          //   return EditPaymentMethod();
                          // }));
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
                          //   return VerificationPersonal();
                          // }));
                        },
                        child: Text(
                          "Cash Settings",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15 * textScale),
                        ),
                      ),
                      subtitle: Text("Manage your cash payment methods"),
                    )),
                SizedBox(height: screenHeight * 0.02),
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
                            " Cash Payment Methods",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.keyboard_arrow_right),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return CashPaymentMethodList();
                          }));
                        },
                      ),
                    )),
              ],
            )));
  }
}

class PaymentMethodListMobile extends StatefulWidget {
  @override
  PaymentMethodListMobileState createState() => PaymentMethodListMobileState();
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class PaymentMethodListMobileState extends State<PaymentMethodListMobile> {
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
                      title: const Text('PaymentMethodList'),
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
            ' PaymentMethods',
            style: TextStyle(fontSize: 14 * textScale, color: Colors.black87),
          ),
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
                          "P2P Settings",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15 * textScale),
                        ),
                      ),
                      subtitle: Text(
                          "Trade crypto instantly through our peer to peer exchamge"),
                    )),
                SizedBox(height: screenHeight * 0.02),
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
                            "P2P Payment Methods",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.keyboard_arrow_right),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return P2PPaymentMethodList();
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
                            "P2P Help Center",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.keyboard_arrow_right),
                        onPressed: () {
                          // Navigator.of(context,rootNavigator: true)
                          //     .push(MaterialPageRoute(builder: (context) {
                          //   return EditPaymentMethod();
                          // }));
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
                            //   return PaymentMethodList();
                            // }));
                          },
                          child: Text(
                            "User Center",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.keyboard_arrow_right),
                        onPressed: () {
                          // Navigator.of(context,rootNavigator: true)
                          //     .push(MaterialPageRoute(builder: (context) {
                          //   return EditPaymentMethod();
                          // }));
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
                          //   return VerificationPersonal();
                          // }));
                        },
                        child: Text(
                          "Cash Settings",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15 * textScale),
                        ),
                      ),
                      subtitle: Text("Manage your cash payment methods"),
                    )),
                SizedBox(height: screenHeight * 0.02),
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
                            " Cash Payment Methods",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15 * textScale),
                          )),
                      trailing: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(Icons.keyboard_arrow_right),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            return CashPaymentMethodList();
                          }));
                        },
                      ),
                    )),
              ],
            )));
  }


}
