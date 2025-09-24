import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import 'movie_details_page.dart';
import 'orders.dart';
import 'selecttoken.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import '../../main.dart';

class Convert extends StatefulWidget {
  Convert(
      // Function showResult,
      //  Function changeDisplay,
      // //  Function showCreateUser,
      //   // Function signOut,
      //   // Function fetchSession,
      //    Function getCurrentUser,
      //    Function setError
      );

  @override
  _ConvertState createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
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
          mobile: _ConvertMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _ConvertTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _ConvertTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _ConvertTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __ConvertTabletState createState() => __ConvertTabletState();
}

class __ConvertTabletState extends State<_ConvertTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final ScrollController _controller = ScrollController();

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
  String text = '';

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

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
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
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    final ScrollController _controller = ScrollController();

    return DefaultTabController(
        length: 1,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: theme.scaffoldBackgroundColor,
              elevation: 0.5,
              title: Text("Convert",
                  style: TextStyle(
                      fontSize: 16 * textScale, color: Colors.black87)),
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
            body: DefaultTabController(
              length: 2,
              child: Container(
                  color: theme.backgroundColor,
                  child: ListView(
                    // controller: _controller,
                    // physics: const BouncingScrollPhysics(
                    //     parent: AlwaysScrollableScrollPhysics()),
                    children: <Widget>[
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      Row(children: [
                        Padding(padding: EdgeInsets.only(left: 28)),
                        Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.200,
                          height: screenHeight * 0.055,
                          color: theme.backgroundColor,
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return SearchListConvert();
                                }));
                              },
                              child: TextField(
                                // controller: usernameController,
                                obscureText: false,

                                decoration: InputDecoration(
                                             enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                  labelText: '',
                                  suffixIcon: Icon(
                                    FontAwesomeIcons.caretDown,
                                    size: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            height: screenHeight * 0.055,
                            color: theme.backgroundColor,
                            width: screenWidth * 0.600,
                            child: TextField(
                              // controller: usernameController,
                              obscureText: false,

                              decoration: InputDecoration(
                                           enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                labelText: 'From',
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 28)),
                      ]),
                      SizedBox(
                        height: screenHeight * 0.020,
                      ),
                      Row(children: [
                        Padding(padding: EdgeInsets.only(left: 28)),
                        Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.200,
                          height: screenHeight * 0.055,
                          color: theme.backgroundColor,
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return SearchListConvert();
                                }));
                              },
                              child: TextField(
                                // controller: usernameController,
                                obscureText: false,

                                decoration: InputDecoration(
                                             enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                  labelText: '',
                                  suffixIcon: Icon(
                                    FontAwesomeIcons.caretDown,
                                    size: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            height: screenHeight * 0.055,
                            color: theme.backgroundColor,
                            width: screenWidth * 0.600,
                            child:  TextField(
                              // controller: usernameController,
                              obscureText: false,

                              decoration: InputDecoration(
                                           enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                labelText: 'To',
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 28)),
                      ]),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: screenHeight * 0.20,
                          ),
                          Container(
                            child: NumericKeyboard(
                              onKeyboardTap: _onKeyboardTap,
                              textColor: Colors.black,
                              rightButtonFn: () {
                                setState(() {
                                  text = text.substring(0, text.length - 1);
                                });
                              },
                              rightIcon: Icon(
                                Icons.backspace,
                                color: Colors.black,
                              ),
                              leftButtonFn: () {
                                print('left button clicked');
                              },
                              leftIcon: Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.030,
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
                                    borderRadius: BorderRadius.circular(3.0),
                                    color: theme.primaryColor,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: InkWell(
                                      // onTap: _signUp,
                                      child: Center(
                                        child: Text(
                                          'Convert',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                          ]),
                        ],
                      ),
                    ],
                  )),
            )));
  }
}

class _ConvertMobile extends StatefulWidget {
  // final _formKey = GlobalKey<FormBuilderState>();

  _ConvertMobile();

  @override
  _ConvertMobileState createState() => _ConvertMobileState();
}

class _ConvertMobileState extends State<_ConvertMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final ScrollController _controller = ScrollController();

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
  String text = '';

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

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
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
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    final ScrollController _controller = ScrollController();

    return DefaultTabController(
        length: 1,
        child: Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: theme.scaffoldBackgroundColor,
              elevation: 0.5,
              title: Text("Convert",
                  style: TextStyle(
                      fontSize: 16 * textScale, color: Colors.black87)),
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
                //  BlocConsumer<TransactionBloc, TransactionState>(
                //   listener: (context, state) {
                // TODO: implement listener
                //        if (state is _SuccessTransactionState) {
                //   ScaffoldMessenger.of(context).showSnackBar((
                //     const SnackBar(
                //       duration: Duration(seconds: 2),
                //       content: Text(' succeess ', textScaleFactor: 1.5),
                //     ),
                //   );
                // } else if (state is _ErrorTransactionState) {
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
                DefaultTabController(
              length: 2,
              child: Container(
                  color: theme.backgroundColor,
                  child: ListView(
                    // controller: _controller,
                    // physics: const BouncingScrollPhysics(
                    //     parent: AlwaysScrollableScrollPhysics()),
                    children: <Widget>[
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      SizedBox(
                        height: screenHeight * 0.010,
                      ),
                      Row(children: [
                        Padding(padding: EdgeInsets.only(left: 28)),
                        Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.200,
                          height: screenHeight * 0.055,
                          color: theme.backgroundColor,
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return SearchListConvert();
                                }));
                              },
                              child: FormBuilderTextField(
                                name: '',
                                decoration: InputDecoration( 
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: Colors.blueGrey),
                                  labelText: "",
                                             enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

                                  // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                  suffixIcon: Icon(
                                    FontAwesomeIcons.caretDown,
                                    size: 17,
                                  ),
                                  // errorText: _emailError,
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            height: screenHeight * 0.055,
                            color: theme.backgroundColor,
                            width: screenWidth * 0.600,
                            child: FormBuilderTextField(
                              name: 'email',
                              decoration: InputDecoration( 
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                labelStyle: TextStyle(
                                    fontSize: 14, color: Colors.blueGrey),
                                labelText: "From",
                                           enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

                                // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                // errorText: _emailError,
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 28)),
                      ]),
                      SizedBox(
                        height: screenHeight * 0.020,
                      ),
                      Row(children: [
                        Padding(padding: EdgeInsets.only(left: 28)),
                        Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.200,
                          height: screenHeight * 0.055,
                          color: theme.backgroundColor,
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return SearchListConvert();
                                }));
                              },
                              child: FormBuilderTextField(
                                name: '',
                                decoration: InputDecoration( 
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: Colors.blueGrey),
                                  labelText: "",
                                             enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

                                  // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                      suffixIcon: InkWell(
                                            onTap: () {
                                              Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return SearchListConvert();
                                }));
                                            },
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                  // errorText: _emailError,
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            height: screenHeight * 0.055,
                            color: theme.backgroundColor,
                            width: screenWidth * 0.600,
                            child: FormBuilderTextField(
                              name: 'email',
                              decoration: InputDecoration( 
                                     suffixIcon: InkWell(
                                            onTap: () {
                                              Navigator.of(context, rootNavigator: true)
                                    .push(MaterialPageRoute(builder: (context) {
                                  // return DetailPage(bean);
                                  return SearchListConvert();
                                }));
                                            },
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                labelStyle: TextStyle(
                                    fontSize: 14, color: Colors.blueGrey),
                                labelText: "To",
                                           enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

                                // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                // errorText: _emailError,
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 28)),
                      ]),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: screenHeight * 0.20,
                          ),
                          Container(
                            child: NumericKeyboard(
                              onKeyboardTap: _onKeyboardTap,
                              textColor: Colors.black,
                              rightButtonFn: () {
                                setState(() {
                                  text = text.substring(0, text.length - 1);
                                });
                              },
                              rightIcon: Icon(
                                Icons.backspace,
                                color: Colors.black,
                              ),
                              leftButtonFn: () {
                                print('left button clicked');
                              },
                              leftIcon: Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.030,
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
                                    borderRadius: BorderRadius.circular(3.0),
                                    color: theme.primaryColor,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: InkWell(
                                      // onTap: _signUp,
                                      child: Center(
                                        child: Text(
                                          'Convert',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                          ]),
                        ],
                      ),
                    ],
                  )),
            )
            // },
            // )
            ));
  }
}
