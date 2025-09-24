import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../businesslogic/blocs/auth/auth_bloc.dart';
import 'resetpassword2.dart';
import 'trade.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'account.dart';
import 'countrycode.dart';
import 'home_view.dart';
import 'homepage.dart';
import 'market.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword();

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _ResetPasswordMobile(),
          tablet: _ResetPasswordTablet(),
        ),
      ),
    );
  }
}

class _ResetPasswordTablet extends StatefulWidget {
  _ResetPasswordTablet();

  @override
  __ResetPasswordTabletState createState() => __ResetPasswordTabletState();
}

class __ResetPasswordTabletState extends State<_ResetPasswordTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

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

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
//           appBar: AppBar(
//             title: Text("Token Detail",style:TextStyle(fontSize:16*textScale )
// ),
//             backgroundColor: theme.primaryColor,
//             automaticallyImplyLeading: false,
//             elevation: 0.20,
//           ),
          body: DefaultTabController(
            length: 2,
            child: Container(
              color: theme.backgroundColor,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 70.0),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Forgot Password',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 28),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: theme.backgroundColor,
                    constraints: const BoxConstraints.expand(height: 50),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        indicatorColor: Colors.white,
                        labelColor: Colors.blueGrey,
                        unselectedLabelColor: Colors.black54,
                        isScrollable: true,
                        tabs: <Widget>[
                          Tab(
                            child: Text(
                              'Email',
                              style: TextStyle(fontSize: 14 * textScale),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Phone',
                              style: TextStyle(fontSize: 14 * textScale),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: theme.backgroundColor,
                      child: TabBarView(children: [
                        Container(
                          color: theme.backgroundColor,
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
                                          horizontal: 32,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          height: screenHeight * 0.055,
                                          color: theme.backgroundColor,
                                          width: screenWidth * 0.750,
                                          child: FormBuilderField<String?>(
                                            name: 'email',
                                            onChanged: (val) =>
                                                debugPrint(val.toString()),
                                            builder: (FormFieldState field) {
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15),
                                                child: InputDecorator(
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    labelStyle:
                                                        TextStyle(fontSize: 16),
                                                    labelText: "Email Address",
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: theme
                                                                .scaffoldBackgroundColor),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    4.0))),

                                                    // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                                  ),
                                                ),
                                              );
                                            },
                                            autovalidateMode:
                                                AutovalidateMode.always,
                                            validator: (valueCandidate) {
                                              if (valueCandidate?.isEmpty ??
                                                  true) {
                                                return 'This field is required.';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: screenHeight * 0.030,
                                  ),
                                  Row(children: [
                                    Padding(padding: EdgeInsets.only(left: 30)),
                                    Expanded(
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        height: screenHeight * 0.055,
                                        color: theme.backgroundColor,
                                        width: screenWidth * 0.300,
                                        child: FormBuilderField<String?>(
                                          name: 'name',
                                          onChanged: (val) =>
                                              debugPrint(val.toString()),
                                          builder: (FormFieldState field) {
                                            return Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: InputDecorator(
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 2),
                                                  labelStyle:
                                                      TextStyle(fontSize: 16),
                                                  labelText:
                                                      "Verification Code",

                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: theme
                                                              .scaffoldBackgroundColor),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  4.0))),

                                                  // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                                ),
                                              ),
                                            );
                                          },
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          validator: (valueCandidate) {
                                            if (valueCandidate?.isEmpty ??
                                                true) {
                                              return 'This field is required.';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: screenWidth * 0.200,
                                        height: screenHeight * 0.055,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                          color: theme.primaryColor,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(1.0),
                                          child: InkWell(
                                            // onTap: _signUp,
                                            child: Center(
                                              child: Text(
                                                'Send',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16 * textScale,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 38)),
                                  ]),
                                  SizedBox(
                                    height: screenWidth * 0.020,
                                  ),
                                  SizedBox(
                                    height: screenWidth * 0.020,
                                  ),
                                  Row(children: [
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 32,
                                      ),
                                      child: GestureDetector(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          alignment: Alignment.center,
                                          width: screenWidth * 0.750,
                                          height: screenHeight * 0.055,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2.0),
                                            color: theme.primaryColor,
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(MaterialPageRoute(
                                                      builder: (context) {
                                                return ResetPassword2();
                                              }));
                                            },
                                            child: Center(
                                              child: Text(
                                                'Next',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16 * textScale,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                  ]),
                                  SizedBox(
                                    height: screenWidth * 0.020,
                                  ),
                                  Row(children: [
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 32,
                                      ),
                                      child: Container(
                                        height: screenHeight * 0.030,
                                        // color: Colors.grey,
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(MaterialPageRoute(
                                                      builder: (context) {
                                                return SignIn();
                                              }));
                                            },
                                            child: Text(
                                              'already have an account ?, Signin',
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 12 * textScale),
                                            )),
                                      ),
                                    ))
                                  ]),
                                  SizedBox(
                                    height: screenWidth * 0.020,
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.010,
                                ),
                                Row(children: [
                                  Padding(padding: EdgeInsets.only(left: 30)),
                                  Container(
                                    alignment: Alignment.center,
                                    width: screenWidth * 0.150,
                                    height: screenHeight * 0.055,
                                    color: theme.scaffoldBackgroundColor,
                                    child: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              // return DetailPage(bean);
                                              return CountryCode();
                                            }));
                                          },
                                          child: FormBuilderTextField(
                                            name: 'countrycode',
                                            // controller: _countrycodeController,

                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: '',
                                                suffixIcon: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .push(MaterialPageRoute(
                                                            builder: (context) {
                                                      // return DetailPage(bean);
                                                      return CountryCode();
                                                    }));
                                                  },
                                                  child: const Icon(
                                                    FontAwesomeIcons.caretDown,
                                                    size: 20,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            // controller: cellphoneController,
                                            // inputFormatters: [cellphoneFormatter],
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            validator:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.required(),
                                              FormBuilderValidators.match(
                                                r"^\(?[1-9]{2}\)? ?(?:[2-8]|9[1-9])[0-9]{3}\-?[0-9]{4}$",
                                              ),
                                            ]),
                                          )),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 5)),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth * 0.700,
                                      height: screenHeight * 0.055,
                                      color: theme.scaffoldBackgroundColor,
                                      child: Padding(
                                        padding: EdgeInsets.all(0.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              // return DetailPage(bean);
                                              return CountryCode();
                                            }));
                                          },
                                          child: FormBuilderField<String?>(
                                            name: 'name',
                                            onChanged: (val) =>
                                                debugPrint(val.toString()),
                                            builder: (FormFieldState field) {
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15),
                                                child: InputDecorator(
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    labelStyle:
                                                        TextStyle(fontSize: 18),
                                                    labelText: "Phone Number",
                                                    border: InputBorder.none,

                                                    // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                                  ),
                                                ),
                                              );
                                            },
                                            autovalidateMode:
                                                AutovalidateMode.always,
                                            validator: (valueCandidate) {
                                              if (valueCandidate?.isEmpty ??
                                                  true) {
                                                return 'This field is required.';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 46)),
                                ]),
                                SizedBox(
                                  height: screenHeight * 0.030,
                                ),
                                Row(children: [
                                  Padding(padding: EdgeInsets.only(left: 30)),
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      height: screenHeight * 0.055,
                                      color: theme.scaffoldBackgroundColor,
                                      width: screenWidth * 0.600,
                                      child: FormBuilderField<String?>(
                                        name: 'name',
                                        onChanged: (val) =>
                                            debugPrint(val.toString()),
                                        builder: (FormFieldState field) {
                                          return Padding(
                                            padding: EdgeInsets.only(top: 15),
                                            child: InputDecorator(
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 2),
                                                labelStyle:
                                                    TextStyle(fontSize: 18),
                                                labelText: "Verification Code",
                                                border: InputBorder.none,

                                                // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                              ),
                                            ),
                                          );
                                        },
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        validator: (valueCandidate) {
                                          if (valueCandidate?.isEmpty ?? true) {
                                            return 'This field is required.';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth * 0.200,
                                      height: screenHeight * 0.055,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        color: theme.primaryColor,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: InkWell(
                                          // onTap: _signUp,
                                          child: Center(
                                            child: Text(
                                              'Send',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16 * textScale,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 38)),
                                ]),
                                SizedBox(
                                  height: screenWidth * 0.020,
                                ),
                                SizedBox(
                                  height: screenWidth * 0.020,
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
                                          color: theme.primaryColor,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              return ResetPassword2();
                                            }));
                                          },
                                          child: Center(
                                            child: Text(
                                              'Next',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16 * textScale,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                                ]),
                                SizedBox(
                                  height: screenWidth * 0.020,
                                ),
                                Row(children: [
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 32,
                                    ),
                                    child: Container(
                                      height: screenHeight * 0.030,
                                      // color: Colors.grey,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              return SignIn(
                                                  // showResult,
                                                  // changeDisplay,
                                                  // showCreateUser,
                                                  // signOut,
                                                  // fetchSession,
                                                  // getCurrentUser,
                                                  // setError
                                                  );
                                            }));
                                          },
                                          child: Text(
                                              'already have an account ?, Signin',
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 12 * textScale))),
                                    ),
                                  ))
                                ]),
                                SizedBox(
                                  height: screenWidth * 0.020,
                                ),
                              ]),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class _ResetPasswordMobile extends StatefulWidget {
  _ResetPasswordMobile();

  @override
  _ResetPasswordMobileState createState() => _ResetPasswordMobileState();
}

class _ResetPasswordMobileState extends State<_ResetPasswordMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final countrycodeController = TextEditingController();
  final _formKey2 = GlobalKey<FormBuilderState>();

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

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
//           appBar: AppBar(
//             title: Text("Token Detail",style:TextStyle(fontSize:16*textScale )
// ),
//             backgroundColor: theme.primaryColor,
//             automaticallyImplyLeading: false,
//             elevation: 0.20,
//           ),
          body:
              // BlocConsumer<AuthBloc, AuthState>(
              //   listener: (context, state) {
              // TODO: implement listener
              //       if (state is _SuccessAuthState) {
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
              DefaultTabController(
                  length: 2,
                  child: Container(
                    color: theme.backgroundColor,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 70.0),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                'Forgot Password',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 28),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: theme.backgroundColor,
                          constraints: const BoxConstraints.expand(height: 50),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TabBar(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              indicatorColor: Colors.white,
                              labelColor: Colors.blueGrey,
                              unselectedLabelColor: Colors.black54,
                              isScrollable: true,
                              tabs: <Widget>[
                                Tab(
                                  child: Text(
                                    'Email',
                                    style: TextStyle(fontSize: 14 * textScale),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Phone',
                                    style: TextStyle(fontSize: 14 * textScale),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: theme.backgroundColor,
                            child: TabBarView(children: [
                              Container(
                                color: theme.backgroundColor,
                                child: SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: screenHeight * 0.010,
                                        ),
                                        Row(children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 32,
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                height: screenHeight * 0.055,
                                                color: theme.backgroundColor,
                                                width: screenWidth * 0.750,
                                                child: FormBuilderTextField(
                                                  name: 'countrycode',
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8),

                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade300),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    4.0))),
                                                    labelStyle: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.blueGrey),
                                                    labelText: 'Email Address',

                                                    // errorText: _passwordError,
                                                  ),
                                                  validator:
                                                      FormBuilderValidators
                                                          .compose([
                                                    FormBuilderValidators
                                                        .required(),
                                                    FormBuilderValidators
                                                        .minLength(8),

                                                    // FormBuilderValidators.pass(),
                                                  ]),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                        SizedBox(
                                          height: screenHeight * 0.030,
                                        ),
                                        Row(children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 30)),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              height: screenHeight * 0.055,
                                              color: theme.backgroundColor,
                                              width: screenWidth * 0.300,
                                              child: FormBuilderTextField(
                                                name: 'verification code',
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 8),

                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .shade300),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          4.0))),
                                                  labelStyle: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.blueGrey),
                                                  labelText:
                                                      'Verification Code',

                                                  // errorText: _passwordError,
                                                ),
                                                validator: FormBuilderValidators
                                                    .compose([
                                                  FormBuilderValidators
                                                      .required(),
                                                  FormBuilderValidators
                                                      .minLength(8),

                                                  // FormBuilderValidators.pass(),
                                                ]),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: screenWidth * 0.200,
                                              height: screenHeight * 0.055,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                                color: theme.primaryColor,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(1.0),
                                                child: InkWell(
                                                  // onTap: _signUp,
                                                  child: Center(
                                                    child: Text(
                                                      'Send',
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
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 38)),
                                        ]),
                                        SizedBox(
                                          height: screenWidth * 0.020,
                                        ),
                                        SizedBox(
                                          height: screenWidth * 0.020,
                                        ),
                                        Row(children: [
                                          Expanded(
                                              child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 32,
                                            ),
                                            child: GestureDetector(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                alignment: Alignment.center,
                                                width: screenWidth * 0.750,
                                                height: screenHeight * 0.055,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                  color: theme.primaryColor,
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .push(MaterialPageRoute(
                                                            builder: (context) {
                                                      return ResetPassword2();
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
                                          ))
                                        ]),
                                        SizedBox(
                                          height: screenWidth * 0.020,
                                        ),
                                        Row(children: [
                                          Expanded(
                                              child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 32,
                                            ),
                                            child: Container(
                                              height: screenHeight * 0.030,
                                              // color: Colors.grey,
                                              child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .push(MaterialPageRoute(
                                                            builder: (context) {
                                                      return SignIn();
                                                    }));
                                                  },
                                                  child: Text(
                                                    'already have an account ?, Signin',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize:
                                                            12 * textScale),
                                                  )),
                                            ),
                                          ))
                                        ]),
                                        SizedBox(
                                          height: screenWidth * 0.020,
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: screenHeight * 0.010,
                                      ),
                                      Row(children: [
                                        const Padding(
                                            padding: EdgeInsets.only(left: 35)),
                                        Container(
                                          alignment: Alignment.center,
                                          width: screenWidth * 0.150,
                                          height: screenHeight * 0.055,
                                          color: theme.backgroundColor,
                                          child: Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .push(MaterialPageRoute(
                                                          builder: (context) {
                                                    // return DetailPage(bean);
                                                    return CountryCode();
                                                  }));
                                                },
                                                child: FormBuilderTextField(
                                                  name: 'countrycode',
                                                  controller:
                                                      countrycodeController,

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
                                                      suffixIcon: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            // return DetailPage(bean);
                                                            return CountryCode();
                                                          }));
                                                        },
                                                        child: const Icon(
                                                          FontAwesomeIcons
                                                              .caretDown,
                                                          size: 20,
                                                          color: Colors.black,
                                                        ),
                                                      )),
                                                  // controller: cellphoneController,
                                                  // inputFormatters: [cellphoneFormatter],

                                                  textInputAction:
                                                      TextInputAction.next,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator:
                                                      FormBuilderValidators
                                                          .compose([
                                                    FormBuilderValidators
                                                        .required(),
                                                    FormBuilderValidators.match(
                                                      r"^\(?[1-9]{2}\)? ?(?:[2-8]|9[1-9])[0-9]{3}\-?[0-9]{4}$",
                                                    ),
                                                  ]),
                                                )),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 5)),
                                        Container(
                                          alignment: Alignment.center,
                                          width: screenWidth * 0.650,
                                          height: screenHeight * 0.055,
                                          color: theme.backgroundColor,
                                          child: Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.of(context,
                                                //         rootNavigator: true)
                                                //     .push(MaterialPageRoute(
                                                //         builder: (context) {
                                                //   // return DetailPage(bean);
                                                //   return CountryCode();
                                                // }));
                                              },
                                              child: FormBuilderTextField(
                                                controller: phoneController,
                                                name: 'phonenumber',
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 8),
                                                  labelStyle: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.blueGrey),
                                                  labelText: "Phonenumber",
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .shade300),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          4.0))),

                                                  // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                                  // errorText: _emailError,
                                                ),
                                                validator: FormBuilderValidators
                                                    .compose([
                                                  FormBuilderValidators
                                                      .required(),
                                                ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(right: 0)),
                                      ]),
                                      SizedBox(
                                        height: screenHeight * 0.030,
                                      ),
                                      Row(children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 30)),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            height: screenHeight * 0.055,
                                            color: theme.backgroundColor,
                                            width: screenWidth * 0.600,
                                            child: FormBuilderTextField(
                                              name: 'verificationcode',
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 8),

                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade300),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    4.0))),

                                                labelStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.blueGrey),
                                                labelText: 'Verification Code',

                                                // errorText: _passwordError,
                                              ),
                                              validator: FormBuilderValidators
                                                  .compose([
                                                FormBuilderValidators
                                                    .required(),
                                                FormBuilderValidators.minLength(
                                                    8),

                                                // FormBuilderValidators.pass(),
                                              ]),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: screenWidth * 0.200,
                                            height: screenHeight * 0.055,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              color: theme.primaryColor,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(1.0),
                                              child: InkWell(
                                                onTap: () {
                                                  final validationSuccess =
                                                      _formKey2.currentState!
                                                          .validate();

                                                  if (validationSuccess) {
                                                    //
                                                    // Save only when validation passed
                                                    _formKey2.currentState!
                                                        .save();

                                                    // Get form data
                                                    final formData = _formKey2
                                                        .currentState!.value;
                                                    //                              context.read<AuthBloc>().add(

                                                    //   VerifyEmailAuthEvent(
//                                 countrycode: _formKey2.currentState!.fields['countrycode']?.value,
// phonenumber: _formKey2.currentState!.fields['phonenumber']?.value,
// verificationcode: _formKey2.currentState!.fields['verificationcode']?.value,

                                                    //   ),
                                                    // );
                                                    // Reset form
                                                    _formKey2.currentState!
                                                        .reset();
                                                    // Optional: unfocus keyboard
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    // Optional: Show snackbar
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        duration: Duration(
                                                            seconds: 2),
                                                        content: Text(
                                                            'Validation succeeded -> Data: $formData',
                                                            textScaleFactor:
                                                                1.5),
                                                      ),
                                                    );
                                                  } else {
                                                    // Get form data
                                                    final formData = _formKey2
                                                        .currentState!.value;
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        duration: Duration(
                                                            seconds: 2),
                                                        content: Text(
                                                            'Validation failed! -> Data: $formData',
                                                            textScaleFactor:
                                                                1.5),
                                                      ),
                                                    );
                                                  }

                                                  // Optional: unfocus keyboard
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                child: Center(
                                                  child: Text(
                                                    'Send',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16 * textScale,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(right: 38)),
                                      ]),
                                      SizedBox(
                                        height: screenWidth * 0.020,
                                      ),
                                      SizedBox(
                                        height: screenWidth * 0.020,
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
                                                color: theme.primaryColor,
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .push(MaterialPageRoute(
                                                          builder: (context) {
                                                    return ResetPassword2();
                                                  }));
                                                },
                                                child: Center(
                                                  child: Text(
                                                    'Next',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16 * textScale,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ))
                                      ]),
                                      SizedBox(
                                        height: screenWidth * 0.020,
                                      ),
                                      Row(children: [
                                        Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 32,
                                          ),
                                          child: Container(
                                            height: screenHeight * 0.030,
                                            // color: Colors.grey,
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .push(MaterialPageRoute(
                                                          builder: (context) {
                                                    return SignIn(
                                                        // showResult,
                                                        // changeDisplay,
                                                        // showCreateUser,
                                                        // signOut,
                                                        // fetchSession,
                                                        // getCurrentUser,
                                                        // setError
                                                        );
                                                  }));
                                                },
                                                child: Text(
                                                    'already have an account ?, Signin',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize:
                                                            12 * textScale))),
                                          ),
                                        ))
                                      ]),
                                      SizedBox(
                                        height: screenWidth * 0.020,
                                      ),
                                    ]),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    // ),
                  )
                  // ;
                  // },
                  ),
        ));
  }
}
