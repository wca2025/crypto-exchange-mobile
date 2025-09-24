import 'dart:ui';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'selecttoken.dart';
import 'package:flutter/services.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:awesome_stepper/awesome_stepper.dart';
import '../../main.dart';

class P2pMerchant extends StatefulWidget {
  P2pMerchant(
      // Function showResult,
      //  Function changeDisplay,
      // //  Function showCreateUser,
      //   // Function signOut,
      //   // Function fetchSession,
      //    Function getCurrentUser,
      //    Function setError
      );

  @override
  _P2pMerchantState createState() => _P2pMerchantState();
}

class _P2pMerchantState extends State<P2pMerchant> {
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
          mobile: _P2pMerchantMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _P2pMerchantTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _P2pMerchantTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _P2pMerchantTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _P2pMerchantTabletState createState() => _P2pMerchantTabletState();
}

class _P2pMerchantTabletState extends State<_P2pMerchantTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  @override
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Padding(
        padding: EdgeInsets.only(right: 230),
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

  int _activeCurrentStep = 0;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  static const _steps = [
    Step(
      title: Text('General'),
      content: _AddressForm(),
    ),
    Step(
      title: Text('ID'),
      content: _CardForm(),
    ),
    Step(
      title: Text('Assets'),
      content: _Overview(),
    )
  ];

  int _currentStep = 0;

  _stepState(int step) {
    if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
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
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: Text(
            "Apply as Merchant",
            style: TextStyle(fontSize: 14 * textScale, color: Colors.black87),
          ),
        ),
        body: Container(
          color: theme.backgroundColor,
          child: Stepper(
            elevation: 0,
            type: StepperType.horizontal,
            onStepTapped: (step) => setState(() => _currentStep = step),
            onStepContinue: () {
              setState(() {
                if (_currentStep < _steps.length - 1) {
                  _currentStep += 1;
                } else {
                  _currentStep = 0;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (_currentStep > 0) {
                  _currentStep -= 1;
                } else {
                  _currentStep = 0;
                }
              });
            },
            currentStep: _currentStep,
            steps: _steps,
            controlsBuilder: (BuildContext context, ControlsDetails controls) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 30),
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
                              onTap: controls.onStepContinue,
                              child: const Center(
                                child: Text(
                                  'Next',
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
                    )),
                    SizedBox(
                      width: 5.0,
                    ),
                    if (_currentStep != 0)
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
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
                                onTap: controls.onStepCancel,
                                child: const Center(
                                  child: Text(
                                    'back',
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
                      )),
                    SizedBox(
                      width: 5.0,
                    ),
                  ]);
            },
          ),
        ));
  }
}

class _AddressForm extends StatelessWidget {
  const _AddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Column(
      children: [
        Row(children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 29,
            ),
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: theme.backgroundColor,
              height: screenHeight * 0.060,
              width: screenWidth * 0.55,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context, rootNavigator: true)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   // return DetailPage(bean);
                  //   return SearchList();
                  // }));
                },
                child: FormBuilderTextField(
                  name: 'email',
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    labelText: "Country/Region",
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
          ))
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
                color: theme.backgroundColor,
                width: screenWidth * 0.750,
                child: FormBuilderTextField(
                  name: 'email',
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    labelText: " Name",
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
          ),
        ]),
        SizedBox(
          height: screenHeight * 0.020,
        ),
        Row(children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 29,
            ),
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: theme.backgroundColor,
              height: screenHeight * 0.060,
              width: screenWidth * 0.55,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context, rootNavigator: true)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   // return DetailPage(bean);
                  //   return SearchList();
                  // }));
                },
                child: FormBuilderTextField(
                  name: 'email',
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    labelText: "Email",
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
          ))
        ]),
        SizedBox(
          height: screenWidth * 0.030,
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
                color: theme.backgroundColor,
                width: screenWidth * 0.750,
                child: FormBuilderTextField(
                  name: 'phone',
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    labelText: "Phone",
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
              horizontal: 29,
            ),
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: theme.backgroundColor,
              height: screenHeight * 0.060,
              width: screenWidth * 0.55,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context, rootNavigator: true)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   // return DetailPage(bean);
                  //   return SearchList();
                  // }));
                },
                child: FormBuilderTextField(
                  name: 'Telegram',
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    labelText: "",
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
          ))
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
                color: theme.backgroundColor ,
                width: screenWidth * 0.750,
                child: FormBuilderTextField(
                  name: 'otc funds',
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    labelText: "OTC Funds",
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
          ),
        ]),
        SizedBox(
          height: screenHeight * 0.020,
        ),
        Row(children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 29,
            ),
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: theme.backgroundColor,
              height: screenHeight * 0.060,
              width: screenWidth * 0.55,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context, rootNavigator: true)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   // return DetailPage(bean);
                  //   return SearchList();
                  // }));
                },
                child: FormBuilderTextField(
                  name: 'fiatmarket',
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    labelText: "Fiat Market",
                                                           enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),


                    // errorText: _emailError,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    
                  ]),
                ),
              ),
            ),
          ))
        ]),
        SizedBox(
          height: screenWidth * 0.030,
        ),
      ],
    );
  }
}

class _CardForm extends StatelessWidget {
  const _CardForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    return Column(
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
                color: theme.backgroundColor,
                width: screenWidth * 0.750,
                child: FormBuilderTextField(
                  name: 'pof',
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    labelText: "Proof of source fo Ownershi[",
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
                color: theme.backgroundColor,
                width: screenWidth * 0.750,
                child: FormBuilderTextField(
                  name: 'cashflow',
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    labelText: "Cash flow statement",
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
                color: theme.backgroundColor,
                width: screenWidth * 0.750,
                child:  TextField(
                  // controller: usernameController,
                  obscureText: false,

                  decoration: InputDecoration(
                                                         enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

                    labelText: 'Front of ID',
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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: screenHeight * 0.055,
                color: theme.backgroundColor,
                width: screenWidth * 0.750,
                child: FormBuilderTextField(
                  name: 'PictureID',
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    labelText: " Picture of ID",
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
                color: theme.backgroundColor,
                width: screenWidth * 0.750,
                child: FormBuilderTextField(
                  name: 'bankbranch',
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    labelStyle: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    labelText: "Bank Branch",
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
        ]),
      ],
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    return Container(
        child: Padding(
      padding: EdgeInsets.only(left: 1, right: 1, top: 1),
      child: Container(
          alignment: Alignment.center,
          width: screenWidth * 0.750,
          height: screenHeight * 0.75,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Row(
                      children: [Text("Country/Region")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Name")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Email")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Phone")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Telegram")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Otc")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Fiat Market")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Proof Of Source Funds")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Cash Flow Statement")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Front Of ID")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Picture with ID")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Bank Branch")],
                    ),
                  ),
                ]),
          )),
    ));
  }
}

class _P2pMerchantMobile extends StatefulWidget {
  // final _formKey = GlobalKey<FormBuilderState>();

  _P2pMerchantMobile();

  @override
  _P2pMerchantMobileState createState() => _P2pMerchantMobileState();
}

class _P2pMerchantMobileState extends State<_P2pMerchantMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  @override
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Padding(
        padding: EdgeInsets.only(right: 230),
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

  int _activeCurrentStep = 0;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  static const _steps = [
    Step(
      title: Text('General'),
      content: _AddressForm(),
    ),
    Step(
      title: Text('ID'),
      content: _CardForm(),
    ),
    Step(
      title: Text('Assets'),
      content: _Overview(),
    )
  ];

  int _currentStep = 0;

  _stepState(int step) {
    if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
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
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: Text(
            "Apply as Merchant",
            style: TextStyle(fontSize: 14 * textScale, color: Colors.black87),
          ),
        ),
        body: Container(
          color: theme.backgroundColor,
          child: Stepper(
            elevation: 0,
            type: StepperType.horizontal,
            onStepTapped: (step) => setState(() => _currentStep = step),
            onStepContinue: () {
              setState(() {
                if (_currentStep < _steps.length - 1) {
                  _currentStep += 1;
                } else {
                  _currentStep = 0;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (_currentStep > 0) {
                  _currentStep -= 1;
                } else {
                  _currentStep = 0;
                }
              });
            },
            currentStep: _currentStep,
            steps: _steps,
            controlsBuilder: (BuildContext context, ControlsDetails controls) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 30),
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
                              onTap: controls.onStepContinue,
                              child: Center(
                                child: Text(
                                  'Next',
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
                    )),
                    SizedBox(
                      width: 5.0,
                    ),
                    if (_currentStep != 0)
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
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
                                onTap: controls.onStepCancel,
                                child: Center(
                                  child: Text(
                                    'back',
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
                      )),
                    SizedBox(
                      width: 5.0,
                    ),
                  ]);
            },
          ),
        ));
  }
}
