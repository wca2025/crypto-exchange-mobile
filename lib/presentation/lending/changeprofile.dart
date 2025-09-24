import 'dart:ui';

import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'selecttoken.dart';
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

class ChangeProfile extends StatefulWidget {
  ChangeProfile(
      // Function showResult,
      //  Function changeDisplay,
      // //  Function showCreateUser,
      //   // Function signOut,
      //   // Function fetchSession,
      //    Function getCurrentUser,
      //    Function setError
      );

  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
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
          mobile: _ChangeProfileMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _ChangeProfileTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _ChangeProfileTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _ChangeProfileTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _ChangeProfileTabletState createState() =>
      _ChangeProfileTabletState();
}

class _ChangeProfileTabletState extends State<_ChangeProfileTablet> {
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
      title: Text('Address'),
      content: _AddressForm(),
    ),
    Step(
      title: Text('Profile'),
      content: _ProfileForm(),
    ),
    Step(
      title: Text('Overview'),
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
            "Edit Payment Method",
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
 height: screenHeight * 0.075,              width: screenWidth * 0.55,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    // return DetailPage(bean);
                    return SearchListPaymentMeth();
                  }));
                },
                child: FormBuilderTextField(
readOnly:true,
                                          name: 'streetaddress',
                                          obscureText:true,
                                          decoration: InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                               enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'Street Address',
                                               suffixIcon: Icon(
                                                  FontAwesomeIcons.caretDown,
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
readOnly:true,
                                          name: 'building',
                                          obscureText:true,
                                          decoration:  InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'Apt Suite, Building, etc',
                                             
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
readOnly:true,
                                          name: 'city',
                                          obscureText:true,
                                          decoration:  InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'City',
                                             
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
readOnly:true,
                                          name: 'state',
                                          obscureText:true,
                                          decoration:  InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'State',
                                             
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
readOnly:true,
                                          name: 'zipcode',
                                          obscureText:true,
                                          decoration:  InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'Zip Code',
                                             
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
       ],
    );
  }
}



class _ProfileForm extends StatelessWidget {
  const _ProfileForm({Key? key}) : super(key: key);

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
              height: screenHeight * 0.075,
              width: screenWidth * 0.55,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    // return DetailPage(bean);
                    return SearchListPaymentMeth();
                  }));
                },
                child:FormBuilderTextField(
readOnly:true,

                                          name: 'nickname',
                                          obscureText:true,
                                          decoration: InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                 enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'Nickname',
                                               suffixIcon: Icon(
                                                  FontAwesomeIcons.caretDown,
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
readOnly:true,
                                          name: 'fullname',
                                          obscureText:true,
                                          decoration: InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                 enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'Full Name ',
                                            
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
              horizontal: 29,
            ),
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: theme.backgroundColor,
              height: screenHeight * 0.075,
              width: screenWidth * 0.55,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    // return DetailPage(bean);
                    return SearchListPaymentMeth();
                  }));
                },
                child: FormBuilderTextField(
readOnly:true,
                                          name: 'uid',
                                          obscureText:true,
                                          decoration: InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'UID',
                                               suffixIcon: Icon(
                                                  FontAwesomeIcons.caretDown,
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
                child:FormBuilderTextField(

                                          name: 'walletlabel',
                                          obscureText:true,
                                          decoration: InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'Email',
                                             
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
              horizontal: 29,
            ),
            child: Container(
               height: screenHeight * 0.075,
              padding: EdgeInsets.all(8.0),
              color: theme.backgroundColor,
              width: screenWidth * 0.55,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    // return DetailPage(bean);
                    return SearchListPaymentMeth();
                  }));
                },
                child: FormBuilderTextField(
readOnly:true,
                                          name: 'phonenumber',
                                          obscureText:true,
                                          decoration: InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                 enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'Phone Number',
                                               suffixIcon: Icon(
                                                  FontAwesomeIcons.caretDown,
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
                child:FormBuilderTextField(

                                          name: 'birthday',
                                          obscureText:true,
                                          decoration: InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                             enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'Your Birthday',
                                            
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
        ]), ],
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
                      children: [Text("Nuckname")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Fullname")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("UID")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Email")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Phone Number")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Your Birthday")],
                    ),
                  ),
                
                  ListTile(
                    title: Row(
                      children: [Text("Street Address ")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Building")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("City")],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("State")],
                    ),
                  ),
                    ListTile(
                    title: Row(
                      children: [Text("Zip Code")],
                    ),
                  ),
                ]),
          )),
    ));
  }
}





class _ChangeProfileMobile extends StatefulWidget {
  // final _formKey = GlobalKey<FormBuilderState>();

  _ChangeProfileMobile();

  @override
  _ChangeProfileMobileState createState() =>
      _ChangeProfileMobileState();
}

class _ChangeProfileMobileState extends State<_ChangeProfileMobile> {
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
      title: Text('Profile'),
      content: _ProfileForm(),
    ),
    Step(
      title: Text('Address'),
      content: _AddressForm(),
    ),
 
    Step(
      title: Text('Overview'),
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
            "Change Profile",
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
