import 'dart:ui';

import '../pro/selectaccountswithdraw.dart';
import '../pro/selecttoken.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import 'orders.dart';
import 'selectaccounts.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import '../../main.dart';
import 'package:scrollable_panel/scrollable_panel.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';

class _SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double circularBoxHeight = 16.0;
    final Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: size.height + kToolbarHeight + 44.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(circularBoxHeight),
                  topRight: Radius.circular(circularBoxHeight)),
              border: Border.all(color: Colors.blue),
            ),
            child: const Center(
              child: Text("second"),
            ),
          ),
        );
      },
    );
  }
}

class Withdraw extends StatefulWidget {
  String? token;
  String? accounttype;
  Withdraw({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _WithdrawState createState() =>
      _WithdrawState(token: this.token, accounttype: this.accounttype);
}

class _WithdrawState extends State<Withdraw> {
  String? token;
  String? accounttype;
  _WithdrawState({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _WithdrawMobile(token: token, accounttype: accounttype),
          tablet: _WithdrawTablet(),
        ),
      ),
    );
  }
}

class _WithdrawTablet extends StatefulWidget {
  _WithdrawTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __WithdrawTabletState createState() => __WithdrawTabletState();
}

class __WithdrawTabletState extends State<_WithdrawTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  // final _formKey = GlobalKey<FormBuilderState>();
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
  late ScrollController scrollController;

  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.expand();
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.anchor();
      } else {}
    });

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

  /// return a bottom drawer widget.

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final _formKey = GlobalKey<FormBuilderState>();
    final textScale = MediaQuery.of(context).textScaleFactor;
    final theme = Theme.of(context);

    return Stack(alignment: AlignmentDirectional.bottomEnd, children: <Widget>[
      Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0.5,
          title: Text("Withdraw",
              style:
                  TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
          actions: [
            Container(
                width: screenWidth * 0.40,
                height: screenHeight * 0.35,
                // color: Colors.grey[400],
                child: Row(
                  children: [
                    Container(
                      width: screenWidth * 0.250,
                      height: screenHeight * 0.35,
                      // color: Colors.grey[400],
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 18,
                      icon: const Icon(
                        Icons.history,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          // return DetailPage(bean);
                          return Order();
                        }));
                      },
                    ),
                  ],
                )),
          ],
        ),
        body: ListView(
          // controller: _controller,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: <Widget>[
            Container(
              //  height:screenHeight*1.5,
              child: Container(
                // height:screenHeight*1.5,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.010,
                        ),
                        Row(children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 1,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              color: theme.scaffoldBackgroundColor,
                              height: screenHeight * 0.060,
                              width: screenWidth * 0.55,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    // return DetailPage(bean);
                                    return SearchListWithdraw();
                                  }));
                                },
                                child: TextField(
                                  // controller: usernameController,
                                  obscureText: false,

                                  decoration: InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    enabled: false,
                                    labelText: 'Coin',
                                    suffixIcon: const Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))
                        ]),

                        // SizedBox(
                        //   height: screenHeight * 0.010,
                        // ),
                        SizedBox(
                          height: screenWidth * 0.020,
                        ),

                        Row(children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1,
                              ),
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                height: screenHeight * 0.055,
                                color: theme.scaffoldBackgroundColor,
                                width: screenWidth * 0.750,
                                child: InkWell(
                                  onTap: () {
                                    if (SlidingUpPanelStatus.anchored ==
                                        panelController.status) {
                                      // panelController.hide();
                                      panelController.hide();
                                    } else {
                                      panelController.anchor();
                                    }
                                  },
                                  child: TextField(
                                    // controller: usernameController,
                                    obscureText: false,

                                    decoration: InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      enabled: false,
                                      labelText: 'Network',
                                      suffixIcon: const Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),

                        // SizedBox(
                        //   height: screenHeight * 0.010,
                        // ),

                        SizedBox(
                          height: screenWidth * 0.020,
                        ),
                        Row(children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1,
                              ),
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                height: screenHeight * 0.055,
                                color: theme.scaffoldBackgroundColor,
                                width: screenWidth * 0.750,
                                child: const TextField(
                                  // controller: usernameController,
                                  obscureText: false,

                                  decoration: InputDecoration(
                                    disabledBorder: InputBorder.none,
                                    enabled: false,
                                    labelText: 'Memo',
                                    //                 suffixIcon: const Icon(
                                    //   Icons.keyboard_arrow_right,
                                    //   size: 20,
                                    //   color: Colors.black,
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),

                        SizedBox(
                          height: screenWidth * 0.020,
                        ),

                        // SizedBox(
                        //   height: screenHeight * 0.010,
                        // ),

                        Row(children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1,
                              ),
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                height: screenHeight * 0.055,
                                color: theme.scaffoldBackgroundColor,
                                width: screenWidth * 0.750,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) {
                                      // return DetailPage(bean);
                                      return SearchAccountsWithdraws();
                                    }));
                                  },
                                  child: TextField(
                                    // controller: usernameController,
                                    obscureText: false,

                                    decoration: InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      enabled: false,
                                      labelText: 'Accountype',
                                      suffixIcon: const Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),

                        SizedBox(
                          height: screenWidth * 0.020,
                        ), //               Container(
                        //   height: screenHeight*0.030,
                        //   // color: Colors.grey,
                        //   child:  InkWell(
                        //     // onTap: ,
                        //     child: Center(child: Text('Forgot Password')),
                        //   ),
                        // ),

                        // Divider(
                        //   color: Colors.blueGrey[100],
                        //   height: 2,
                        //   thickness: 1,
                        //   indent: 0,
                        //   endIndent: 0,
                        // ),
                        Container(
                            child: Column(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: Container(
                                color: theme.backgroundColor,
                                width: screenWidth * 1.2,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                // height: screenHeight * 0.350,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text(
                                        "Wallet Address",

                                        style: TextStyle(
                                            color: theme.hoverColor,
                                            fontSize: 14.0 * textScale),
                                        // onTap: _signUp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenWidth * 0.015,
                                    ),
                                    Container(
                                      height: screenHeight * 0.200,
                                      width: screenWidth * 0.400,
                                      child: Card(
                                        // child: Text('DropdownSelect'),
                                        child: InkWell(
                                          onTap: () {},
                                          child: FadeInImage.assetNetwork(
                                            alignment:
                                                Alignment.topCenter, // add this
                                            placeholder: 'dummy image',
                                            image:
                                                'https://pngimg.com/uploads/qr_code/qr_code_PNG24.png',
                                            fit: BoxFit.fitWidth,
                                            height: screenHeight * 0.120,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                            color: theme.hoverColor,
                                            fontSize: 14.0 * textScale),

                                        // onTap: _signUp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenWidth * 0.065,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Expanded(
                                              child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 32,
                                            ),
                                            child: GestureDetector(
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: screenWidth * 0.750,
                                                height: screenHeight * 0.055,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.0),
                                                  color: theme.primaryColor,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(1.0),
                                                  child: InkWell(
                                                    // onTap: _signUp,
                                                    child: Center(
                                                      child: Text(
                                                        'Withdraw',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              16 * textScale,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ))
                                        ]),
                                    SizedBox(
                                      height: screenWidth * 0.065,
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: screenWidth * 0.020,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              // height: screenHeight * 0.150,
                              color: theme.scaffoldBackgroundColor,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: InkWell(
                                  // onTap: _signUp,
                                  child: Column(children: [
                                    Center(
                                      child: Text(
                                        '-Important Notice: The minimunm withdrawal amount is 0.001BTC' +
                                            '',
                                        style: TextStyle(
                                          // ignore: deprecated_member_use
                                          color: theme.highlightColor,
                                          fontSize: 12 * textScale,
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        '- Please note that we processes withdrawal requests three times a day at 08:00 UTC 16:00UTC and 24:00 UTC hte cutoff time for withdrawal requests will be 30mins before the scheduled withdrawal processing time' +
                                            '' +
                                            '',
                                        style: TextStyle(
                                          // ignore: deprecated_member_use
                                          color: theme.highlightColor,
                                          fontSize: 12 * textScale,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        '  - Withdrawals will be performed directly via the Spot Account' +
                                            '  Please manually trasnfer your funds to the Spot Account first' +
                                            '',
                                        style: TextStyle(
                                          color: theme.highlightColor,
                                          fontSize: 12 * textScale,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ),
                        ])),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
      SlidingUpPanelWidget(
        panelStatus: SlidingUpPanelStatus.hidden,
        child: Container(
          height: screenHeight * 0.0,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shadows: [
              BoxShadow(
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  color: const Color(0x11000000))
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      // Text(
                      //   'click or drag',
                      // )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: screenHeight * 0.02,
                ),
                // Divider(
                //   height: 0.5,
                //   color: Colors.grey[300],
                // ),
                Container(
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Select Network",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Column(children: [
                          Row(
                            children: [
                              Text(
                                  "Ensure that the selected network is consistet with your   ",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "method of withdrawal Otherwise you are aat risk of losing",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("your assets",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                        ]),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text("ETH",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text("Ethereum(ERC20)",
                                style: TextStyle(fontSize: 12 * textScale)),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text("cx",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text("cx Community Chain",
                                style: TextStyle(fontSize: 12 * textScale)),
                          ],
                        ),
                      ),
                    ],
                  )),
                  color: Colors.white,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
        ),
        controlHeight: screenHeight * 0.35,
        anchor: 0.35,
        panelController: panelController,
        onTap: () {
          ///Customize the processing logic
        },
        dragStart: (details) {
          panelController.collapse();
        },

        dragUpdate: (details) {
          panelController.collapse();
        },
        enableOnTap: false, //Enable the onTap callback for control bar.
      ),
    ]);
  }
}

class _WithdrawMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _WithdrawMobile({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _WithdrawMobileState createState() =>
      _WithdrawMobileState(token: this.token, accounttype: this.accounttype);
}

class _WithdrawMobileState extends State<_WithdrawMobile> {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _WithdrawMobileState({this.token, this.accounttype});

  SlidingUpPanelController panelController1 = SlidingUpPanelController();
  SlidingUpPanelController panelController2 = SlidingUpPanelController();
  final ScrollController _controller = ScrollController();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  // final _formKey = GlobalKey<FormBuilderState>();
  static const genderOptions = ['1', '2', '3'];
  late String setvalue = "";
  late String setvalue2 = "";

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
  late ScrollController scrollController;

  ///The controller of sliding up panel

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController1.expand();
        panelController2.expand();
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController1.anchor();
        panelController2.anchor();
      } else {}
    });

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

  /// return a bottom drawer widget.

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;
    final theme = Theme.of(context);
    final _formKey = GlobalKey<FormBuilderState>();
    final ScrollController _controller = ScrollController();

    return Stack(children: <Widget>[
      Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: theme.scaffoldBackgroundColor,
            elevation: 0.5,
            title: Text("Withdraw",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            actions: [
              Container(
                  width: screenWidth * 0.40,
                  height: screenHeight * 0.35,
                  // color: Colors.grey[400],
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth * 0.250,
                        height: screenHeight * 0.35,
                        // color: Colors.grey[400],
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(
                          Icons.history,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            // return DetailPage(bean);
                            return Order();
                          }));
                        },
                      ),
                    ],
                  )),
            ],
          ),
          body:
              // BlocConsumer<TransactionBloc, TransactionState>(
              //   listener: (context, state) {
              //     // TODO: implement listener
              //   },
              //   builder: (context, state) {
              //     return
              ListView(
            // controller: _controller,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                skipDisabled: true,
                child: Container(
                  //  height:screenHeight*1.5,
                  child: Container(
                    // height:screenHeight*1.5,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.010,
                            ),
                            Row(children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 1,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    color: theme.scaffoldBackgroundColor,
                                    height: screenHeight * 0.060,
                                    width: screenWidth * 0.55,
                                    child: FormBuilderTextField(
                                      name: 'token',
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              // return DetailPage(bean);
                                              return SearchListWithdraw();
                                            }));
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey),
                                        labelText: token != null
                                            ? 'Coin:                                                                         ${token} '
                                            : null,

                                        border: InputBorder.none,
                                        // prefix: const Text('Name: '),
                                        // InputBorder(borderSide: BorderSide(width: 0,style: BorderStyle.none))
                                        // enabled: false,
                                        // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                        // errorText: _emailError,
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                    ),
                                  ),
                                ),
                              )
                            ]),

                            // SizedBox(
                            //   height: screenHeight * 0.010,
                            // ),
                            SizedBox(
                              height: screenWidth * 0.020,
                            ),

                            Row(children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 1,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    height: screenHeight * 0.055,
                                    color: theme.scaffoldBackgroundColor,
                                    width: screenWidth * 0.750,
                                    child: FormBuilderTextField(
                                      name: 'network',
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            if (SlidingUpPanelStatus.anchored ==
                                                panelController1.status) {
                                              // panelController.hide();
                                              panelController1.hide();
                                            } else {
                                              panelController1.anchor();
                                            }
                                          },
                                          child: const Icon(
                                            Icons.keyboard_arrow_right,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey),
                                        labelText: token != null
                                            ? 'Network:                                                                         ${token} '
                                            : null,
                                        border: InputBorder.none,
                                        // prefix: const Text('Name: '),
                                        // InputBorder(borderSide: BorderSide(width: 0,style: BorderStyle.none))
                                        // enabled: false,
                                        // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                        // errorText: _emailError,
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            ]),

                            // SizedBox(
                            //   height: screenHeight * 0.010,
                            // ),

                            SizedBox(
                              height: screenWidth * 0.020,
                            ),
                            Row(children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 1,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    height: screenHeight * 0.055,
                                    color: theme.scaffoldBackgroundColor,
                                    width: screenWidth * 0.750,
                                    child: FormBuilderTextField(
                                      name: 'memo',
                                      decoration: const InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey),
                                        labelText: "Memo",
                                        border: InputBorder.none,
                                        // prefix: const Text('Name: '),
                                        // InputBorder(borderSide: BorderSide(width: 0,style: BorderStyle.none))
                                        // enabled: false,
                                        // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                        // errorText: _emailError,
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            ]),

                            SizedBox(
                              height: screenWidth * 0.020,
                            ),

                            // SizedBox(
                            //   height: screenHeight * 0.010,
                            // ),

                            Row(children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 1,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    height: screenHeight * 0.055,
                                    color: theme.scaffoldBackgroundColor,
                                    width: screenWidth * 0.750,
                                    child: InkWell(
                                      onTap: () {
                                        if (SlidingUpPanelStatus.anchored ==
                                            panelController1.status) {
                                          // panelController.hide();
                                          panelController1.hide();
                                        } else {
                                          panelController1.anchor();
                                        }
                                      },
                                      child: FormBuilderTextField(
                                        name: 'accounttype',
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              if (SlidingUpPanelStatus
                                                      .anchored ==
                                                  panelController1.status) {
                                                // panelController.hide();
                                                panelController1.hide();
                                              } else {
                                                panelController1.anchor();
                                              }
                                            },
                                            child: Icon(
                                              Icons.keyboard_arrow_right,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                          labelStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                          labelText:
                                              'Accountype:                                         ' +
                                                  setvalue2,
                                          border: InputBorder.none,

                                          // prefix: const Text('Name: '),
                                          // InputBorder(borderSide: BorderSide(width: 0,style: BorderStyle.none))
                                          // enabled: false,
                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                          // errorText: _emailError,
                                        ),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),

                            SizedBox(
                              height: screenWidth * 0.020,
                            ), //               Container(
                            //   height: screenHeight*0.030,
                            //   // color: Colors.grey,
                            //   child:  InkWell(
                            //     // onTap: ,
                            //     child: Center(child: Text('Forgot Password')),
                            //   ),
                            // ),

                            // Divider(
                            //   color: Colors.blueGrey[100],
                            //   height: 2,
                            //   thickness: 1,
                            //   indent: 0,
                            //   endIndent: 0,
                            // ),
                            Container(
                                child: Column(children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1),
                                child: Container(
                                    color: theme.backgroundColor,
                                    width: screenWidth * 1.2,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    // height: screenHeight * 0.350,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Text(
                                            "Wallet Address",

                                            style: TextStyle(
                                                color: theme.hoverColor,
                                                fontSize: 14.0 * textScale),
                                            // onTap: _signUp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenWidth * 0.015,
                                        ),
                                        Container(
                                          height: screenHeight * 0.200,
                                          width: screenWidth * 0.400,
                                          child: Card(
                                            // child: Text('DropdownSelect'),
                                            child: InkWell(
                                              onTap: () {},
                                              child: FadeInImage.assetNetwork(
                                                alignment: Alignment
                                                    .topCenter, // add this
                                                placeholder: 'dummy image',
                                                image:
                                                    'https://pngimg.com/uploads/qr_code/qr_code_PNG24.png',
                                                fit: BoxFit.fitWidth,
                                                height: screenHeight * 0.120,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                                color: theme.hoverColor,
                                                fontSize: 14.0 * textScale),

                                            // onTap: _signUp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenWidth * 0.065,
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Expanded(
                                                  child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 32,
                                                ),
                                                child: GestureDetector(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: screenWidth * 0.750,
                                                    height:
                                                        screenHeight * 0.055,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3.0),
                                                      color: theme.primaryColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(1.0),
                                                      child: InkWell(
                                                        // onTap: _signUp,
                                                        child: Center(
                                                          child: Text(
                                                            'Withdraw',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16 *
                                                                  textScale,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ))
                                            ]),
                                        SizedBox(
                                          height: screenWidth * 0.065,
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: screenWidth * 0.020,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22),
                                  // height: screenHeight * 0.150,
                                  color: theme.scaffoldBackgroundColor,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: InkWell(
                                      onTap: () async {
                                        // Get textfield input value
                                        final validationSuccess =
                                            _formKey.currentState!.validate();

                                        if (validationSuccess) {
                                          //
                                          // Save only when validation passed
                                          _formKey.currentState!.save();
                                          //
                                          // Get form data
                                          final formData =
                                              _formKey.currentState!.value;
                                          //token

                                          // context.read<TransactionBloc>().add(
                                          // _CoinWithdrawnTransactionEvent(
                                          //   token:_formKey.currentState!.fields['token']?.value,
                                          //   network:_formKey.currentState!.fields['network']?.value,
                                          //   memo:_formKey.currentState!.fields['memo']?.value,
                                          // accounttype:_formKey.currentState!.fields['accounttype']?.value
                                          // ),
                                          // );
                                          // Reset form
                                          _formKey.currentState!.reset();
                                          // Optional: unfocus keyboard
                                          FocusScope.of(context).unfocus();
                                          // Optional: Show snackbar
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration: Duration(seconds: 2),
                                              content: Text(
                                                  'Validation succeeded -> Data: $formData',
                                                  textScaleFactor: 1.5),
                                            ),
                                          );
                                        } else {
                                          // Get form data
                                          final formData =
                                              _formKey.currentState!.value;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration: Duration(seconds: 2),
                                              content: Text(
                                                  'Validation failed! -> Data: $formData',
                                                  textScaleFactor: 1.5),
                                            ),
                                          );
                                        }

                                        // Optional: unfocus keyboard
                                        FocusScope.of(context).unfocus();
                                      },
                                      child: Column(children: [
                                        Center(
                                          child: Text(
                                            '-Important Notice: The minimunm withdrawal amount is 0.001BTC' +
                                                '',
                                            style: TextStyle(
                                              // ignore: deprecated_member_use
                                              color: theme.highlightColor,
                                              fontSize: 12 * textScale,
                                              // fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            '- Please note that we processes withdrawal requests three times a day at 08:00 UTC 16:00UTC and 24:00 UTC hte cutoff time for withdrawal requests will be 30mins before the scheduled withdrawal processing time' +
                                                '' +
                                                '',
                                            style: TextStyle(
                                              // ignore: deprecated_member_use
                                              color: theme.highlightColor,
                                              fontSize: 12 * textScale,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            '  - Withdrawals will be performed directly via the Spot Account' +
                                                '  Please manually trasnfer your funds to the Spot Account first' +
                                                '',
                                            style: TextStyle(
                                              color: theme.highlightColor,
                                              fontSize: 12 * textScale,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            ])),
                          ]),
                    ),
                  ),
                ),
              ),
            ],
            // );
            // },
          )),
      SlidingUpPanelWidget(
        panelStatus: SlidingUpPanelStatus.hidden,
        child: Container(
          height: screenHeight * 0.0,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shadows: [
              const BoxShadow(
                  blurRadius: 5.0, spreadRadius: 2.0, color: Color(0x11000000))
            ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      // Text(
                      //   'click or drag',
                      // )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: screenHeight * 0.02,
                ),
                // Divider(
                //   height: 0.5,
                //   color: Colors.grey[300],
                // ),
                Container(
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Select Network",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Column(children: [
                          Row(
                            children: [
                              Text(
                                  "Ensure that the selected network is consistet with your   ",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "method of withdrawal Otherwise you are aat risk of losing",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("your assets",
                                  style: TextStyle(fontSize: 12 * textScale)),
                            ],
                          ),
                        ]),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            setvalue = 'ETH';
                          });
                        },
                        title: Row(
                          children: [
                            Text("ETH",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text("Ethereum(ERC20)",
                                style: TextStyle(fontSize: 12 * textScale)),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Text("cx",
                                style: TextStyle(
                                  fontSize: 16 * textScale,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text("cx Community Chain",
                                style: TextStyle(fontSize: 12 * textScale)),
                          ],
                        ),
                      ),
                    ],
                  )),
                  color: Colors.white,
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ),
        controlHeight: screenHeight * 0.35,
        anchor: 0.35,
        panelController: panelController1,
        onTap: () {
          ///Customize the processing logic
        },
        dragStart: (details) {
          panelController1.collapse();
        },

        dragUpdate: (details) {
          panelController1.collapse();
        },
        enableOnTap: false, //Enable the onTap callback for control bar.
      ),
      SlidingUpPanelWidget(
        panelStatus: SlidingUpPanelStatus.hidden,
        child: Container(
          height: screenHeight * 0.0,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: ShapeDecoration(
            color: Colors.white,
            shadows: [
              const BoxShadow(
                  blurRadius: 5.0, spreadRadius: 2.0, color: Color(0x11000000))
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      // Text(
                      //   'click or drag',
                      // )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: screenHeight * 0.02,
                ),
                // Divider(
                //   height: 0.5,
                //   color: Colors.grey[300],
                // ),
                SingleChildScrollView(
                  child: ListView.builder(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    padding: const EdgeInsets.all(1.0),
                    itemBuilder: (context, index) {
                      var coin = coins[index];
                      return Container(
                          color: Colors.white70,
                          // width: screenWidth * 0.880,

                          child: Column(children: [
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Select Account",
                                      style: TextStyle(
                                        fontSize: 16 * textScale,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                              subtitle: Column(children: [
                                Row(
                                  children: [
                                    Text(
                                        "Ensure that the selected network is consistet with your   ",
                                        style: TextStyle(
                                            fontSize: 12 * textScale)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        "method of withdrawal Otherwise you are aat risk of losing",
                                        style: TextStyle(
                                            fontSize: 12 * textScale)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("your assets",
                                        style: TextStyle(
                                            fontSize: 12 * textScale)),
                                  ],
                                ),
                              ]),
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  setvalue2 = 'Main Account';
                                });
                              },
                              title: Row(
                                children: [
                                  Text('Main Account',
                                      style: TextStyle(
                                        fontSize: 16 * textScale,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text("",
                                      style:
                                          TextStyle(fontSize: 12 * textScale)),
                                ],
                              ),
                            ),
                          ]));
                    },
                  ),
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ),
        controlHeight: screenHeight * 0.35,
        anchor: 0.35,
        panelController: panelController2,
        onTap: () {
          ///Customize the processing logic
        },
        dragStart: (details) {
          panelController2.collapse();
        },

        dragUpdate: (details) {
          panelController2.collapse();
        },
        enableOnTap: false, //Enable the onTap callback for control bar.
      ),
    ]);
  }
}
