import 'dart:ui';

import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../businesslogic/blocs/auth/auth_bloc.dart';
import '2facode.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import '../../main.dart';

class Twofa extends StatefulWidget {
  Twofa();

  @override
  _TwofaState createState() => _TwofaState();
}

class _TwofaState extends State<Twofa> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _TwofaMobile(),
          tablet: _TwofaTablet(),
        ),
      ),
    );
  }
}

class _TwofaTablet extends StatefulWidget {
  _TwofaTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __TwofaTabletState createState() => __TwofaTabletState();
}

class __TwofaTabletState extends State<_TwofaTablet> {
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
    // final _formKey = GlobalKey<FormBuilderState>();
    final textScale = MediaQuery.of(context).textScaleFactor;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: theme.backgroundColor,
          elevation: 0.5,
          title: Text("Two Factor Authentication",
              style:
                  TextStyle(fontSize: 16 * textScale, color: Colors.black87))),
      body: ListView(
        // controller: _controller,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: <Widget>[
          Container(
            color: theme.backgroundColor,

            //  height:screenHeight*1.5,
            child: Container(
              color: theme.backgroundColor,

              // height:screenHeight*1.5,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.380,
                      ),
                      Container(
                          color: theme.backgroundColor,
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
                                          "Setup Two factor authentication",

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
                                                  'https://via.placeholder.com/500x300.png',
                                              fit: BoxFit.fitWidth,
                                              height: screenHeight * 0.120,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text(
                                          "qwertytyuiop:copy key",
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
                                                    padding:
                                                        EdgeInsets.all(1.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          // return DetailPage(bean);
                                                          return Twofacode();
                                                        }));
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          'Next',
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
                                        height: screenWidth * 0.05,
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
    );
  }
}

class _TwofaMobile extends StatefulWidget {
  _TwofaMobile();

  @override
  _TwofaMobileState createState() => _TwofaMobileState();
}

class _TwofaMobileState extends State<_TwofaMobile> {
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
    // final _formKey = GlobalKey<FormBuilderState>();
    final textScale = MediaQuery.of(context).textScaleFactor;
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: theme.scaffoldBackgroundColor,
            elevation: 0.5,
            title: Text("Two Factor Authentication",
                style: TextStyle(
                    fontSize: 16 * textScale, color: Colors.black87))),
        body:
            // BlocConsumer<AuthBloc, AuthState>(
            //   listener: (context, state) {
            // TODO: implement listener
            //    if (state is _SuccessAuthState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' succeess ', textScaleFactor: 1.5),
            //     ),
            //   );
            // }         else if (state is _ErrorAuthState) {

            // ScaffoldMessenger.of(context).showSnackBar((
            //   const SnackBar(
            //     duration: Duration(seconds: 2),
            //     content: Text(' error ', textScaleFactor: 1.5),
            //   ),
            // );
            // }
            // },
            // builder: (context, state) {
            //   return
            ListView(
          // controller: _controller,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: <Widget>[
            Container(
              // color: theme.scaffoldBackgroundColor,

              //  height:screenHeight*1.5,
              child: Container(
                // color: theme.scaffoldBackgroundColor,

                // height:screenHeight*1.5,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.010,
                        ),
                        Container(
                            color: theme.scaffoldBackgroundColor,
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
                                            "Setup Two factor authentication",

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
                                                    'https://via.placeholder.com/500x300.png',
                                                fit: BoxFit.fitWidth,
                                                height: screenHeight * 0.120,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Text(
                                            "qwertytyuiop:copy key",
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
                                                        onTap: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            // return DetailPage(bean);
                                                            return Twofacode();
                                                          }));
                                                        },
                                                        child: Center(
                                                          child: Text(
                                                            'Next',
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
                                          height: screenWidth * 0.05,
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
        )
        // ;
        //   },
        // )
        );
  }
}
