import '../pro/repay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import 'borrow.dart';
import 'convert.dart';
import 'deposit.dart';
import 'withdraw.dart';
import '../widgets/responsive.dart';
import 'sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'transfer.dart';

class tokenDetail extends StatefulWidget {
  String? token;
  String? accounttype;
  tokenDetail({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _tokenDetailState createState() =>
      _tokenDetailState(token: this.token, accounttype: this.accounttype);
}

class _tokenDetailState extends State<tokenDetail> {
  @override
  String? token;
  String? accounttype;
  _tokenDetailState({this.token, this.accounttype});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _tokenDetailMobile(token: token, accounttype: accounttype),
          tablet: _tokenDetailTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _tokenDetailTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _tokenDetailTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __tokenDetailTabletState createState() => __tokenDetailTabletState();
}

class __tokenDetailTabletState extends State<_tokenDetailTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Text("Token Detail",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
          ),
          body: DefaultTabController(
            length: 2,
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 1.4,
              // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView(
                controller: _controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Buy",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "BTC",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "OrderID",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "oid653",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Created Time",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "03/11/22",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "53",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),

                  Divider(
                    color: Colors.blueGrey[100],
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Nickname",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "edemgbk",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "Mtn Mmobile Money",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),

                  // Expanded(child: Container(height: screenHeight*0.40,)),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Deposit();
                        }));
                      },
                      child: Text(
                        'Deposit',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Withdraw();
                        }));
                      },
                      child: Text(
                        'Withdraw',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Transfer();
                        }));
                      },
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
              ]),
        ));
  }
}

class _tokenDetailMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _tokenDetailMobile({Key? key, this.token, this.accounttype})
      : super(key: key);

  @override
  _tokenDetailMobileState createState() =>
      _tokenDetailMobileState(token: this.token, accounttype: this.accounttype);
}

class _tokenDetailMobileState extends State<_tokenDetailMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _tokenDetailMobileState({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Text("Token Detail",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
          ),
          body:

              //  BlocConsumer<TransactionBloc, TransactionState>(
              //    listener: (context, state) {
              // TODO: implement listener
              //    if (state is _SuccessTransactionState) {
              //   ScaffoldMessenger.of(context).showSnackBar((
              //     const SnackBar(
              //       duration: Duration(seconds: 2),
              //       content: Text(' succeess ', textScaleFactor: 1.5),
              //     ),
              //   );
              // }         else if (state is _ErrorTransactionState) {

              // ScaffoldMessenger.of(context).showSnackBar((
              //   const SnackBar(
              //     duration: Duration(seconds: 2),
              //     content: Text(' error ', textScaleFactor: 1.5),
              //   ),
              // );
              // }
              //  },
              //  builder: (context, state) {
              //    return
              DefaultTabController(
            length: 2,
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 1.4,
              // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView(
                controller: _controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Buy",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "BTC",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "OrderID",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "oid653",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Created Time",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "03/11/22",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "53",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),

                  Divider(
                    color: Colors.blueGrey[100],
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Nickname",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "edemgbk",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "Mtn Mmobile Money",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),

                  // Expanded(child: Container(height: screenHeight*0.40,)),
                ],
              ),
            ),
            // ); },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Deposit();
                        }));
                      },
                      child: Text(
                        'Deposit',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Withdraw();
                        }));
                      },
                      child: Text(
                        'Withdraw',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Transfer();
                        }));
                      },
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
              ]),
        ));
  }
}

class margintokenDetail extends StatefulWidget {
  margintokenDetail(
      // Function showResult,
      //  Function changeDisplay,
      // //  Function showCreateUser,
      //   // Function signOut,
      //   // Function fetchSession,
      //    Function getCurrentUser,
      //    Function setError
      );

  @override
  _margintokenDetailState createState() => _margintokenDetailState();
}

class _margintokenDetailState extends State<margintokenDetail> {
  // Function showResult;

  // Function setError;

  // Function changeDisplay;

  // Function _signOut;

  // Function _showCreateUser;

  // Function _getCurrentUser;

  // Function _fetchSession;

  // Function _backToSignIn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _margintokenDetailMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _margintokenDetailTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _margintokenDetailTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _margintokenDetailTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __margintokenDetailTabletState createState() =>
      __margintokenDetailTabletState();
}

class __margintokenDetailTabletState extends State<_margintokenDetailTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Text("Token Detail",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
          ),
          body: DefaultTabController(
            length: 2,
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 1.4,
              // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView(
                controller: _controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Buy",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "BTC",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "OrderID",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "oid653",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Created Time",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "03/11/22",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "53",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),

                  Divider(
                    color: Colors.blueGrey[100],
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Nickname",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "edemgbk",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "Mtn Mmobile Money",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),

                  // Expanded(child: Container(height: screenHeight*0.40,)),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Deposit();
                        }));
                      },
                      child: Text(
                        'Deposit',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Withdraw();
                        }));
                      },
                      child: Text(
                        'Withdraw',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Transfer();
                        }));
                      },
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
              ]),
        ));
  }
}

class _margintokenDetailMobile extends StatefulWidget {
  _margintokenDetailMobile(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _margintokenDetailMobileState createState() =>
      _margintokenDetailMobileState();
}

class _margintokenDetailMobileState extends State<_margintokenDetailMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Text("Token Detail",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
          ),
          body:

              //  BlocConsumer<TransactionBloc, TransactionState>(
              //    listener: (context, state) {
              // TODO: implement listener
              //    if (state is _SuccessTransactionState) {
              //   ScaffoldMessenger.of(context).showSnackBar((
              //     const SnackBar(
              //       duration: Duration(seconds: 2),
              //       content: Text(' succeess ', textScaleFactor: 1.5),
              //     ),
              //   );
              // }         else if (state is _ErrorTransactionState) {

              // ScaffoldMessenger.of(context).showSnackBar((
              //   const SnackBar(
              //     duration: Duration(seconds: 2),
              //     content: Text(' error ', textScaleFactor: 1.5),
              //   ),
              // );
              // }
              //  },
              //  builder: (context, state) {
              //    return
              DefaultTabController(
            length: 2,
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 1.4,
              // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView(
                controller: _controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Buy",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "BTC",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "OrderID",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "oid653",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Created Time",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "03/11/22",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "53",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),

                  Divider(
                    color: Colors.blueGrey[100],
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Nickname",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "edemgbk",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "Mtn Mmobile Money",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),

                  // Expanded(child: Container(height: screenHeight*0.40,)),
                ],
              ),
            ),
            // )
            // ;
            //  },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Borrow();
                        }));
                      },
                      child: Text(
                        'Borrow',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Repay();
                        }));
                      },
                      child: Text(
                        'Repay',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Transfer();
                        }));
                      },
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
              ]),
        ));
  }
}

class futuretokenDetail extends StatefulWidget {
  futuretokenDetail(
      // Function showResult,
      //  Function changeDisplay,
      // //  Function showCreateUser,
      //   // Function signOut,
      //   // Function fetchSession,
      //    Function getCurrentUser,
      //    Function setError
      );

  @override
  _futuretokenDetailState createState() => _futuretokenDetailState();
}

class _futuretokenDetailState extends State<futuretokenDetail> {
  // Function showResult;

  // Function setError;

  // Function changeDisplay;

  // Function _signOut;

  // Function _showCreateUser;

  // Function _getCurrentUser;

  // Function _fetchSession;

  // Function _backToSignIn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _futuretokenDetailMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _futuretokenDetailTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _futuretokenDetailTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _futuretokenDetailTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __futuretokenDetailTabletState createState() =>
      __futuretokenDetailTabletState();
}

class __futuretokenDetailTabletState extends State<_futuretokenDetailTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Text("Token Detail",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
          ),
          body: DefaultTabController(
            length: 2,
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 1.4,
              // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView(
                controller: _controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Buy",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "BTC",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "OrderID",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "oid653",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Created Time",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "03/11/22",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "53",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),

                  Divider(
                    color: Colors.blueGrey[100],
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Nickname",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "edemgbk",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "Mtn Mmobile Money",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),

                  // Expanded(child: Container(height: screenHeight*0.40,)),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Deposit();
                        }));
                      },
                      child: Text(
                        'Deposit',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Withdraw();
                        }));
                      },
                      child: Text(
                        'Withdraw',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Transfer();
                        }));
                      },
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
              ]),
        ));
  }
}

class _futuretokenDetailMobile extends StatefulWidget {
  _futuretokenDetailMobile(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _futuretokenDetailMobileState createState() =>
      _futuretokenDetailMobileState();
}

class _futuretokenDetailMobileState extends State<_futuretokenDetailMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Text("Token Detail",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
          ),
          body:

              //  BlocConsumer<TransactionBloc, TransactionState>(
              //    listener: (context, state) {
              // TODO: implement listener
              //    if (state is _SuccessTransactionState) {
              //   ScaffoldMessenger.of(context).showSnackBar((
              //     const SnackBar(
              //       duration: Duration(seconds: 2),
              //       content: Text(' succeess ', textScaleFactor: 1.5),
              //     ),
              //   );
              // }         else if (state is _ErrorTransactionState) {

              // ScaffoldMessenger.of(context).showSnackBar((
              //   const SnackBar(
              //     duration: Duration(seconds: 2),
              //     content: Text(' error ', textScaleFactor: 1.5),
              //   ),
              // );
              // }
              //  },
              //  builder: (context, state) {
              //    return
              DefaultTabController(
            length: 2,
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 1.4,
              // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView(
                controller: _controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Buy",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "BTC",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "OrderID",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "oid653",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Created Time",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "03/11/22",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "53",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),

                  Divider(
                    color: Colors.blueGrey[100],
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Nickname",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "edemgbk",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "Mtn Mmobile Money",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),

                  // Expanded(child: Container(height: screenHeight*0.40,)),
                ],
              ),
            ),
            // ); },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Borrow();
                        }));
                      },
                      child: Text(
                        'Borrow',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Repay();
                        }));
                      },
                      child: Text(
                        'Repay',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Transfer();
                        }));
                      },
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
              ]),
        ));
  }
}

class spottokenDetail extends StatefulWidget {
  spottokenDetail(
      // Function showResult,
      //  Function changeDisplay,
      // //  Function showCreateUser,
      //   // Function signOut,
      //   // Function fetchSession,
      //    Function getCurrentUser,
      //    Function setError
      );

  @override
  _spottokenDetailState createState() => _spottokenDetailState();
}

class _spottokenDetailState extends State<spottokenDetail> {
  // Function showResult;

  // Function setError;

  // Function changeDisplay;

  // Function _signOut;

  // Function _showCreateUser;

  // Function _getCurrentUser;

  // Function _fetchSession;

  // Function _backToSignIn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _spottokenDetailMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _spottokenDetailTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _spottokenDetailTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _spottokenDetailTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __spottokenDetailTabletState createState() => __spottokenDetailTabletState();
}

class __spottokenDetailTabletState extends State<_spottokenDetailTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Text("Token Detail",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
          ),
          body: DefaultTabController(
            length: 2,
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 1.4,
              // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView(
                controller: _controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Buy",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "BTC",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "OrderID",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "oid653",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Created Time",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "03/11/22",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "53",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),

                  Divider(
                    color: Colors.blueGrey[100],
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Nickname",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "edemgbk",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "Mtn Mmobile Money",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),

                  // Expanded(child: Container(height: screenHeight*0.40,)),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Deposit();
                        }));
                      },
                      child: Text(
                        'Deposit',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Withdraw();
                        }));
                      },
                      child: Text(
                        'Withdraw',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Transfer();
                        }));
                      },
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
              ]),
        ));
  }
}

class _spottokenDetailMobile extends StatefulWidget {
  _spottokenDetailMobile(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _spottokenDetailMobileState createState() => _spottokenDetailMobileState();
}

class _spottokenDetailMobileState extends State<_spottokenDetailMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Text("Token Detail",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
          ),
          body:

              //  BlocConsumer<TransactionBloc, TransactionState>(
              //    listener: (context, state) {
              // TODO: implement listener
              //    if (state is _SuccessTransactionState) {
              //   ScaffoldMessenger.of(context).showSnackBar((
              //     const SnackBar(
              //       duration: Duration(seconds: 2),
              //       content: Text(' succeess ', textScaleFactor: 1.5),
              //     ),
              //   );
              // }         else if (state is _ErrorTransactionState) {

              // ScaffoldMessenger.of(context).showSnackBar((
              //   const SnackBar(
              //     duration: Duration(seconds: 2),
              //     content: Text(' error ', textScaleFactor: 1.5),
              //   ),
              // );
              // }
              //  },
              //  builder: (context, state) {
              //    return
              DefaultTabController(
            length: 2,
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 1.4,
              // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView(
                controller: _controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Buy",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "BTC",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "OrderID",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "oid653",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Created Time",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "03/11/22",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "53",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),

                  Divider(
                    color: Colors.blueGrey[100],
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Nickname",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "edemgbk",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "Mtn Mmobile Money",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),

                  // Expanded(child: Container(height: screenHeight*0.40,)),
                ],
              ),
            ),
            // );
            // },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Convert();
                        }));
                      },
                      child: Text(
                        'Convert',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Transfer();
                        }));
                      },
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
              ]),
        ));
  }
}

class earntokenDetail extends StatefulWidget {
  earntokenDetail(
      // Function showResult,
      //  Function changeDisplay,
      // //  Function showCreateUser,
      //   // Function signOut,
      //   // Function fetchSession,
      //    Function getCurrentUser,
      //    Function setError
      );

  @override
  _earntokenDetailState createState() => _earntokenDetailState();
}

class _earntokenDetailState extends State<earntokenDetail> {
  // Function showResult;

  // Function setError;

  // Function changeDisplay;

  // Function _signOut;

  // Function _showCreateUser;

  // Function _getCurrentUser;

  // Function _fetchSession;

  // Function _backToSignIn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _earntokenDetailMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _earntokenDetailTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _earntokenDetailTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _earntokenDetailTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __earntokenDetailTabletState createState() => __earntokenDetailTabletState();
}

class __earntokenDetailTabletState extends State<_earntokenDetailTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Text("Token Detail",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
          ),
          body: DefaultTabController(
            length: 2,
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 1.4,
              // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView(
                controller: _controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Buy",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "BTC",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "OrderID",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "oid653",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Created Time",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "03/11/22",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "53",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),

                  Divider(
                    color: Colors.blueGrey[100],
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Nickname",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "edemgbk",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "Mtn Mmobile Money",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),

                  // Expanded(child: Container(height: screenHeight*0.40,)),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Deposit();
                        }));
                      },
                      child: Text(
                        'Deposit',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Withdraw();
                        }));
                      },
                      child: Text(
                        'Withdraw',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Transfer();
                        }));
                      },
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
              ]),
        ));
  }
}

class _earntokenDetailMobile extends StatefulWidget {
  _earntokenDetailMobile(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _earntokenDetailMobileState createState() => _earntokenDetailMobileState();
}

class _earntokenDetailMobileState extends State<_earntokenDetailMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            title: Text("Token Detail",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
          ),
          body:

              //  BlocConsumer<TransactionBloc, TransactionState>(
              //    listener: (context, state) {
              // TODO: implement listener
              //    if (state is _SuccessTransactionState) {
              //   ScaffoldMessenger.of(context).showSnackBar((
              //     const SnackBar(
              //       duration: Duration(seconds: 2),
              //       content: Text(' succeess ', textScaleFactor: 1.5),
              //     ),
              //   );
              // }         else if (state is _ErrorTransactionState) {

              // ScaffoldMessenger.of(context).showSnackBar((
              //   const SnackBar(
              //     duration: Duration(seconds: 2),
              //     content: Text(' error ', textScaleFactor: 1.5),
              //   ),
              // );
              // }
              //  },
              //  builder: (context, state) {
              //    return
              DefaultTabController(
            length: 2,
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 1.4,
              // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView(
                controller: _controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                // padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Buy",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "BTC",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Amount",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "OrderID",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "oid653",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "56",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Created Time",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "03/11/22",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.blueGrey[100],
                  //   height: 2,
                  //   thickness: 1,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Quantity",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "53",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),

                  Divider(
                    color: Colors.blueGrey[100],
                    height: 2,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Nickname",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "edemgbk",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.050,
                    // color: Colors.blueGrey,
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Security();
                        // }));
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                              left: 5,
                            )),
                            Text(
                              "Payment Method",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Expanded(
                                child: Container(width: screenWidth * 0.08)),
                            Text(
                              "Mtn Mmobile Money",
                              style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.035,
                  ),

                  // Expanded(child: Container(height: screenHeight*0.40,)),
                ],
              ),
            ),
            // );
            // },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Convert();
                        }));
                      },
                      child: Text(
                        'Earn',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: GestureDetector(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFf5f7fa),
                      )),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return Transfer();
                        }));
                      },
                      child: Text(
                        'Transfer',
                        style: TextStyle(
                            fontSize: 14 * textScale,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 5.0,
                ),
              ]),
        ));
  }
}
