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

class BecomeMaster extends StatefulWidget {
  BecomeMaster(
  
      );
 
  @override
  _BecomeMasterState createState() => _BecomeMasterState();
}

class _BecomeMasterState extends State<BecomeMaster> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _BecomeMasterMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _BecomeMasterTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _BecomeMasterTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _BecomeMasterTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _BecomeMasterTabletState createState() => _BecomeMasterTabletState();
}

class _BecomeMasterTabletState extends State<_BecomeMasterTablet> {
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
      title: Text('Card Details'),
      content: _CardForm(),
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
            "Join as aTrader",
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
                                          name: 'countrycode',
                                          obscureText:true,
                                          decoration: InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'Country',
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
//         SizedBox(
//           height: screenWidth * 0.030,
//         ),
//         Row(children: [
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 32,
//               ),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 8),
//                 height: screenHeight * 0.055,
//                 color: theme.backgroundColor,
//                 width: screenWidth * 0.750,
//                 child:FormBuilderTextField(

//                                           name: 'walletlabel',
//                                           obscureText:true,
//                                           decoration: InputDecoration(
//                                              contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 8),
                                            
//                                                                                 enabledBorder: OutlineInputBorder(
//                                                 borderSide:BorderSide(color: Colors.grey.shade300) ,
//                                                 borderRadius: BorderRadius.all(Radius.circular(4.0))),

//  labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
//                                             labelText: 'Enter Wallet Label',
                                             
//                                             // errorText: _passwordError,
//                                           ),
//                                           validator:
//                                               FormBuilderValidators.compose([
//                                             FormBuilderValidators.required(),
//                                             FormBuilderValidators.minLength(8),

//                                             // FormBuilderValidators.pass(),
//                                           ]),
//                                         ),
//               ),
//             ),
//           ),
//         ]),
//         SizedBox(
//           height: screenHeight * 0.010,
//         ),
//         SizedBox(
//           height: screenWidth * 0.020,
//         ),
//         Row(children: [
//           Expanded(
//               child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: 29,
//             ),
//             child: Container(
//                height: screenHeight * 0.075,
//               padding: EdgeInsets.all(8.0),
//               color: theme.backgroundColor,
//               width: screenWidth * 0.55,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context, rootNavigator: true)
//                       .push(MaterialPageRoute(builder: (context) {
//                     // return DetailPage(bean);
//                     return SearchListPaymentMeth();
//                   }));
//                 },
//                 child: FormBuilderTextField(
// readOnly:true,
//                                           name: 'countrycode',
//                                           obscureText:true,
//                                           decoration: InputDecoration(
//                                              contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 8),
                                            
//                                                                                  enabledBorder: OutlineInputBorder(
//                                                 borderSide:BorderSide(color: Colors.grey.shade300) ,
//                                                 borderRadius: BorderRadius.all(Radius.circular(4.0))),

//  labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
//                                             labelText: 'Choose Coin',
//                                                suffixIcon: Icon(
//                                                   FontAwesomeIcons.caretDown,
//                                                   size: 17,
//                                                 ),
//                                             // errorText: _passwordError,
//                                           ),
//                                           validator:
//                                               FormBuilderValidators.compose([
//                                             FormBuilderValidators.required(),
//                                             FormBuilderValidators.minLength(8),

//                                             // FormBuilderValidators.pass(),
//                                           ]),
//                                         ),
//               ),
//             ),
//           ))
//         ]),
//         SizedBox(
//           height: screenHeight * 0.020,
//         ),
//         Row(children: [
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 32,
//               ),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 8),
//                 height: screenHeight * 0.055,
//                 color: theme.backgroundColor,
//                 width: screenWidth * 0.750,
//                 child:FormBuilderTextField(

//                                           name: 'enteraddress',
//                                           obscureText:true,
//                                           decoration: InputDecoration(
//                                              contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 8),
                                            
//                                                                              enabledBorder: OutlineInputBorder(
//                                                 borderSide:BorderSide(color: Colors.grey.shade300) ,
//                                                 borderRadius: BorderRadius.all(Radius.circular(4.0))),

//  labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
//                                             labelText: 'Enter Address',
                                            
//                                             // errorText: _passwordError,
//                                           ),
//                                           validator:
//                                               FormBuilderValidators.compose([
//                                             FormBuilderValidators.required(),
//                                             FormBuilderValidators.minLength(8),

//                                             // FormBuilderValidators.pass(),
//                                           ]),
//                                         ),
//               ),
//             ),
//           ),
//         ]),
//         SizedBox(
//           height: screenHeight * 0.020,
//         ),
//         Row(children: [
//           Expanded(
//               child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: 29,
//             ),
//             child: Container(
//               padding: EdgeInsets.all(8.0),
//               color: theme.backgroundColor,
//  height: screenHeight * 0.075,              width: screenWidth * 0.55,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context, rootNavigator: true)
//                       .push(MaterialPageRoute(builder: (context) {
//                     // return DetailPage(bean);
//                     return SearchListPaymentMeth();
//                   }));
//                 },
//                 child: FormBuilderTextField(
// readOnly:true,
//                                           name: 'selectplatform',
//                                           obscureText:true,
//                                           decoration: InputDecoration(
//                                              contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 8),
                                            
//                                                                                enabledBorder: OutlineInputBorder(
//                                                 borderSide:BorderSide(color: Colors.grey.shade300) ,
//                                                 borderRadius: BorderRadius.all(Radius.circular(4.0))),

//  labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
//                                             labelText: 'Select Platform',
//                                                suffixIcon: Icon(
//                                                   FontAwesomeIcons.caretDown,
//                                                   size: 17,
//                                                 ),
//                                             // errorText: _passwordError,
//                                           ),
//                                           validator:
//                                               FormBuilderValidators.compose([
//                                             FormBuilderValidators.required(),
//                                             FormBuilderValidators.minLength(8),

//                                             // FormBuilderValidators.pass(),
//                                           ]),
//                                         ),
//               ),
//             ),
//           ))
//         ]),
//         SizedBox(
//           height: screenWidth * 0.030,
//         ),
//         Row(children: [
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 32,
//               ),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 8),
//                 height: screenHeight * 0.055,
//                 color: theme.backgroundColor,
//                 width: screenWidth * 0.750,
//                 child: FormBuilderTextField(
// readOnly:true,
//                                           name: 'countrycode',
//                                           obscureText:true,
//                                           decoration:  InputDecoration(
//                                              contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 8),
                                            
//                                                                                 enabledBorder: OutlineInputBorder(
//                                                 borderSide:BorderSide(color: Colors.grey.shade300) ,
//                                                 borderRadius: BorderRadius.all(Radius.circular(4.0))),

//  labelStyle: TextStyle(fontSize: 14,color:Colors.blueGrey),
//                                             labelText: 'Enter Wallet Label',
                                             
//                                             // errorText: _passwordError,
//                                           ),
//                                           validator:
//                                               FormBuilderValidators.compose([
//                                             FormBuilderValidators.required(),
//                                             FormBuilderValidators.minLength(8),

//                                             // FormBuilderValidators.pass(),
//                                           ]),
//                                         ),
//               ),
//             ),
//           ),
//         ]),
     
     
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

     Text('Submission Completed'
,          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),   Text('Make a Transfer to kickstart your Master Trader'
,          style: const TextStyle(color: Colors.black38,fontSize: 12, fontWeight: FontWeight.normal),
        ), SizedBox(
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

                                          name: 'from',
                                          obscureText:true,
                                          decoration: InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'From',
                                              
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
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: screenHeight * 0.055,
                color: theme.backgroundColor,
                width: screenWidth * 0.750,
                child:FormBuilderTextField(

                                          name: '',
                                          obscureText:true,
                                          decoration: InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                 enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'To',
                                              
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
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: screenHeight * 0.055,
                color: theme.backgroundColor,
                width: screenWidth * 0.750,
                child: FormBuilderTextField(

                                          name: 'TransferablevAmount',
                                          obscureText:true,
                                          decoration: InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                 enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'Transferable Amount',
                                              
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
      
      
//         SizedBox(
//           height: screenHeight * 0.020,
//         ),
//         Row(children: [
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 32,
//               ),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 8),
//                 height: screenHeight * 0.055,
//                 color: theme.backgroundColor,
//                 width: screenWidth * 0.750,
//                 child: FormBuilderTextField(

//                                           name: 'bankcardno',
//                                           obscureText:true,
//                                           decoration: InputDecoration(
//                                              contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 8),
                                            
//                                                                                 enabledBorder: OutlineInputBorder(
//                                                 borderSide:BorderSide(color: Colors.grey.shade300) ,
//                                                 borderRadius: BorderRadius.all(Radius.circular(4.0))),

//  labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
//                                             labelText: 'Bank Card No',
                                            
//                                             // errorText: _passwordError,
//                                           ),
//                                           validator:
//                                               FormBuilderValidators.compose([
//                                             FormBuilderValidators.required(),
//                                             FormBuilderValidators.minLength(8),

//                                             // FormBuilderValidators.pass(),
//                                           ]),
//                                         ),
//               ),
//             ),
//           ),
//         ]),
//         SizedBox(
//           height: screenHeight * 0.020,
//         ),
//         Row(children: [
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 32,
//               ),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 8),
//                 height: screenHeight * 0.055,
//                 color: theme.backgroundColor,
//                 width: screenWidth * 0.750,
//                 child: FormBuilderTextField(

//                                           name: 'countrycode',
//                                           obscureText:true,
//                                           decoration: InputDecoration(
//                                              contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 8),
                                            
//                                                                                 enabledBorder: OutlineInputBorder(
//                                                 borderSide:BorderSide(color: Colors.grey.shade300) ,
//                                                 borderRadius: BorderRadius.all(Radius.circular(4.0))),

//  labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
//                                             labelText: 'Enter Wallet Label',
                                            
//                                             // errorText: _passwordError,
//                                           ),
//                                           validator:
//                                               FormBuilderValidators.compose([
//                                             FormBuilderValidators.required(),
//                                             FormBuilderValidators.minLength(8),

//                                             // FormBuilderValidators.pass(),
//                                           ]),
//                                         ),
//               ),
//             ),
//           ),
//         ]),
      
      
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
                      children: [Text("Nickname",style: TextStyle(fontSize: 14))],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Country",style: TextStyle(fontSize: 14))],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Telegram",style: TextStyle(fontSize: 14))],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("from",style: TextStyle(fontSize: 14))],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("to",style: TextStyle(fontSize: 14))],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("transfered asmount",style: TextStyle(fontSize: 14))],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("First Name",style: TextStyle(fontSize: 14))],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Last Name",style: TextStyle(fontSize: 14))],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Bank Card No.",style: TextStyle(fontSize: 14))],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [Text("Bank Branch",style: TextStyle(fontSize: 14))],
                    ),
                  ),
                ]),
          )),
    ));
  }
}



class _BecomeMasterMobile extends StatefulWidget {
  // final _formKey = GlobalKey<FormBuilderState>();

  _BecomeMasterMobile();

  @override
  _BecomeMasterMobileState createState() => _BecomeMasterMobileState();
}

class _BecomeMasterMobileState extends State<_BecomeMasterMobile> {
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
      title: Text('Agreement'),
      content: _AddressForm(),
    ),
    Step(
      title: Text(' Submission'),
      content: _CardForm(),
    ),
    Step(
      title: Text(' Start Trading'),
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
            "Join as aTrader",
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
