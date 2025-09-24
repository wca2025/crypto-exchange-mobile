import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../businesslogic/blocs/auth/auth_bloc.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';

class Antiphishing extends StatefulWidget {
  @override
  _AntiphishingState createState() => _AntiphishingState();
}

class _AntiphishingState extends State<Antiphishing> {
  // Function showResult;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _AntiphishingMobile(),
          tablet: _AntiphishingTablet(),
        ),
      ),
    );
  }
}

class _AntiphishingTablet extends StatefulWidget {
  _AntiphishingTablet();

  @override
  __AntiphishingState createState() => __AntiphishingState();
}

class __AntiphishingState extends State<_AntiphishingTablet> {
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

      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text("Antiphshing Phrase",
            style: TextStyle(fontSize: 14, color: Colors.black87)),
      ),
      //
      body: DefaultTabController(
        length: 2,
        child: Container(
          color: theme.backgroundColor,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: screenHeight * 0.010,
              ),

              SizedBox(
                height: screenHeight * 0.010,
              ),

              Expanded(
                child: FormBuilder(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 32,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  height: screenHeight * 0.055,
                                  color: theme.scaffoldBackgroundColor,
                                  width: screenWidth * 0.750,
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
                                                    horizontal: 5),
                                            labelStyle: TextStyle(fontSize: 18),
                                            labelText: "Old Password",
                                            suffixIcon: Icon(
                                              FontAwesomeIcons.eyeSlash,
                                              size: 14,
                                            ),
                                            border: InputBorder.none,

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
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  height: screenHeight * 0.055,
                                  color: theme.scaffoldBackgroundColor,
                                  width: screenWidth * 0.750,
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
                                                    horizontal: 5),
                                            suffixIcon: Icon(
                                              FontAwesomeIcons.eyeSlash,
                                              size: 14,
                                            ),
                                            labelStyle: TextStyle(fontSize: 18),
                                            labelText: "Password",

                                            border: InputBorder.none,

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
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  height: screenHeight * 0.055,
                                  color: theme.scaffoldBackgroundColor,
                                  width: screenWidth * 0.750,
                                  child: FormBuilderField<String?>(
                                    name: 'name',
                                    onChanged: (val) =>
                                        debugPrint(val.toString()),
                                    builder: (FormFieldState field) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          top: 15,
                                        ),
                                        child: InputDecorator(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 5, right: 5, bottom: 0),
                                            labelStyle: TextStyle(fontSize: 18),
                                            labelText: "Confirm Password",
                                            suffixIcon: Icon(
                                              FontAwesomeIcons.eyeSlash,
                                              size: 14,
                                            ),
                                            border: InputBorder.none,

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
                          ]),

                          SizedBox(
                            height: screenHeight * 0.010,
                          ),

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
                                horizontal: 34,
                              ),
                              child: GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: screenWidth * 0.750,
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
                                          'Submit',
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

//
//
            ],
          ),
        ),
      ),
    );
  }
}

class _AntiphishingMobile extends StatefulWidget {
  _AntiphishingMobile();

  @override
  _AntiphishingMobileState createState() => _AntiphishingMobileState();
}

class _AntiphishingMobileState extends State<_AntiphishingMobile> {
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
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      backgroundColor: theme.backgroundColor,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text("Antiphishing Phrase",
            style: TextStyle(fontSize: 14, color: Colors.black87)),
      ),
      //
      body: 
      // BlocConsumer<AuthBloc, AuthState>(
      //   listener: (context, state) {
          // TODO: implement listener
          //  if (state is SuccessAuthState) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(
          //       duration: Duration(seconds: 2),
          //       content: Text(' succeess ', textScaleFactor: 1.5),
          //     ),
          //   );
          // } else if (state is ErrorAuthState) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(
          //       duration: Duration(seconds: 2),
          //       content: Text(' error ', textScaleFactor: 1.5),
          //     ),
          //   );
          // }
        // },
        // builder: (context, state) {
          // return
           DefaultTabController(
            length: 2,
            child: Container(
              color: theme.backgroundColor,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: screenHeight * 0.010,
                  ),

                  SizedBox(
                    height: screenHeight * 0.010,
                  ),

                  Expanded(
                    child: FormBuilder(
                      key: _formKey,
                      skipDisabled: true,
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
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
                                      color: theme.scaffoldBackgroundColor,
                                      width: screenWidth * 0.750,
                                      child: FormBuilderTextField(
                                        name: 'antiphisingphrase',
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8),

                                          border: InputBorder.none,

                                          labelStyle: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                          labelText: 'Antiphising Phrase',
                                          suffixIcon: Icon(
                                            FontAwesomeIcons.eyeSlash,
                                            size: 17,
                                          ),
                                          // errorText: _passwordError,
                                        ),
                                        validator:
                                            FormBuilderValidators.compose([
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
                                height: screenHeight * 0.010,
                              ),

                              SizedBox(
                                height: screenHeight * 0.010,
                              ),

                              Row(children: [
                                Padding(padding: EdgeInsets.only(left: 30)),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    height: screenHeight * 0.055,
                                    color: theme.scaffoldBackgroundColor,
                                    width: screenWidth * 0.300,
                                    child: FormBuilderTextField(
                                      name: 'verification Code',
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),

                                        border: InputBorder.none,

                                        labelStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey),
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
                                        onTap: (){
                                       

                                        },
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
                              Row(children: [
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 34,
                                  ),
                                  child: GestureDetector(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth * 0.750,
                                      height: screenHeight * 0.055,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        color: theme.primaryColor,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: InkWell(
                                          onTap: () async {
                                            // Get textfield input value
                                            final validationSuccess = _formKey
                                                .currentState!
                                                .validate();

                                            if (validationSuccess) {
                                              //
                                              // Save only when validation passed
                                              _formKey.currentState!.save();
                                              //
                                              // Get form data
                                              final formData =
                                                  _formKey.currentState!.value;
                                              //
                                                      // context
                                                    //     .read<AuthBloc>()
                                                    //     .add(
                                                    //       _ChangeAntiphisingEvent(
                                                    //           verificationcode: _formKey
                                                    //               .currentState!
                                                    //               .fields[
                                                    //                   'verificationcode']
                                                    //               ?.value,
                                                    //      
                                                    //           antiphisingphrase: _formKey
                                                    //               .currentState!
                                                    //               .fields[
                                                    //                   'antiphisingphrase']
                                                    //               ?.value),
                                                    //     );
                                              // Reset form
                                              _formKey.currentState!.reset();
                                              // Optional: unfocus keyboard
                                              FocusScope.of(context).unfocus();
                                              // Optional: Show snackbar
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  duration:
                                                      Duration(seconds: 2),
                                                  content: Text(
                                                      'Validation succeeded -> Data: $formData',
                                                      textScaleFactor: 1.5),
                                                ),
                                              );
                                            } else {
                                              // Get form data
                                              final formData =
                                                  _formKey.currentState!.value;
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  duration:
                                                      Duration(seconds: 2),
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
                                                fontSize: 16 * textScale,
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

//
//
                ],
              ),
            ),
        //   );
        // },
      ),
    );
  }
}
