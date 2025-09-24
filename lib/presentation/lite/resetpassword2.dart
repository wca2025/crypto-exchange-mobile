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

class ResetPassword2 extends StatefulWidget {
  @override
  _ResetPassword2State createState() => _ResetPassword2State();
}

class _ResetPassword2State extends State<ResetPassword2> {
  // Function showResult;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _ResetPassword2Mobile(),
          tablet: _ResetPassword2Tablet(),
        ),
      ),
    );
  }
}

class _ResetPassword2Tablet extends StatefulWidget {
  _ResetPassword2Tablet();

  @override
  __ResetPassword2TabletState createState() => __ResetPassword2TabletState();
}

class __ResetPassword2TabletState extends State<_ResetPassword2Tablet> {
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
            child: Column(
              children: <Widget>[
                const SizedBox(height: 70.0),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                      ),
                      child: Text(
                        'Reset Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 28 * textScale,
                        ),
                      ),
                    ))
                  ],
                ),

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
                                                labelStyle:
                                                    TextStyle(fontSize: 18),
                                                labelText: "Password",
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
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
                                                labelStyle:
                                                    TextStyle(fontSize: 18),
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
                                ),
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
                                    horizontal: 30,
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
                                          // onTap: _signUp,
                                          child: Center(
                                            child: Text(
                                              'Reset ',
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
        ));
  }
}

class _ResetPassword2Mobile extends StatefulWidget {
  _ResetPassword2Mobile();

  @override
  _ResetPassword2MobileState createState() => _ResetPassword2MobileState();
}

class _ResetPassword2MobileState extends State<_ResetPassword2Mobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey2 = GlobalKey<FormBuilderState>();

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
            child: Column(
              children: <Widget>[
                const SizedBox(height: 70.0),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                      ),
                      child: Text(
                        'Reset Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 28 * textScale,
                        ),
                      ),
                    ))
                  ],
                ),

                FormBuilder(
                  key: _formKey2,
                  skipDisabled: true,
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
                                        name: 'password',
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8),

                              enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                          labelStyle: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                          labelText: 'Password',

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
                                        name: 'confirmpassword',
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8),

                                                  enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

                                          labelStyle: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                          labelText: 'Confirm Password',

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
                                height: screenWidth * 0.020,
                              ),
                              Row(children: [
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
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
                                            final validationSuccess = _formKey2
                                                .currentState!
                                                .validate();

                                            if (validationSuccess) {
                                              //
                                              // Save only when validation passed
                                              _formKey2.currentState!.save();

                                              // Get form data
                                              final formData =
                                                  _formKey2.currentState!.value;
                                              //                              context.read<AuthBloc>().add(

                                              //   ResetPasswordAuthEvent(
                                              //     password: _formKey2.currentState!.fields['password']?.value,
                                              //     confirmpassword: _formKey2.currentState!.fields['confirmpassword']?.value,

                                              //   ),
                                              // );
                                              // Reset form
                                              _formKey2.currentState!.reset();
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
                                                  _formKey2.currentState!.value;
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
                                              'Reset ',
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
          // },
          ),
    );
  }
}
