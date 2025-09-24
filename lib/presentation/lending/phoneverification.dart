import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../businesslogic/blocs/auth/auth_bloc.dart';
import '../../data/models/user.dart';
import 'countrycode.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import '../../main.dart';

class PhoneVerification extends StatefulWidget {
  // PhoneVerification(
  //     // Function showResult,
  //     //  Function changeDisplay,
  //     // //  Function showCreateUser,
  //     //   // Function signOut,
  //     //   // Function fetchSession,
  //     //    Function getCurrentUser,
  //     //    Function setError
  //     );

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  // Function showResult;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _PhoneVerificationMobile(),
          tablet: _PhoneVerificationTablet(),
        ),
      ),
    );
  }
}

class _PhoneVerificationTablet extends StatefulWidget {
  _PhoneVerificationTablet();

  @override
  __PhoneVerificationState createState() => __PhoneVerificationState();
}

class __PhoneVerificationState extends State<_PhoneVerificationTablet> {
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
        automaticallyImplyLeading: false,
        elevation: 0.5,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          'Bind Phone Number ',
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
            // SizedBox(height: screenHeight * 0.060),

            Expanded(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Container(
                              alignment: Alignment.center,
                              width: screenWidth * 0.150,
                              height: screenHeight * 0.055,
                              color: theme.backgroundColor,
                              child: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
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
                                        padding: EdgeInsets.only(top: 15),
                                        child: InputDecorator(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            labelStyle: TextStyle(fontSize: 18),
                                            labelText: "",
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade300),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.0))),

                                            suffixIcon: Icon(
                                              FontAwesomeIcons.caretDown,
                                              size: 17,
                                            ),
                                            // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                          ),
                                        ),
                                      );
                                    },
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (valueCandidate) {
                                      if (valueCandidate?.isEmpty ?? true) {
                                        return 'This field is required.';
                                      }
                                      return null;
                                    },
                                  ),

                                  //                                         child:
                                  //                                         FormBuilderPhoneField(
                                  //   name: 'phone_number',
                                  //   decoration: const InputDecoration(
                                  //     labelText: 'Phone Number',
                                  //     hintText: 'Hint',
                                  //   ),
                                  //   priorityListByIsoCode: ['KE'],
                                  //   // validator: FormBuilderValidators.compose([
                                  //   //   FormBuilderValidators.required(context),
                                  //   // ]),
                                  //    autovalidateMode:
                                  //                                               AutovalidateMode.always,
                                  //                                           validator: (valueCandidate) {
                                  //                                             if (valueCandidate?.isEmpty ??
                                  //                                                 true) {
                                  //                                               return 'This field is required.';
                                  //                                             }
                                  //                                             return null;
                                  //                                           },
                                  // ),
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                width: screenWidth * 0.610,
                                height: screenHeight * 0.055,
                                color: theme.backgroundColor,
                                child: Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
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
                                          padding: EdgeInsets.only(top: 15),
                                          child: InputDecorator(
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              labelStyle:
                                                  TextStyle(fontSize: 18),
                                              labelText: "Phone Number",
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .grey.shade300),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              4.0))),

                                              // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                            ),
                                          ),
                                        );
                                      },
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (valueCandidate) {
                                        if (valueCandidate?.isEmpty ?? true) {
                                          return 'This field is required.';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 0)),
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
                                child: FormBuilderField<String?>(
                                  name: 'name',
                                  onChanged: (val) =>
                                      debugPrint(val.toString()),
                                  builder: (FormFieldState field) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: InputDecorator(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 2),
                                          labelStyle: TextStyle(fontSize: 16),
                                          labelText: "Verification Code",

                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),

                                          // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                        ),
                                      ),
                                    );
                                  },
                                  autovalidateMode: AutovalidateMode.always,
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
                                  borderRadius: BorderRadius.circular(2.0),
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

class _PhoneVerificationMobile extends StatefulWidget {
  _PhoneVerificationMobile();

  @override
  _PhoneVerificationMobileState createState() =>
      _PhoneVerificationMobileState();
}

class _PhoneVerificationMobileState extends State<_PhoneVerificationMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey2 = GlobalKey<FormBuilderState>();

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
        automaticallyImplyLeading: false,
        elevation: 0.5,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          'Bind Phone Number ',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [],
      ),
      // backgroundColor: Colors.grey[300],
      body: Container(
          child:
              //  BlocConsumer<AuthBloc, AuthState>(
              //   listener: (context, state) {
              // TODO: implement listener
              //   if (state is _SuccessAuthState) {
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
              //  return
              DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            // SizedBox(height: screenHeight * 0.020),

            FormBuilder(
              key: _formKey2,
              skipDisabled: true,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Container(
                              alignment: Alignment.center,
                              width: screenWidth * 0.150,
                              height: screenHeight * 0.055,
                              color: theme.backgroundColor,
                              child: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
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
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),
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
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.match(
                                          r"^\(?[1-9]{2}\)? ?(?:[2-8]|9[1-9])[0-9]{3}\-?[0-9]{4}$",
                                        ),
                                      ]),
                                    )),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Container(
                              alignment: Alignment.center,
                              width: screenWidth * 0.610,
                              height: screenHeight * 0.055,
                              color: theme.backgroundColor,
                              child: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context, rootNavigator: true)
                                    //     .push(MaterialPageRoute(
                                    //         builder: (context) {
                                    //   // return DetailPage(bean);
                                    //   return CountryCode();
                                    // }));
                                  },
                                  child: FormBuilderTextField(
                                    name: 'phonenumber',
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
                                      labelText: 'Phone Number',

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
                            Padding(padding: EdgeInsets.only(right: 0)),
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
                                  name: 'verification Code',
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
                                    onTap: () {},
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
                                        final validationSuccess =
                                            _formKey2.currentState!.validate();

                                        if (validationSuccess) {
                                          //
                                          // Save only when validation passed
                                          _formKey2.currentState!.save();

                                          //                        context.read<AuthBloc>().add(
                                          //   _VerifyPhoneAuthEvent(
                                          //     user: User(
                                          //       countrycode: _formKey.currentState!.fields['countrycode']?.value,
                                          //       phonenumber: _formKey.currentState!.fields['phonenumber']?.value,
                                          //       verificationcode: _formKey.currentState!.fields['verificationcode']?.value

                                          //     ),
                                          //   ),
                                          // );
                                          // Get form data
                                          final formData =
                                              _formKey2.currentState!.value;
                                          //
                                          // Reset form
                                          _formKey2.currentState!.reset();
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
                                              _formKey2.currentState!.value;
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
                                      child: const Center(
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
      )
          // ;
          //   },
          // )
          ),
    );
  }
}
