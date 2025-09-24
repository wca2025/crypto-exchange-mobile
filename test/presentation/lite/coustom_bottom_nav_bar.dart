import 'package:flutter/material.dart';
import 'account2.dart';
import 'home_view.dart';
import 'homepage.dart';
import 'profile.dart';
import 'settings.dart';
import 'trade.dart';

import 'market.dart';

enum MenuState { home, favourite, message, profile }

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarMobileState createState() =>
      _CustomBottomNavBarMobileState();
}

class _CustomBottomNavBarMobileState extends State<CustomBottomNavBar> {
  Color _iconColor = Colors.grey[400]!;
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    Homepage(),
    Market(),
    Trade(),
    HomeScreen(),
    Account2(),
    //   Deposit(),
    //   Withdraw(),
    //       SignIn(),
    //     SignUp(),
    //    Changepassword(),
    //     Tradingpassword(),
    // EmailPhoneVerification2(),

    //  Convert(),

    //  Transfer(),

    // P2pAppeal(),
//      P2pPending(),
//      tokenDetail(),
// // // // // //
//     P2pRelease(),

//     P2pOrderCompleted(),
//      ConfirmOrder(),

//       OrderDetails(),
//      Order(),

//   //   // PaymentMethodList(),
//      Settings(),

//   AddAddress(),
//     EditAddress(),

//      Notifications(),
//  AddressList(),
//     NotificationsDetail(),

    // Security(),

// 3435

    //  qwerty -asdf

    //   SearchList(),
    //   LayerSearch(),

    //  Others(),
    //   Buy(),
    //    NftDetailsPage(),

//  Download(),

//     MyAds(),
//       PostAd(),
//     EditAd(),
//    PaymentMethod(),
//  EditPaymentMethod(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Homepage();
                      }));
                    },
                    child: Column(children: [
                      Container(
                        height: screenHeight * 0.040,
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          icon: Icon(Icons.home),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(builder: (context) {
                              return Homepage();
                            }));
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text("Home")),
                    ]),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Market();
                      }));
                    },
                    child: Column(children: [
                      Container(
                        height: screenHeight * 0.040,
                        child: IconButton(
                          highlightColor: Colors.amber,
                          padding: EdgeInsets.all(0.0),
                          icon: Icon(
                            Icons.home,
                            color: Colors.grey[400],
                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(builder: (context) {
                              return Market();
                            }));
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text("Market",
                              style: TextStyle(color: Colors.grey[400]))),
                    ]),
                  )
                ],
              ),
              Column(mainAxisSize: MainAxisSize.min, children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Trade();
                      }));
                    },
                    child: Column(children: [
                      Container(
                        height: screenHeight * 0.040,
                        child: IconButton(
                          highlightColor: Colors.amber,
                          padding: EdgeInsets.all(0.0),
                          icon: Icon(
                            Icons.home,
                            color: Colors.grey[400],
                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(builder: (context) {
                              return Trade();
                            }));
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text("Trade",
                              style: TextStyle(color: Colors.grey[400]))),
                    ]))
              ]),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    },
                    child: Column(children: [
                      Container(
                        height: screenHeight * 0.040,
                        child: IconButton(
                          highlightColor: Colors.amber,
                          padding: EdgeInsets.all(0.0),
                          icon: Icon(
                            Icons.home,
                            color: Colors.grey[400],
                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text("Nfts",
                              style: TextStyle(color: Colors.grey[400]))),
                    ]),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                      onTapDown: (details) => setState(() {
                            _iconColor = Colors.black;
                          }),
                      onTapUp: (details) => setState(() {
                            _iconColor = Colors.black;
                          }),
                      onTap: () {
                        setState(() {
                          _iconColor = Colors.black;
                        });
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Account2();
                        }));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: screenHeight * 0.040,
                            child: IconButton(
                              padding: EdgeInsets.all(0.0),
                              icon: Icon(Icons.home, color: _iconColor),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Account2();
                                }));

                                setState(() {
                                  _iconColor = Colors.black;
                                });
                              },
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Text("Accounts",
                                  style: TextStyle(color: _iconColor))),
                        ],
                        // onHover: (value) => ,
                      )),
                ],
              ),
            ],
          )),
    );
  }
}
