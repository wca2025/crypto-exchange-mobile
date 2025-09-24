import 'package:cx/presentation/lending/show_app.dart';
// import 'package:cx/presentation/lite/splash_screen_main.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cx/presentation/lite/splash_screen.dart';
import 'Feerates.dart';
import 'help.dart';
import 'orders.dart';
import 'paymentmethodlist.dart';
import 'referals.dart';
import 'rewardcenter.dart';
import 'security.dart';
import 'settings.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
import 'sign_up.dart';
import 'themes.dart';
import 'verificationpersonal.dart';

class NestedTabBar2 extends StatefulWidget {
  const NestedTabBar2({Key? key}) : super(key: key);

  @override
  _NestedTabBar2State createState() => _NestedTabBar2State();
}

class _NestedTabBar2State extends State<NestedTabBar2>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;
  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 1, vsync: this);
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

    return Container(
        color: theme.backgroundColor,
        child: Column(
          children: <Widget>[
            // Container(
            //       color: theme.backgroundColor,
            //       height: screenHeight * 0.06,
            //       // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            //       child: ListTile(
            //         title: InkWell(
            //           onTap: () {
            //             // Navigator.of(context, rootNavigator: true).push(
            //             //     MaterialPageRoute(
            //             //         builder: (context) => SplashScreen(),
            //             //         maintainState: true));

            //           },
            //           child: Text("Lite",
            //               style: TextStyle(
            //                 fontWeight: FontWeight.w500,
            //                 fontSize: 15 * textScale,
            //               )),
            //         ),
            //         leading: Icon(
            //           Icons.build,
            //           color: Colors.black,
            //         ),
            //         trailing: const Icon(
            //           Icons.keyboard_arrow_right,
            //           size: 20,
            //           color: Colors.black,
            //         ),
            //       )),
            Container(
                color: theme.backgroundColor,
                height: screenHeight * 0.06,
                // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => Settings(),
                              maintainState: true));
                      //              PersistentNavBarNavigator.pushNewScreen(
                      // context,
                      // screen: Settings(),
                      // withNavBar: false, // OPTIONAL VALUE. True by default.
                      // pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    },
                    child: Text("Settings",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15 * textScale,
                        )),
                  ),
                  leading: Icon(
                    Icons.build_outlined,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                )),
            //  (state is AuthAuthenticatedState)
            // ?
            Container(
                color: theme.backgroundColor,
                height: screenHeight * 0.06,
                // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => Security(),
                              maintainState: false));
                    },
                    child: Text("Security",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15 * textScale,
                        )),
                  ),
                  leading: Icon(
                    Icons.vpn_key_outlined,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                    color: Colors.black,
                  ),
                )),

// :Container()

            //  (state is AuthAuthenticatedState)
            // ?
            Container(
                color: theme.backgroundColor,
                height: screenHeight * 0.06,
                // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => VerificationPersonal(),
                              maintainState: true));
                    },
                    child: Text("Identity Verification",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15 * textScale)),
                  ),
                  leading: Icon(
                    Icons.verified_user_outlined,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                    color: Colors.black,
                  ),
                )),

            //     : Container()
            // (state is AuthAuthenticatedState)
            //                 ?
            Container(
                color: theme.backgroundColor,
                height: screenHeight * 0.06,
                // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Order();
                      }));
                    },
                    child: Text("History",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15 * textScale)),
                  ),
                  leading: Icon(
                    Icons.theaters_outlined,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 18,
                    color: Colors.black,
                  ),
                )),
// :Container(),

            Container(
                color: theme.backgroundColor,
                height: screenHeight * 0.06,
                // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return FeeRates();
                      }));
                    },
                    child: Text("Fee Rates",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15 * textScale)),
                  ),
                  leading: Icon(
                    Icons.account_balance_outlined,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 18,
                    color: Colors.black,
                  ),
                )),
            //  (state is AuthAuthenticatedState)
            // ?
            Container(
                color: theme.backgroundColor,
                height: screenHeight * 0.06,
                // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return PaymentMethodList();
                      }));
                    },
                    child: Text("Payment Method",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15 * textScale)),
                  ),
                  leading: Icon(
                    Icons.credit_card_outlined,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 18,
                    color: Colors.black,
                  ),
                )),
// :Container()

            Container(
                color: theme.backgroundColor,
                height: screenHeight * 0.06,
                // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return RewardCenter();
                      }));
                    },
                    child: Text("Reward Center",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15 * textScale)),
                  ),
                  leading: Icon(
                    Icons.fact_check_outlined,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 18,
                    color: Colors.black,
                  ),
                )),

            Container(
                color: theme.backgroundColor,
                height: screenHeight * 0.06,
                // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Referals();
                      }));
                    },
                    child: Text("Referals",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15 * textScale)),
                  ),
                  leading: Icon(
                    Icons.link_outlined,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 18,
                    color: Colors.black,
                  ),
                )),

            Container(
                color: theme.backgroundColor,
                height: screenHeight * 0.06,
                // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Help();
                      }));
                    },
                    child: Text("Help & Support",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15 * textScale,
                        )),
                  ),
                  leading: Icon(
                    Icons.help_outline_outlined,
                    color: Colors.black,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                    color: Colors.black,
                  ),
                )),

            Container(
                color: theme.backgroundColor,
                height: screenHeight * 0.06,
                // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListTile(
                  title: Text("Share the App",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15 * textScale,
                      )),
                  leading: Icon(
                    Icons.share_outlined,
                    color: Colors.black,
                  ),
                )),
            Divider(
              color: Colors.blueGrey[100],
              height: 2,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            //  (state is AuthAuthenticatedState)
            // ?
            Container(
                color: theme.backgroundColor,
                height: screenHeight * 0.06,
                // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListTile(
                  title: Text("Logout",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15 * textScale,
                      )),
                  leading: Icon(
                    Icons.logout_outlined,
                    color: Colors.black,
                  ),
                ))
            // :
            // Container()
            ,

            Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.10,
            ),
            Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.12,
            ),
          ],
        ));
  }
}

class Drawerr extends StatefulWidget {
  @override
  _DrawerrState createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  // Function showResult;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _DrawerrMobile(),
          tablet: _DrawerrTablet(),
        ),
      ),
    );
  }
}

class _DrawerrTablet extends StatefulWidget {
  _DrawerrTablet();

  @override
  __DrawerrState createState() => __DrawerrState();
}

class __DrawerrState extends State<_DrawerrTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,

      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: 0.2,
      //   bottomOpacity: 1.0,
      //   shadowColor: theme.scaffoldBackgroundColor,
      //   backgroundColor: theme.scaffoldBackgroundColor,
      //   title: Text("Drawerr",
      //       style: TextStyle(fontSize: 14, color: Colors.black87)),
      // ),
      //
      body: Container(
        color: theme.backgroundColor,
        width: screenWidth * 2.0,
        child: Drawer(
            child: Column(children: [
          Expanded(
            child: Container(
              color: theme.backgroundColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    padding: EdgeInsets.only(bottom: 0.0, top: 0.0),
                    margin: EdgeInsets.only(bottom: 0.0, top: 0.0),
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                    ),
                    child: Column(
                      verticalDirection: VerticalDirection.down,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            verticalDirection: VerticalDirection.down,
                            children: [
                              const Padding(
                                  padding: EdgeInsets.only(left: 10.0)),
                              Container(
                                height: screenHeight * 0.080,
                                alignment: Alignment.topLeft,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child:
                                      const Icon(Icons.close_rounded, size: 30),
                                ),
                              ),
                              Expanded(
                                  child: Container(width: screenWidth * 0.65)),
                              IconButton(
                                icon: const Icon(Icons.brightness_4_rounded),
                                onPressed: () {
                                  currentTheme.toggleTheme();
                                },
                              ),
                            ]),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.0, left: 10.0),
                              child: Icon(
                                Icons.person_pin,
                                color: Colors.black,
                                size: 45.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0.0, top: 10.0),
                              child: InkWell(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 0, top: 0.0)),
                                        Text(
                                          "Welcome to cx",
                                          style: TextStyle(
                                              fontSize: 24.0 * textScale,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(
                                              context,
                                              rootNavigator: true,
                                            ).push(MaterialPageRoute(
                                                builder: (context) {
                                              // return DetailPage(bean);
                                              return SignIn();
                                            }));
                                          },
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                fontSize: 16.0 * textScale,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.010,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(
                                              context,
                                              rootNavigator: true,
                                            ).push(MaterialPageRoute(
                                                builder: (context) {
                                              // return DetailPage(bean);
                                              return SignUp();
                                            }));
                                          },
                                          child: Text(
                                            "or Register",
                                            style: TextStyle(
                                                fontSize: 16.0 * textScale,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 0.0, top: 0.0)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // InkWell(
                            //   child: Text(
                            //     "unverified",
                            //     style: TextStyle(
                            //         fontSize: 12 * textScale,
                            //         color: theme.backgroundColor),
                            //   ),
                            //   onTap: () {
                            //     Navigator.of(context,rootNavigator: true)
                            //         .push(MaterialPageRoute(builder: (context) {
                            //       // return DetailPage(bean);
                            //       return VerificationPersonal();
                            //     }));
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  NestedTabBar2()
                ],
              ),
            ),
          ),
        ])),
      ),
    );
  }
}

class _DrawerrMobile extends StatefulWidget {
  _DrawerrMobile();

  @override
  _DrawerrMobileState createState() => _DrawerrMobileState();
}

class _DrawerrMobileState extends State<_DrawerrMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,

      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: 0.2,
      //   bottomOpacity: 1.0,
      //   shadowColor: theme.scaffoldBackgroundColor,
      //   backgroundColor: theme.scaffoldBackgroundColor,
      //   title: Text("Drawerr",
      //       style: TextStyle(fontSize: 14, color: Colors.black87)),
      // ),
      //
      body: Container(
        color: theme.backgroundColor,
        width: screenWidth * 1.15,
        child: Drawer(
          child: Container(
            color: theme.backgroundColor,
            width: screenWidth * 1.15,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  padding: EdgeInsets.only(bottom: 0.0, top: 0.0),
                  margin: EdgeInsets.only(bottom: 0.0, top: 0.0),
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                  ),
                  child: Column(
                    verticalDirection: VerticalDirection.down,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(verticalDirection: VerticalDirection.up, children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 0),
                          child: Container(
                            // height: screenHeight * 0.080,
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.close_rounded, size: 30),
                            ),
                          ),
                        ),
                        Expanded(child: Container(width: screenWidth * 0.65)),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.brightness_4_rounded),
                            onPressed: () {
                              // currentTheme.toggleTheme();
                            },
                          ),
                        ),
                      ]),
                      Row(
                        children: [
                          Column(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 5.0, left: 10.0, bottom: 22),
                              child: Icon(
                                Icons.person_pin,
                                color: Colors.black,
                                size: 45.0,
                              ),
                            ),
                            Container(
                                color: theme.canvasColor,
                                height: screenHeight * 0.05,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true,
                                               )
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return SignIn();
                                        }));
                                      },
                                      child: Text(
                                        "     Lite    ",
                                        style: TextStyle(
                                            fontSize: 16.0 * textScale,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                )),
                          ]),

                          //             (state is AuthAuthenticatedState)
                          // ?

                          // Padding(
                          //   padding: EdgeInsets.only(left: 0.0, top: 10.0,right: 4),
                          //   child: InkWell(
                          //     child: Column(
                          //       children: [

                          //         Row(
                          //           children: [
                          //             Padding(
                          //                 padding: EdgeInsets.only(
                          //                     left: 8.0, top: 0.0)),
                          //             Text(
                          //               "Hi gbkedem@gmail.com",
                          //               style: TextStyle(
                          //                  overflow:  TextOverflow.ellipsis,
                          //                   fontSize: 24.0 * textScale,
                          //                   color: Colors.black),
                          //             ),

                          //           ],
                          //         ),
                          //         Row(
                          //           children: [
                          //             InkWell(
                          //               // onTap: () {
                          //               //   Navigator.of(context,
                          //               //           rootNavigator: true,
                          //               //          )
                          //               //       .push(MaterialPageRoute(
                          //               //           builder: (context) {
                          //               //     // return DetailPage(bean);
                          //               //     return SignIn();
                          //               //   }));
                          //               // },
                          //               child: Text(
                          //                 "ACC.UID:",
                          //                 style: TextStyle(
                          //                     fontSize: 16.0 * textScale,
                          //                     color: Colors.black),
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               width: screenWidth * 0.010,
                          //             ),
                          //             InkWell(
                          //               onTap: () {
                          //                 // Navigator.of(context,
                          //                 //         rootNavigator: true,
                          //                 //        )
                          //                 //     .push(MaterialPageRoute(
                          //                 //         builder: (context) {
                          //                 //   // return DetailPage(bean);
                          //                 //   return SignUp();
                          //                 // }));
                          //               },
                          //               child: Text(
                          //                 "2112343564",
                          //                 style: TextStyle(
                          //                     fontSize: 16.0 * textScale,
                          //                     color: Colors.black),
                          //               ),
                          //             ),
                          //             Padding(
                          //                 padding: EdgeInsets.only(
                          //                     left: 90.0, top: 0.0)),
                          //           ],
                          //         ),
                          //         Row(
                          //           children: [],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // )

                          //  :

                          Padding(
                            padding:
                                EdgeInsets.only(left: 0.0, top: 5.0, right: 0),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 0.0, top: 0.0)),
                                      Text(
                                        "Welcome to cx",
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 24.0 * textScale,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.0, top: 0.0)),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context,
                                                  rootNavigator: true,
                                                 )
                                              .push(MaterialPageRoute(
                                                  builder: (context) {
                                            // return DetailPage(bean);
                                            return SignIn();
                                          }));
                                        },
                                        child: Text(
                                          "Login ",
                                          style: TextStyle(
                                              fontSize: 16.0 * textScale,
                                              color: Colors.black),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context,
                                                  rootNavigator: true,
                                                 )
                                              .push(MaterialPageRoute(
                                                  builder: (context) {
                                            // return DetailPage(bean);
                                            return SignUp();
                                          }));
                                        },
                                        child: Text(
                                          "or Register",
                                          style: TextStyle(
                                              fontSize: 16.0 * textScale,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 90.0, top: 0.0)),
                                    ],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 0.0, top: 20.0)),
                                  Container(
                                      color: theme.canvasColor,
                                      height: screenHeight * 0.05,
                                      child: Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                Navigator.of(context,
                                                        rootNavigator: true,
                                                       )
                                                    .push(MaterialPageRoute(
                                                        builder: (context) {
                                                  // return DetailPage(bean);
                                                  return SplashScreen();
                                                }));
                                              },
                                              child: Row(children: [
                                            Text(
                                              " Trade with simple interface                    ",
                                              style: TextStyle(
                                                  fontSize: 12.0 * textScale,
                                                  color: Colors.black38),
                                            ),
                                            Icon(
                                              Icons.arrow_circle_right_rounded,
                                              size: 24,
                                            )
                                          ])),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 0.0, top: 0.0)),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                NestedTabBar2()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
