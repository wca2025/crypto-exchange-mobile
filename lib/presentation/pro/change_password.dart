import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../businesslogic/blocs/auth/auth_bloc.dart';
import '../../data/models/user.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';

class Changepassword extends StatefulWidget {
  @override
  _ChangepasswordState createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  // Function showResult;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _ChangepasswordMobile(),
          tablet: _ChangepasswordTablet(),
        ),
      ),
    );
  }
}

class _ChangepasswordTablet extends StatefulWidget {
  _ChangepasswordTablet();

  @override
  __ChangepasswordState createState() => __ChangepasswordState();
}

class __ChangepasswordState extends State<_ChangepasswordTablet> {
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
        title: Text("Change Password",
            style: TextStyle(fontSize: 14, color: Colors.black87)),
      ),
      //
      body: DefaultTabController(
        length: 2,
        child: Container(
          color: theme.backgroundColor,
          child: Column(
            children: <Widget>[
              Expanded(
                child: FormBuilder(
                  child: (SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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

                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade300),
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
                                            labelStyle: TextStyle(fontSize: 18),
                                            labelText: "Confirm Password",
                                            suffixIcon: Icon(
                                              FontAwesomeIcons.eyeSlash,
                                              size: 14,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade300),
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
                                          'Change',
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
                  )),
                ),
              )
//
            ],
          ),
        ),
      ),
    );
  }
}

class _ChangepasswordMobile extends StatefulWidget {
  _ChangepasswordMobile();

  @override
  _ChangepasswordMobileState createState() => _ChangepasswordMobileState();
}

class _ChangepasswordMobileState extends State<_ChangepasswordMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

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
          title: Text("Change Password",
              style: TextStyle(fontSize: 14, color: Colors.black87)),
        ),
        //
        body:
            // BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
            // TODO: implement listener
            //  if (state is _SuccessAuthState) {
            //     ScaffoldMessenger.of(context).showSnackBar((
            //       const SnackBar(
            //         duration: Duration(seconds: 2),
            //         content: Text(' succeess ', textScaleFactor: 1.5),
            //       ),
            //     );
            //   } else if (state is _ErrorAuthState) {
            //     ScaffoldMessenger.of(context).showSnackBar((
            //       const SnackBar(
            //         duration: Duration(seconds: 2),
            //         content: Text(' error ', textScaleFactor: 1.5),
            //       ),
            //     );
            //   }
            // }, builder: (context, state) {
            // User currentUser = state.user;
            // if (state is _DisplaySpecificAuthState) {
            // return
            DefaultTabController(
          length: 2,
          child: Container(
            color: theme.backgroundColor,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: FormBuilder(
                    child: (SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                                      name: 'password',
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),

                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade300),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0))),

                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey),
                                        labelText: 'Password',

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
                                        labelText: 'Confirm Password',

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
                                            //
                                            // Get form data
                                            final formData =
                                                _formKey.currentState!.value;
                                            //

                                            // context.read<AuthBloc>().add(
                                            //       _VerifyPhoneCheckEvent(
                                            //         user: User(
                                            //           id: currentUser.id,
                                            //           updatedAt:
                                            //               DateTime.now(),
                                            //           confirmpassword: _formKey
                                            //               .currentState!
                                            //               .fields[
                                            //                   'confirmpassword']
                                            //               ?.value,
                                            //           password: _formKey
                                            //               .currentState!
                                            //               .fields['password']
                                            //               ?.value,
                                            //         ),
                                            //       ),
                                            //     );

                                            Navigator.of(context).popUntil(
                                                (route) => route.isFirst);

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
                                            'Change',
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
                    )),
                  ),
                )
//
              ],
            ),
          ),
        )
        // }

        );
  }
}
