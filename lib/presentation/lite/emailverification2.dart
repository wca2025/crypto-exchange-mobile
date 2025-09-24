import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../businesslogic/blocs/auth/auth_bloc.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import '../../main.dart';

class EmailPhoneVerification2 extends StatefulWidget {
  // EmailPhoneVerification2(
  //     // Function showResult,
  //     //  Function changeDisplay,
  //     // //  Function showCreateUser,
  //     //   // Function signOut,
  //     //   // Function fetchSession,
  //     //    Function getCurrentUser,
  //     //    Function setError
  //     );

  @override
  _EmailPhoneVerification2State createState() =>
      _EmailPhoneVerification2State();
}

class _EmailPhoneVerification2State extends State<EmailPhoneVerification2> {
  // Function showResult;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _EmailPhoneVerification2Mobile(),
          tablet: _EmailPhoneVerification2Tablet(),
        ),
      ),
    );
  }
}

class _EmailPhoneVerification2Tablet extends StatefulWidget {
  _EmailPhoneVerification2Tablet();

  @override
  __EmailPhoneVerification2State createState() =>
      __EmailPhoneVerification2State();
}

class __EmailPhoneVerification2State
    extends State<_EmailPhoneVerification2Tablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
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
    super.dispose();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          'Bind Email Address',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [],
      ),
      // backgroundColor: Colors.grey[300],
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            SizedBox(height: screenHeight * 0.020),

            Expanded(
              child: Container(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.020,
                          ),

                          Row(children: [
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: screenHeight * 0.055,
                                color: theme.backgroundColor,
                                width: screenWidth * 0.300,
                                child: const TextField(
                                  // controller: usernameController,
                                  obscureText: false,

                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Verification code',
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: screenWidth * 0.200,
                                height: screenHeight * 0.055,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.0),
                                  color: theme.primaryColor,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: InkWell(
                                    // onTap: _signUp,
                                    child: Center(
                                      child: Text(
                                        'Send',
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
                            Padding(padding: EdgeInsets.only(right: 38)),
                          ]),
                          SizedBox(
                            height: screenHeight * 0.010,
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
                                    borderRadius: BorderRadius.circular(3.0),
                                    color: theme.primaryColor,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: InkWell(
                                      // onTap: _signUp,
                                      child: Center(
                                        child: Text(
                                          'Submit',
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

                          SizedBox(
                            height: screenWidth * 0.020,
                          ),
                          // Container(
                          //   height: screenHeight * 0.030,
                          //   child: InkWell(
                          //     onTap: () {},
                          //     child: const Center(
                          //         child: Text(
                          //             'already have an account ?,then Signin')),
                          //   ),
                          // ),
                          // Column(
                          //   children: const [
                          //     Padding(
                          //       padding: EdgeInsets.symmetric(horizontal: 14.0),
                          //       child: Text(
                          //         '@Nice .all rights reserved',
                          //         style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: screenWidth * 0.020,
                          ),
                        ]),
                  ),
                ),
              ),
            ),

//
          ],
        ),
      ),
    );
  }
}

class _EmailPhoneVerification2Mobile extends StatefulWidget {
  _EmailPhoneVerification2Mobile();

  @override
  _EmailPhoneVerification2MobileState createState() =>
      _EmailPhoneVerification2MobileState();
}

class _EmailPhoneVerification2MobileState
    extends State<_EmailPhoneVerification2Mobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
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
    super.dispose();
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          'Bind Email Address',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [],
      ),
      // backgroundColor: Colors.grey[300],
      body:
          // BlocConsumer<AuthBloc, AuthState>(
          //   listener: (context, state) {
          // TODO: implement listener
          //   if (state is SuccessAuthState) {
          //   ScaffoldMessenger.of(context).showSnackBar((
          //     const SnackBar(
          //       duration: Duration(seconds: 2),
          //       content: Text(' succeess ', textScaleFactor: 1.5),
          //     ),
          //   );
          // }         else if (state is ErrorAuthState) {

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
        child: Column(
          children: <Widget>[
            // SizedBox(height: screenHeight * 0.020),

            FormBuilder(
              key: _formKey,
              skipDisabled: true,
              child: Expanded(
                child: Container(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(
                            //   height: screenHeight * 0.010,
                            // ),
                            Container(
                              height: screenHeight * 0.09,
                              color: theme.scaffoldBackgroundColor,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Text(
                                              '- cx will be temporarily disabled them after 24hrs  of this setting ',
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
                                  ]),
                            ),
                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            Row(children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 32,
                                  ),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    height: screenHeight * 0.055,
                                    color: theme.backgroundColor,
                                    width: screenWidth * 0.750,
                                    child: FormBuilderTextField(
                                      name: 'email',
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),

                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade300),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0))),

                                        labelStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey),
                                        labelText: 'Email',

                                        // errorText: _passwordError,
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.minLength(8),

                                        // FormBuilderValidators.pass(),
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            ]),

                            SizedBox(
                              height: screenHeight * 0.020,
                            ),

                            Row(children: [
                              Padding(padding: EdgeInsets.only(left: 30)),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  height: screenHeight * 0.055,
                                  color: theme.backgroundColor,
                                  width: screenWidth * 0.300,
                                  child: FormBuilderTextField(
                                    name: 'verificationcode',
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 8),

                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade300),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0))),

                                      labelStyle: const TextStyle(
                                          fontSize: 14, color: Colors.blueGrey),
                                      labelText: 'Verification Code',

                                      // errorText: _passwordError,
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.minLength(8),

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
                                    borderRadius: BorderRadius.circular(2.0),
                                    color: theme.primaryColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: InkWell(
                                      onTap: () {
                                        // Get textfield input value
                                        final validationSuccess =
                                            _formKey.currentState!.validate();

                                        if (validationSuccess) {
                                          //
                                          // Save only when validation passed
                                          _formKey.currentState!.save();
                                          //

                                          //   _VerifyEmailAuthEvent(
                                          //     verificationcode:_formKey.currentState!.fields['verificationcode']?.value,
                                          //                                     email:_formKey.currentState!.fields['email']?.value,

                                          // );
                                          // Get form data
                                          final formData =
                                              _formKey.currentState!.value;
                                          //
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
                                      child: Center(
                                        child: Text(
                                          'Send',
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
                              Padding(padding: EdgeInsets.only(right: 38)),
                            ]),
                            SizedBox(
                              height: screenHeight * 0.010,
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
                                      borderRadius: BorderRadius.circular(3.0),
                                      color: theme.primaryColor,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child: InkWell(
                                        onTap: () async {
                                          // Get textfield input value
                                          final validationSuccess =
                                              _formKey.currentState!.validate();

                                          if (validationSuccess) {
                                            //
                                            // Save only when validation passed
                                            _formKey.currentState!.save();
                                            // context.read<AuthBloc>().add(
                                            //   _VerifyCheckEmailAuthEvent(
                                            //     verificationcode:_formKey.currentState!.fields['verificationcode']?.value,
                                            //     email:_formKey.currentState!.fields['email']?.value

                                            //   ),

                                            // );

                                            // Get form data
                                            final formData =
                                                _formKey.currentState!.value;

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
                                        child: Center(
                                          child: Text(
                                            'Submit',
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

                            SizedBox(
                              height: screenWidth * 0.020,
                            ),
                            //   height: screenHeight * 0.030,
                            //   child: InkWell(
                            //     onTap: () {},
                            //     child: const Center(
                            //         child: Text(
                            //             'already have an account ?,then Signin')),
                            //   ),
                            // ),
                            // Column(
                            //   children: const [
                            //     Padding(
                            //       padding: EdgeInsets.symmetric(horizontal: 14.0),
                            //       child: Text(
                            //         '@Nice .all rights reserved',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: screenWidth * 0.020,
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            )

//
          ],
        ),
        //   );
        // },
      ),
    );
  }
}
