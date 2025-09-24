import 'dart:ui';

import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../businesslogic/blocs/p2p/p2p_bloc.dart';
import 'selecttoken.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'selecttoken.dart';

import '../../main.dart';

class P2pAppeal extends StatefulWidget {
  P2pAppeal(
      // Function showResult,
      //  Function changeDisplay,
      // //  Function showCreateUser,
      //   // Function signOut,
      //   // Function fetchSession,
      //    Function getCurrentUser,
      //    Function setError
      );

  @override
  _AppealState createState() => _AppealState();
}

class _AppealState extends State<P2pAppeal> {
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
          mobile: _AppealMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _AppealTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _AppealTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _AppealTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __AppealTabletState createState() => __AppealTabletState();
}

class __AppealTabletState extends State<_AppealTablet> {
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
        padding: EdgeInsets.only(right: 270),
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
        title: Text("P2pAppeal",
            style: TextStyle(fontSize: 16 * textScale, color: Colors.black)),
      ),
      body: Container(
        child: ListView(
          // controller: _controller,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: <Widget>[
            SizedBox(height: screenHeight * 0.040),
            //            Row(children:[    Expanded(child:   Padding( padding: EdgeInsets.symmetric(horizontal:32,), child:
            //   Text(
            //     'Appeal',
            //     textAlign: TextAlign.left,
            //     style: TextStyle(
            //       color: Colors.black,
            //     ),
            //   ),
            // ))],),
            // SizedBox(
            //   height: screenHeight * 0.010,
            // ),

            //                Row(children:[    Expanded(child:   Padding( padding: EdgeInsets.symmetric(horizontal:32,), child:
            //       Text(
            //         'Appeal',
            //         textAlign: TextAlign.left,
            //         style: TextStyle(
            //           color: Colors.black,
            //         ),
            //       ),
            //     ))],),
            Container(
              child: Container(
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
                              horizontal: 29,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(4.0),
                              color: theme.scaffoldBackgroundColor,
                              height: screenHeight * 0.070,
                              width: screenWidth * 0.55,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    // return DetailPage(bean);
                                    return SearchListAppeal();
                                  }));
                                },
                                child: FormBuilderTextField(
                                  name: '',
                                  decoration:  InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    labelStyle: TextStyle(
                                        fontSize: 14, color: Colors.blueGrey),
                                    labelText: "",
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
                          height: screenHeight * 0.010,
                        ),

                        Row(children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 32,
                              ),
                              child: Container(
                                // height: screenHeight * 0.055,
                                color: theme.scaffoldBackgroundColor,
                                width: screenWidth * 0.750,
                                child:  TextField(
                                  maxLines: 6,
                                  minLines: 5,
                                  // controller: usernameController,
                                  obscureText: false,

                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                    labelText: '',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),

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
                                height: screenHeight * 0.055,
                                color: theme.scaffoldBackgroundColor,
                                width: screenWidth * 0.750,
                                child:  TextField(
                                  // controller: usernameController,
                                  obscureText: false,

                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                    labelText: '',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),

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
                                    labelText: '',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),

                        SizedBox(
                          height: screenWidth * 0.060,
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
                                  borderRadius: BorderRadius.circular(3),
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

                        //               Container(
                        //   height: screenHeight*0.030,
                        //   // color: Colors.grey,
                        //   child:  InkWell(
                        //     // onTap: ,
                        //     child: Center(child: Text('Forgot Password')),
                        //   ),
                        // ),
                        SizedBox(
                          height: screenWidth * 0.020,
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppealMobile extends StatefulWidget {
  // final _formKey = GlobalKey<FormBuilderState>();

  _AppealMobile();

  @override
  _AppealMobileState createState() => _AppealMobileState();
}

class _AppealMobileState extends State<_AppealMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  @override
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Padding(
        padding: EdgeInsets.only(right: 270),
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
        title: Text("P2pAppeal",
            style: TextStyle(fontSize: 16 * textScale, color: Colors.black)),
      ),
      body:
      //  BlocConsumer<P2pBloc, P2pState>(
      //   listener: (context, state) {
          // TODO: implement listener
          //   if (state is SuccessP2pState) {
          //   ScaffoldMessenger.of(context).showSnackBar((
          //     const SnackBar(
          //       duration: Duration(seconds: 2),
          //       content: Text(' succeess ', textScaleFactor: 1.5),
          //     ),
          //   );
          // }         else if (state is ErrorP2pState) {

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
           Container(
            child: ListView(
              // controller: _controller,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: <Widget>[
                SizedBox(height: screenHeight * 0.040),
                //            Row(children:[    Expanded(child:   Padding( padding: EdgeInsets.symmetric(horizontal:32,), child:
                //   Text(
                //     'Appeal',
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //       color: Colors.black,
                //     ),
                //   ),
                // ))],),
                // SizedBox(
                //   height: screenHeight * 0.010,
                // ),

                //                Row(children:[    Expanded(child:   Padding( padding: EdgeInsets.symmetric(horizontal:32,), child:
                //       Text(
                //         'Appeal',
                //         textAlign: TextAlign.left,
                //         style: TextStyle(
                //           color: Colors.black,
                //         ),
                //       ),
                //     ))],),
                Container(
                  child: Container(
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
              horizontal: 29,
            ),
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: theme.backgroundColor,
              height: screenHeight * 0.080,
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

                                          name: 'choosecoin',
                                          obscureText:true,
                                          decoration: InputDecoration(
                                             contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            
                                                                                 enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

 labelStyle: const TextStyle(fontSize: 14,color:Colors.blueGrey),
                                            labelText: 'Select Reason',
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
        ),  SizedBox(
                                height: screenHeight * 0.030,
                              ),
                              Row(children: [
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                  ),
                                  child: GestureDetector(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth * 0.750,
                                      height: screenHeight * 0.055,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        color: theme.primaryColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
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

                                              // Get form data
                                              final formData =
                                                  _formKey.currentState!.value;
                                              //  context.read<TransactionBloc>().add(
                                              // _CoinTransferTransactionEvent(
                                              //    accounttype:_formKey.currentState!.fields['accounttype']?.value,
                                              //   token:_formKey.currentState!.fields['token']?.value,
                                              //   from:_formKey.currentState!.fields['network']?.value,
                                              //   to:_formKey.currentState!.fields['memo']?.value,
                                              // amount:_formKey.currentState!.fields['amount']?.value
                                              // ),
                                              // );
                                              // Reset form
                                              _formKey.currentState!.reset();
                                              // Optional: unfocus keyboard
                                              FocusScope.of(context).unfocus();
                                              // Optional: Show snackbar
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  duration: const Duration(
                                                      seconds: 2),
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
                                                  duration: const Duration(
                                                      seconds: 2),
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
                                                fontSize: 16.0 * textScale,
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
                            //               Container(
                            //   height: screenHeight*0.030,
                            //   // color: Colors.grey,
                            //   child:  InkWell(
                            //     // onTap: ,
                            //     child: Center(child: Text('Forgot Password')),
                            //   ),
                            // ),
                            SizedBox(
                              height: screenWidth * 0.020,
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          )
        // },
      // ),
    );
  }
}
