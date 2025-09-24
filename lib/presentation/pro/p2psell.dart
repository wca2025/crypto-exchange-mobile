import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../businesslogic/blocs/p2p/p2p_bloc.dart';
import 'chat.dart';
import 'p2ppendingpayment.dart';

import 'confirmorder.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'selecttoken.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

class NestedTabBar1 extends StatefulWidget {
  const NestedTabBar1({Key? key}) : super(key: key);

  @override
  _NestedTabBar1State createState() => _NestedTabBar1State();
}

class _NestedTabBar1State extends State<NestedTabBar1>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final ScrollController _controller = ScrollController();
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  @override
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: theme.scaffoldBackgroundColor,
          title: Text(
            "P2psell",
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Lets Get Started',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  constraints: const BoxConstraints.expand(height: 50),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      indicatorColor: Colors.white,
                      labelColor: Colors.teal,
                      unselectedLabelColor: Colors.black54,
                      isScrollable: true,
                      tabs: const <Widget>[
                        Tab(
                          text: "By Fiat",
                        ),
                        Tab(text: "  By Crypto"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        child: TabBarView(
                  children: [
                    ListView(
                      // controller: _controller,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: <Widget>[
                        Row(
                          children: const [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            Text(
                              'Reset Password',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.010,
                        ),
                        Row(
                          children: const [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            Text(
                              '12scdvfa',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Container(
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: screenHeight * 0.010,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      color: theme.backgroundColor,
                                      height: screenHeight * 0.060,
                                      width: screenWidth * 0.750,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              // return DetailPage(bean);
                                              return SearchListBuy();
                                            }));
                                          },
                                          child: DropdownButton<String>(
                                            underline: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      width: 0.0,
                                                      color: theme
                                                          .scaffoldBackgroundColor),
                                                ),
                                              ),
                                            ),
                                            elevation: 2,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 2,
                                            ),
                                            value: value,
                                            items: items
                                                .map(buildMenuItem)
                                                .toList(),
                                            onChanged: (value) => setState(
                                                () => this.value = value),
                                          )),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.010,
                                    ),

                                    Container(
                                      height: screenHeight * 0.060,
                                      color: theme.backgroundColor,
                                      width: screenWidth * 0.750,
                                      child: FormBuilderTextField(
                                        name: '',
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          labelStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                          labelText: "",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),

                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                          suffixIcon: Icon(
                                            FontAwesomeIcons.envelope,
                                            size: 17,
                                          ),
                                          // errorText: _emailError,
                                        ),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.010,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      color: theme.backgroundColor,
                                      height: screenHeight * 0.060,
                                      width: screenWidth * 0.750,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              // return DetailPage(bean);
                                              return SearchListBuy();
                                            }));
                                          },
                                          child: DropdownButton<String>(
                                            underline: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      width: 0.0,
                                                      color: theme
                                                          .scaffoldBackgroundColor),
                                                ),
                                              ),
                                            ),
                                            elevation: 2,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 2,
                                            ),
                                            value: value,
                                            items: items
                                                .map(buildMenuItem)
                                                .toList(),
                                            onChanged: (value) => setState(
                                                () => this.value = value),
                                          )),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.010,
                                    ),

                                    Container(
                                      height: screenHeight * 0.060,
                                      color: theme.backgroundColor,
                                      width: screenWidth * 0.750,
                                      child: FormBuilderTextField(
                                        name: '',
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          labelStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                          labelText: "",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),

                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                          suffixIcon: Icon(
                                            FontAwesomeIcons.envelope,
                                            size: 17,
                                          ),
                                          // errorText: _emailError,
                                        ),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenWidth * 0.020,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: screenHeight * 0.060,
                                        width: screenWidth * 0.750,
                                        decoration: BoxDecoration(
                                          color: theme.primaryColor,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: InkWell(
                                            //  onTap: p2pdetails() ,
                                            child: Center(
                                              child: Text(
                                                'Sell',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //   GestureDetector(
                                    //   child: Container(
                                    //     alignment: Alignment.center,
                                    //     height: screenHeight * 0.060,
                                    //     width: screenWidth * 0.750,
                                    //     decoration: BoxDecoration(
                                    //       color: theme.primaryColor,
                                    //     ),
                                    //     child: const Padding(
                                    //       padding: EdgeInsets.all(12.0),
                                    //       child: InkWell(
                                    //         // onTap: _signUp,
                                    //         child: Center(
                                    //           child: Text(
                                    //             'Sell',
                                    //             style: TextStyle(
                                    //               color: Colors.white,
                                    //               fontSize: 20,
                                    //               fontWeight: FontWeight.bold,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),

                                    //               Container(
                                    //   height: screenHeight*0.030,
                                    //   // color: Colors.grey,
                                    //   child:  InkWell(
                                    //     // onTap: ,
                                    //     child: Center(child: Text('Forgot Password')),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: screenWidth * 0.020,
                                    ),
                                    Container(
                                      height: screenHeight * 0.060,
                                      // color: Colors.blueGrey,
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.of(context,rootNavigator: true)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   return Security();
                                          // }));
                                        },
                                        child: Row(children: [
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                left: 80,
                                              ),
                                              child: Text("Amount")),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.18)),
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                right: 80,
                                              ),
                                              child: Text("Security")),
                                        ]),
                                      ),
                                    ),

                                    Container(
                                      height: screenHeight * 0.060,
                                      // color: Colors.blueGrey,
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.of(context,rootNavigator: true)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   return Security();
                                          // }));
                                        },
                                        child: Row(children: [
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                left: 80,
                                              ),
                                              child: Text("Amount")),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.18)),
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                right: 80,
                                              ),
                                              child: Text("Security")),
                                        ]),
                                      ),
                                    ),

                                    Container(
                                      height: screenHeight * 0.060,
                                      // color: Colors.blueGrey,
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.of(context,rootNavigator: true)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   return Security();
                                          // }));
                                        },
                                        child: Row(children: [
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                left: 80,
                                              ),
                                              child: Text("Amount")),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.18)),
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                right: 80,
                                              ),
                                              child: Text("Security")),
                                        ]),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),

                        // Container(
                        //   height: screenHeight * 0.60,
                        //   child: Row(
                        //     children: [

                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    ListView(
                      // controller: _controller,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            Text(
                              'Reset Password',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.010,
                        ),
                        Row(
                          children: const [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            Text(
                              '12scdvfa',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Container(
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: screenHeight * 0.010,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      color: theme.backgroundColor,
                                      height: screenHeight * 0.060,
                                      width: screenWidth * 0.750,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              // return DetailPage(bean);
                                              return SearchListBuy();
                                            }));
                                          },
                                          child: DropdownButton<String>(
                                            underline: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      width: 0.0,
                                                      color: theme
                                                          .scaffoldBackgroundColor),
                                                ),
                                              ),
                                            ),
                                            elevation: 2,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 2,
                                            ),
                                            value: value,
                                            items: items
                                                .map(buildMenuItem)
                                                .toList(),
                                            onChanged: (value) => setState(
                                                () => this.value = value),
                                          )),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.010,
                                    ),
                                    Container(
                                      height: screenHeight * 0.060,
                                      color: theme.backgroundColor,
                                      width: screenWidth * 0.750,
                                      child: FormBuilderTextField(
                                        name: '',
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          labelStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                          labelText: "",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),

                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                          suffixIcon: Icon(
                                            FontAwesomeIcons.envelope,
                                            size: 17,
                                          ),
                                          // errorText: _emailError,
                                        ),
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.010,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      color: theme.backgroundColor,
                                      height: screenHeight * 0.060,
                                      width: screenWidth * 0.750,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              // return DetailPage(bean);
                                              return SearchListBuy();
                                            }));
                                          },
                                          child: DropdownButton<String>(
                                            underline: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                      width: 0.0,
                                                      color: theme
                                                          .scaffoldBackgroundColor),
                                                ),
                                              ),
                                            ),
                                            elevation: 2,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 2,
                                            ),
                                            value: value,
                                            items: items
                                                .map(buildMenuItem)
                                                .toList(),
                                            onChanged: (value) => setState(
                                                () => this.value = value),
                                          )),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.010,
                                    ),
                                    Container(
                                      height: screenHeight * 0.060,
                                      color: theme.backgroundColor,
                                      width: screenWidth * 0.750,
                                      child: TextField(
                                        // controller: usernameController,
                                        obscureText: false,

                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),
                                          labelText: '',
                                          suffixIcon: Icon(
                                            FontAwesomeIcons.envelope,
                                            size: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenWidth * 0.020,
                                    ),
                                    //            GestureDetector(
                                    //   child: Container(
                                    //     alignment: Alignment.center,
                                    //     height: screenHeight * 0.060,
                                    //     width: screenWidth * 0.750,
                                    //     decoration: BoxDecoration(
                                    //       color: theme.primaryColor,
                                    //     ),
                                    //     child: const Padding(
                                    //       padding: EdgeInsets.all(12.0),
                                    //       child: InkWell(
                                    //         //  onTap: p2pdetails() ,
                                    //         child: Center(
                                    //           child: Text(
                                    //             'Sell',
                                    //             style: TextStyle(
                                    //               color: Colors.white,
                                    //               fontSize: 20,
                                    //               fontWeight: FontWeight.bold,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    GestureDetector(
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: screenHeight * 0.060,
                                        width: screenWidth * 0.750,
                                        decoration: BoxDecoration(
                                          color: theme.primaryColor,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: InkWell(
                                            // onTap: _signUp,
                                            child: Center(
                                              child: Text(
                                                'Sell',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              '- To ensure the security of your account withdrawal serviecs',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: theme.hoverColor,
                                                fontSize: 12 * textScale,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // GestureDetector(
                                    //   child: Container(
                                    //     alignment: Alignment.center,
                                    //     height: screenHeight * 0.060,
                                    //     width: screenWidth * 0.750,
                                    //     decoration: BoxDecoration(
                                    //       color: theme.primaryColor,
                                    //     ),
                                    //     child: const Padding(
                                    //       padding: EdgeInsets.all(12.0),
                                    //       child: InkWell(
                                    //         // onTap: _signUp,
                                    //         child: Center(
                                    //           child: Text(
                                    //             'Sell',
                                    //             style: TextStyle(
                                    //               color: Colors.white,
                                    //               fontSize: 20,
                                    //               fontWeight: FontWeight.bold,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    Container(
                                      height: screenHeight * 0.060,
                                      // color: Colors.blueGrey,
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.of(context,rootNavigator: true)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   return Security();
                                          // }));
                                        },
                                        child: Row(children: [
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                left: 80,
                                              ),
                                              child: Text("Amount")),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.18)),
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                right: 80,
                                              ),
                                              child: Text("Security")),
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      height: screenHeight * 0.060,
                                      // color: Colors.blueGrey,
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.of(context,rootNavigator: true)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   return Security();
                                          // }));
                                        },
                                        child: Row(children: [
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                left: 80,
                                              ),
                                              child: Text("Amount")),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.18)),
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                right: 80,
                                              ),
                                              child: Text("Security")),
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      height: screenHeight * 0.060,
                                      // color: Colors.blueGrey,
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.of(context,rootNavigator: true)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   return Security();
                                          // }));
                                        },
                                        child: Row(children: [
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                left: 80,
                                              ),
                                              child: Text("Amount")),
                                          Expanded(
                                              child: Container(
                                                  width: screenWidth * 0.18)),
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                right: 80,
                                              ),
                                              child: Text("Security")),
                                        ]),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )))
              ],
            )));
  }
}

class P2psell extends StatefulWidget {
  P2psell(
      // Function showResult,
      //  Function changeDisplay,
      // //  Function showCreateUser,
      //   // Function signOut,
      //   // Function fetchSession,
      //    Function getCurrentUser,
      //    Function setError
      );

  @override
  _P2psellState createState() => _P2psellState();
}

class _P2psellState extends State<P2psell> {
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
          mobile: _P2psellMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _P2psellTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _P2psellTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _P2psellTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __P2psellTabletState createState() => __P2psellTabletState();
}

class __P2psellTabletState extends State<_P2psellTablet> {
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
    final ScrollController controller = ScrollController();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0.2,
        automaticallyImplyLeading: false,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          "Sell",
          style: TextStyle(color: Colors.black87),
        ),
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
                      Icons.support_agent_outlined,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      // Navigator.of(context,rootNavigator: true)
                      //     .push(MaterialPageRoute(builder: (context) {
                      //   // return DetailPage(bean);
                      //   return Order();
                      // }));
                    },
                  ),
                ],
              )),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          controller: controller,
          child: Column(children: [
            SizedBox(height: screenHeight * 0.020),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                // width: screenWidth * 0.95,
                color: theme.backgroundColor,
                height: screenHeight * 0.32,
                //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),

                child: Card(
                  color: theme.backgroundColor,
                  elevation: 0,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Row(children: [
                          Center(
                            child: Container(
                              color: theme.backgroundColor,

                              // child: const Align(
                              //   alignment: Alignment.centerRight,
                              child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
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
                                            child: Text('With Fiat',
                                                style: TextStyle(
                                                    fontSize: 14 * textScale)),
                                          ),
                                          Tab(
                                            child: Text('With Crypto',
                                                style: TextStyle(
                                                    fontSize: 14 * textScale)),
                                          ),
                                        ],
                                      )),
                                    ]),
                              ),
                              // ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 135.0)),
                        ]),
                      ),
                      Divider(
                        color: Colors.blueGrey[100],
                        height: 2,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Expanded(
                          child: Container(
                              child: TabBarView(
                        children: [
                          ListView(
                            // controller: _controller,
                            // physics: const BouncingScrollPhysics(
                            //     parent: AlwaysScrollableScrollPhysics()),
                            children: <Widget>[
                              Container(
                                child: Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: screenHeight * 0.030,
                                          ),

                                          Row(children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 32,
                                                ),
                                                child: Container(
                                                  height: screenHeight * 0.055,
                                                  color: theme
                                                      .scaffoldBackgroundColor,
                                                  width: screenWidth * 0.750,
                                                  child: TextField(
                                                    // controller: usernameController,
                                                    obscureText: false,

                                                    decoration: InputDecoration(
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .shade300),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          4.0))),
                                                      labelText: '',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                          SizedBox(
                                            height: screenHeight * 0.020,
                                          ),

                                          Row(children: [
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
                                                      color: Color(0xFF1da2b4)),
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
                                                          return P2pPending();
                                                        }));
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          'Sell',
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
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                    '-Please complete your payment within 15:00  Otherwise the order will be automatically cancelled',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: theme.hoverColor,
                                                      fontSize: 12 * textScale,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          //               Container(
                                          //   height: screenHeight*0.030,
                                          //   // color: Colors.grey,
                                          //   child:  InkWell(
                                          //     // onTap: ,
                                          //     child: Center(child: Text('Forgot Password')),
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: screenWidth * 0.020,
                                          ),
                                        ]),
                                  ),
                                ),
                              ),

                              // Container(
                              //   height: screenHeight * 0.60,
                              //   child: Row(
                              //     children: [

                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                          ListView(
                            // controller: _controller,
                            // physics: const BouncingScrollPhysics(
                            //     parent: AlwaysScrollableScrollPhysics()),
                            children: <Widget>[
                              Container(
                                child: Container(
                                  child: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: screenHeight * 0.030,
                                          ),
                                          Row(children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 32,
                                                ),
                                                child: Container(
                                                  height: screenHeight * 0.055,
                                                  color: theme
                                                      .scaffoldBackgroundColor,
                                                  width: screenWidth * 0.750,
                                                  child: TextField(
                                                    // controller: usernameController,
                                                    obscureText: false,

                                                    decoration: InputDecoration(
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .shade300),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          4.0))),
                                                      labelText: '',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                          SizedBox(
                                            height: screenHeight * 0.020,
                                          ),
                                          Row(children: [
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
                                                      color: Color(0xFF1da2b4)),
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
                                                          return P2pPending();
                                                        }));
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          'Sell',
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
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                    '-Please complete your payment within 15:00  Otherwise the order will be automatically cancelled',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: theme.hoverColor,
                                                      fontSize: 12 * textScale,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.035,
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                // width: screenWidth * 0.95,
                color: theme.backgroundColor,
                height: screenHeight * 0.32,
                //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),

                child: Card(
                  color: theme.backgroundColor,
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Row(children: [
                          Text('Info'),
                          Padding(padding: EdgeInsets.only(left: 135.0)),
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
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 1, left: 12, right: 12),
                              child: Text(
                                "User:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: theme.hoverColor,
                                ),
                              )),
                          Expanded(child: Container(width: screenWidth * 0.65)),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 1, left: 12, right: 12),
                              child: Text(
                                "Price:",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: theme.hoverColor,
                                ),
                              )),
                          Expanded(child: Container(width: screenWidth * 0.65)),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 1, left: 12, right: 12),
                              child: Text(
                                "Quantity ",
                                style: TextStyle(
                                    fontSize: 12, color: theme.hoverColor),
                              )),
                          Expanded(child: Container(width: screenWidth * 0.65)),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 1, left: 12, right: 12),
                              child: Text(
                                "Transaction Limits ",
                                style: TextStyle(
                                    fontSize: 12, color: theme.hoverColor),
                              )),
                          Expanded(child: Container(width: screenWidth * 0.65)),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 1, left: 12, right: 12),
                              child: Text(
                                "Payment Method:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: theme.hoverColor,
                                ),
                              )),
                          Expanded(child: Container(width: screenWidth * 0.65)),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 1, left: 12, right: 12),
                              child: Text(
                                "Momo ",
                                style: TextStyle(
                                    fontSize: 12, color: theme.hoverColor),
                              )),
                          Expanded(child: Container(width: screenWidth * 0.65)),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 1, left: 12, right: 12),
                              child: Text(
                                "Bank Transfer ",
                                style: TextStyle(
                                    fontSize: 12, color: theme.hoverColor),
                              )),
                          Expanded(child: Container(width: screenWidth * 0.65)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class _P2psellMobile extends StatefulWidget {
  // final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _P2psellMobile(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _P2psellMobileState createState() => _P2psellMobileState();
}

class _P2psellMobileState extends State<_P2psellMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  final _formKey2 = GlobalKey<FormBuilderState>();

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
    final ScrollController controller = ScrollController();

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          elevation: 0.2,
          automaticallyImplyLeading: false,
          backgroundColor: theme.scaffoldBackgroundColor,
          title: Text(
            "Sell",
            style: TextStyle(color: Colors.black87),
          ),
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
                        Icons.support_agent_outlined,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          // return DetailPage(bean);
                          return Chat();
                        }));
                      },
                    ),
                  ],
                )),
          ],
        ),
        body:
            //  BlocConsumer<P2pBloc, P2pState>(
            //   listener: (context, state) {
            // TODO: implement listener
            //   if (state is SuccessP2pState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' succeess ', textScaleFactor: 1.5),
            //     ),
            //   );
            // }         else if (state is ErrorP2pState) {

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
            DefaultTabController(
          length: 2,
          child: SingleChildScrollView(
            controller: controller,
            child: Column(children: [
              SizedBox(height: screenHeight * 0.020),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: screenWidth * 0.95,
                  color: theme.backgroundColor,
                  height: screenHeight * 0.32,
                  //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),

                  child: Card(
                    color: theme.scaffoldBackgroundColor,
                    elevation: 0,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Row(children: [
                            Center(
                              child: Container(
                                color: theme.scaffoldBackgroundColor,

                                // child: const Align(
                                //   alignment: Alignment.centerRight,
                                child: SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                            child: TabBar(
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.grey),
                                          indicatorColor: Colors.white,
                                          labelColor: Colors.black87,
                                          automaticIndicatorColorAdjustment:
                                              true,
                                          physics: const BouncingScrollPhysics(
                                              parent:
                                                  AlwaysScrollableScrollPhysics()),
                                          isScrollable: true,
                                          unselectedLabelColor: Colors.grey,
                                          tabs: <Widget>[
                                            Tab(
                                              child: Text('With Fiat',
                                                  style: TextStyle(
                                                      fontSize:
                                                          14 * textScale)),
                                            ),
                                            Tab(
                                              child: Text('With Crypto',
                                                  style: TextStyle(
                                                      fontSize:
                                                          14 * textScale)),
                                            ),
                                          ],
                                        )),
                                      ]),
                                ),
                                // ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 135.0)),
                          ]),
                        ),
                        Divider(
                          color: Colors.blueGrey[100],
                          height: 2,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                        Expanded(
                            child: Container(
                                child: TabBarView(
                          children: [
                            FormBuilder(
                              key: _formKey,
                              skipDisabled: true,
                              child: ListView(
                                // controller: _controller,
                                // physics: const BouncingScrollPhysics(
                                //     parent: AlwaysScrollableScrollPhysics()),
                                children: <Widget>[
                                  Container(
                                    child: Container(
                                      child: SingleChildScrollView(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: screenHeight * 0.030,
                                              ),

                                              Row(children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 32,
                                                    ),
                                                    child: Container(
                                                      height:
                                                          screenHeight * 0.055,
                                                      color: theme
                                                          .backgroundColor,
                                                      width:
                                                          screenWidth * 0.750,
                                                      child:  TextField(
                                                        // controller: usernameController,
                                                        obscureText: false,

                                                        decoration:
                                                            InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                          labelText: '',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                              SizedBox(
                                                height: screenHeight * 0.020,
                                              ),

                                              Row(children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                  ),
                                                  child: GestureDetector(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width:
                                                          screenWidth * 0.750,
                                                      height:
                                                          screenHeight * 0.055,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                          color: Color(0xFF1da2b4)
                                                              ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(1.0),
                                                        child: InkWell(
                                                          onTap: () {
                                                            final validationSuccess =
                                                                _formKey
                                                                    .currentState!
                                                                    .validate();

                                                            if (validationSuccess) {
                                                              //
                                                              // Save only when validation passed
                                                              _formKey
                                                                  .currentState!
                                                                  .save();
                                                              // context
                                                              //     .read<
                                                              //         P2pBloc>()
                                                              //     .add(
                                                              //       _P2psellEvent(
                                                              //         totalquantity: _formKey
                                                              //             .currentState!
                                                              //             .fields['totalquantity']
                                                              //             ?.value,
                                                              //       ),
                                                              //     );
                                                              // Get form data
                                                              final formData =
                                                                  _formKey
                                                                      .currentState!
                                                                      .value;
                                                              //
                                                              // Reset form
                                                              _formKey
                                                                  .currentState!
                                                                  .reset();
                                                              // Optional: unfocus keyboard
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              // Optional: Show snackbar
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                  content: Text(
                                                                      'Validation succeeded -> Data: $formData',
                                                                      textScaleFactor:
                                                                          1.5),
                                                                ),
                                                              );

                                                              Navigator.of(
                                                                      context,
                                                                      rootNavigator:
                                                                          true)
                                                                  .push(MaterialPageRoute(
                                                                      builder:
                                                                          (context) {
                                                                // return DetailPage(bean);
                                                                return P2pPending();
                                                              }));
                                                            } else {
                                                              // Get form data
                                                              final formData =
                                                                  _formKey
                                                                      .currentState!
                                                                      .value;
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                  content: Text(
                                                                      'Validation failed! -> Data: $formData',
                                                                      textScaleFactor:
                                                                          1.5),
                                                                ),
                                                              );
                                                            }

                                                            // Optional: unfocus keyboard
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                          },
                                                          child: Center(
                                                            child: Text(
                                                              'Sell',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Text(
                                                        '-Please complete your payment within 15:00  Otherwise the order will be automatically cancelled',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color:
                                                           Colors.black,
                                                          fontSize:
                                                              12 * textScale,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              //               Container(
                                              //   height: screenHeight*0.030,
                                              //   // color: Colors.grey,
                                              //   child:  InkWell(
                                              //     // onTap: ,
                                              //     child: Center(child: Text('Forgot Password')),
                                              //   ),
                                              // ),
                                              SizedBox(
                                                height: screenWidth * 0.020,
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),

                                  // Container(
                                  //   height: screenHeight * 0.60,
                                  //   child: Row(
                                  //     children: [

                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            FormBuilder(
                              key: _formKey2,
                              skipDisabled: true,
                              child: ListView(
                                // controller: _controller,
                                // physics: const BouncingScrollPhysics(
                                //     parent: AlwaysScrollableScrollPhysics()),
                                children: <Widget>[
                                  Container(
                                    child: Container(
                                      child: SingleChildScrollView(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: screenHeight * 0.030,
                                              ),
                                              Row(children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 32,
                                                    ),
                                                    child: Container(
                                                      height:
                                                          screenHeight * 0.055,
                                                      color: theme
                                                          .backgroundColor,
                                                      width:
                                                          screenWidth * 0.750,
                                                      child:  TextField(
                                                        // controller: usernameController,
                                                        obscureText: false,

                                                        decoration:
                                                            InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                          labelText: '',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                              SizedBox(
                                                height: screenHeight * 0.020,
                                              ),
                                              Row(children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                  ),
                                                  child: GestureDetector(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width:
                                                          screenWidth * 0.750,
                                                      height:
                                                          screenHeight * 0.055,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      3.0),
                                                          color: Color(0xFF1da2b4)),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(1.0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            final validationSuccess =
                                                                _formKey
                                                                    .currentState!
                                                                    .validate();

                                                            if (validationSuccess) {
                                                              //
                                                              // Save only when validation passed
                                                              _formKey
                                                                  .currentState!
                                                                  .save();
                                                              //                                                            context.read<P2pBloc>().add(
                                                              //   _P2PSellEvent(
                                                              //     totalquantity:_formKey.currentState!.fields['totalquantity']?.value
                                                              //   ),
                                                              // );
                                                              // Get form data
                                                              final formData =
                                                                  _formKey
                                                                      .currentState!
                                                                      .value;
                                                              //
                                                              // Reset form
                                                              _formKey
                                                                  .currentState!
                                                                  .reset();
                                                              // Optional: unfocus keyboard
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              // Optional: Show snackbar
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                  content: Text(
                                                                      'Validation succeeded -> Data: $formData',
                                                                      textScaleFactor:
                                                                          1.5),
                                                                ),
                                                              );

                                                              Navigator.of(
                                                                      context,
                                                                      rootNavigator:
                                                                          true)
                                                                  .push(MaterialPageRoute(
                                                                      builder:
                                                                          (context) {
                                                                // return DetailPage(bean);
                                                                return P2pPending();
                                                              }));
                                                            } else {
                                                              // Get form data
                                                              final formData =
                                                                  _formKey
                                                                      .currentState!
                                                                      .value;
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                  content: Text(
                                                                      'Validation failed! -> Data: $formData',
                                                                      textScaleFactor:
                                                                          1.5),
                                                                ),
                                                              );
                                                            }

                                                            // Optional: unfocus keyboard
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                          },
                                                          child: Center(
                                                            child: Text(
                                                              'Sell',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(15),
                                                      child: Text(
                                                        '-Please complete your payment within 15:00  Otherwise the order will be automatically cancelled',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color:
                                                              Colors.black,
                                                          fontSize:
                                                              12 * textScale,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: screenHeight * 0.035,
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1),
                child: 
                
                
                    
                                  Container(
                                      // color: theme.backgroundColor,
                                      height: screenHeight * 0.65,
                                                                          width: screenWidth * 1.20,


                                      // color: Colors.grey,
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.of(context,rootNavigator: true)
                                          //     .push(MaterialPageRoute(builder: (context) {
                                          //   return help2();
                                          // }));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                         
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.0,
                                                  horizontal: 12),
                                              child: Container(
                                                width: screenWidth * 1.2,
                                                // color: theme.backgroundColor,
                                                height: screenHeight * 0.35,
                                                //  margin: const EdgeInsets.only(left: 16.0, right: 16.0),

                                                child: Card(
                                                  color: theme
                                                      .scaffoldBackgroundColor,
                                                  elevation: 0,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      ListTile(
                                                        title: Row(children: [
                                                          Text(
                                                              'Info',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        ]),
                                                      ),
                                                      Divider(
                                                        color: Colors
                                                            .blueGrey[100],
                                                        height: 2,
                                                        thickness: 1,
                                                        indent: 0,
                                                        endIndent: 0,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "User ",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "Price:",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),              Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "Quantity:",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),
                                                     Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "Transaction Limits:",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),
                                                                 Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "Payment Method:",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),

                                                                    Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "Momo:",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),

                                                                                           Row(
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      bottom: 1,
                                                                      left: 12,
                                                                      right:
                                                                          12),
                                                              child: Text(
                                                                "Bank Transfer :",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.65)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      )) 
         
              )
           
           
            ]),
          ),
        )
        // ;
        //   },
        // ),
        );
  }
}
