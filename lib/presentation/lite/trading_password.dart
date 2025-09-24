import '../../data/models/user.dart';
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
import '../../main.dart';

class Tradingpassword extends StatefulWidget {
  Tradingpassword();

  @override
  _TradingpasswordState createState() => _TradingpasswordState();
}

class _TradingpasswordState extends State<Tradingpassword> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _TradingpasswordMobile(),
          tablet: _TradingpasswordTablet(),
        ),
      ),
    );
  }
}

class _TradingpasswordTablet extends StatefulWidget {
  _TradingpasswordTablet();

  @override
  __TradingpasswordState createState() => __TradingpasswordState();
}

class __TradingpasswordState extends State<_TradingpasswordTablet> {
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
    final _formKey2 = GlobalKey<FormBuilderState>();

    return Scaffold(
      backgroundColor: theme.backgroundColor,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text("Trading Password",
            style: TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
      ),
      //
      body: DefaultTabController(
        length: 2,
        child: Container(
          color: theme.backgroundColor,
          child: Column(
            children: <Widget>[
              Container(
                height: screenHeight * 0.09,
                color: theme.scaffoldBackgroundColor,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
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

              Expanded(
                child: Container(
                  child: Container(
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
                                              suffixIcon: Icon(
                                                FontAwesomeIcons.eyeSlash,
                                                size: 14,
                                              ),
                                              labelStyle:
                                                  TextStyle(fontSize: 18),
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
              ),

//
            ],
          ),
        ),
      ),
    );
  }
}

class _TradingpasswordMobile extends StatefulWidget {
  _TradingpasswordMobile();

  @override
  _TradingpasswordMobileState createState() => _TradingpasswordMobileState();
}

class _TradingpasswordMobileState extends State<_TradingpasswordMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
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

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.2,
          bottomOpacity: 1.0,
          shadowColor: theme.scaffoldBackgroundColor,
          backgroundColor: theme.scaffoldBackgroundColor,
          title: Text("Trading Password",
              style:
                  TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        ),
        //
        body:
            //  BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
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
            // }, builder: (context, state) {
            // User currentuser = state.user;

            // return
            DefaultTabController(
                length: 2,
                child: Container(
                  color: theme.backgroundColor,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: screenHeight * 0.09,
                        color: theme.scaffoldBackgroundColor,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
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

                      FormBuilder(
                        key: _formKey2,
                        skipDisabled: true,
                        child: Container(
                          child: Container(
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 32,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            height: screenHeight * 0.055,
                                            color: theme.backgroundColor,
                                            width: screenWidth * 0.750,
                                            child: FormBuilderTextField(
                                              name: 'oldtradingpassword',
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
                                                labelStyle: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.blueGrey),
                                                labelText: 'Old Password',

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
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            height: screenHeight * 0.055,
                                            color: theme.backgroundColor,
                                            width: screenWidth * 0.750,
                                            child: FormBuilderTextField(
                                              name: 'newtradingpassword',
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
                                                labelText: 'Trading Password',

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
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            height: screenHeight * 0.055,
                                            color: theme.backgroundColor,
                                            width: screenWidth * 0.750,
                                            child: FormBuilderTextField(
                                              name: 'confirmtradingpassword',
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
                                                labelText:
                                                    'Confirm Trading Password',

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
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              color: theme.primaryColor,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(1.0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final validationSuccess =
                                                      _formKey2.currentState!
                                                          .validate();

                                                  if (validationSuccess) {
                                                    //
                                                    // Save only when validation passed
                                                    _formKey2.currentState!
                                                        .save();
                                                    // context.read<AuthBloc>().add(
                                                    //   UpdateTradingPassword(
                                                    //     user: User(
                                                    //       id:currentuser.id,
                                                    //       oldtradingpassword:
                                                    //       newtradingpassword: DateTime.now(),
                                                    //       confirmtradingpassword: _newDescription.text,

                                                    //     ),
                                                    //   ),
                                                    // );

                                                    // Get form data
                                                    final formData = _formKey2
                                                        .currentState!.value;
                                                    //
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
                      0                               SjackBar(
        `                      "               `    !   duration: Duration(
          0       !     !                                   seconds: 2),
                                                        content: Text(
                  $             !                !          'Vclidation succeeded -> Data: $forlData'-
(                       !      !                            textScaleFactor:      `     `      `                      (              "    ` 1.5),
     (  0                         `          "  a     ),
                       !                    `       );
                                           $      } else {
  $   0                            "                //(Get form data
              0         `     "       $ (           final formData = _formKeY2
   (                                               !    .cubbentState!.value;
               0                     "              ScaffoldMessenger.oæ(
(                  0                                        co~text)
                                                 "      .shouSnacKB r(
                         "  "                         Sncck@ar(
                                $                  !    dubaôion: Duration(
 !        $`                  0                             seconds: 2),
   0      $                                             contEnt: Texp(
                                  (               !         '^alidation fay,%d) -> Data: $formData',ˆ       "         0    !                            0      0 dextS#aleFactor:
                                                               01.5).
                 0         `                 (        ),
                                                    );
                     0à             "  `   !      }J
              `    0                  (           // Optional: unfgcus keyboarä
                                                  FocusScope.of(#ontext)                  !                ` 0                ®unfocus();
                         (  $                   },
  $     ! !                                     cèild: Center(
                        (           (   $         child: Taxt(
   !                                      !         'Submit',
     `                                              su{le: TextStyle(
                                                      col/r:$Ãklor.fromARGB(
     !                              0                `    25u, 255, 255, 255)$
        "                  $                          fontSize: 16 * textScale,
 `                        $ ( $       `               fontWeigèt:
                   "    `                   `             FontWeight.w600,
   "       !$        2$         $               0   ),
                                ( "               ),
                                            "   )¬
                                              ),
"                                           ),
            `                             ),
                                        ),
                                     $))
    !                               ]),

                                    RizedBox¨
                "  !              0 ! height: screenWidth * 0.020,
                                 (  ),
                   (           (    //`Container(
           "                     " "//   håigèt: screenHeigHt . 0.030,
                           $        //   chilf: 	nkell(
                     1    !         //     onTap: () z},
                                    //     child: const Center(
                                    //         child: Text(
                                    //             'already have an account ?,then Signin')),
                                    //   ),
                                    // ),
                                    // Column(
                                    //   children: const [
                                    //     Padding(
                                    //       padding: EdgeInsets.symmetric(horizontal: 14.0),
                        $           //   "   chi,d: Text,
                                    // 0       '@Nace .all rights reservdd',
                      !         0   //        !style: TextStyle(
                       0     $      //           fontWeight: FontWeighu.bold,
    0     $    "                    /o  "      ),
   0           (                    //       ),
                             (      //     ),
      0"               $            /.   ],
           0        $      `  "     ./ ),
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
                )));
  }
}
