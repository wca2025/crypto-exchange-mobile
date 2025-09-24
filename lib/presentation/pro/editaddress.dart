import '../../presentation/pro/selecttoken.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../businesslogic/blocs/addresss/addresss_bloc.dart';
import 'selecttoken.dart';
import 'selecttoken.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditAddress extends StatefulWidget {
  EditAddress();

  @override
  _EditAddressState createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _EditAddressMobile(),
          tablet: _EditAddressTablet(),
        ),
      ),
    );
  }
}

class _EditAddressTablet extends StatefulWidget {
  _EditAddressTablet();

  @override
  __EditAddressState createState() => __EditAddressState();
}

class __EditAddressState extends State<_EditAddressTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  static const genderOptions = ['1', '2', '3'];
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  @override
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        // child: Padding(
        //   padding: EdgeInsets.only(right: 270),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 32),
                child: Text(
                  item,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.normal),
                ),
              ),
            )
          ],
        ),
        // )
      );

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
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: Text("Change Address ",
            style: TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
      ),
      //
      body: DefaultTabController(
        length: 2,
        child: Container(
            color: theme.backgroundColor,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 0.5),

                //            Row(children:[    Expanded(child:   Padding( padding: EdgeInsets.symmetric(horizontal:32,), child:
                //   Text(
                //     'Change Password',
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //       color: Colors.black,
                //     ),
                //   ),
                // ))],),

                // SizedBox(
                //   height: screenHeight * 0.010,
                // ),

                //            Row(children:[    Expanded(child:   Padding( padding: EdgeInsets.symmetric(horizontal:32,), child:
                //   Text(
                //     'Change Password',
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //       color: Colors.black,
                //     ),
                //   ),
                // ))],),

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
                                    horizontal: 29,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    color: theme.backgroundColor,
                                    height: screenHeight * 0.060,
                                    width: screenWidth * 0.55,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return SearchListAddress();
                                        }));
                                      },
                                      child: TextField(
                                        // controller: usernameController,
                                        obscureText: false,

                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),
                                          labelStyle: TextStyle(fontSize: 14),
                                          labelText: 'Choose Coin',
                                          suffixIcon: Icon(
                                            FontAwesomeIcons.caretDown,
                                            size: 17,
                                          ),
                                        ),
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      height: screenHeight * 0.055,
                                      color: theme.backgroundColor,
                                      width: screenWidth * 0.750,
                                      child: TextField(
                                        // controller: usernameController,
                                        obscureText: false,

                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),
                                          labelStyle: TextStyle(fontSize: 14),
                                          labelText: 'Enter Address',
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
                                    horizontal: 29,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    color: theme.backgroundColor,
                                    height: screenHeight * 0.060,
                                    width: screenWidth * 0.55,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) {
                                          // return DetailPage(bean);
                                          return SearchListAddress();
                                        }));
                                      },
                                      child: TextField(
                                        // controller: usernameController,
                                        obscureText: false,

                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),
                                          labelStyle: TextStyle(fontSize: 14),
                                          labelText: 'Select Platform',
                                          suffixIcon: Icon(
                                            FontAwesomeIcons.caretDown,
                                            size: 17,
                                          ),
                                        ),
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      height: screenHeight * 0.055,
                                      color: theme.backgroundColor,
                                      width: screenWidth * 0.750,
                                      child: TextField(
                                        // controller: usernameController,
                                        obscureText: false,

                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),
                                          labelStyle: TextStyle(fontSize: 14),
                                          labelText: 'Enter Wallet Label',
                                        ),
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
                                        borderRadius:
                                            BorderRadius.circular(3.0),
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

                              ///
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
            )),
      ),
    );
  }
}

class _EditAddressMobile extends StatefulWidget {
  _EditAddressMobile();

  @override
  _EditaddressMobileState createState() => _EditaddressMobileState();
}

class _EditaddressMobileState extends State<_EditAddressMobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  static const genderOptions = ['1', '2', '3'];
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;
  @override
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        // child: Padding(
        //   padding: EdgeInsets.only(right: 270),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 32),
                child: Text(
                  item,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.normal),
                ),
              ),
            )
          ],
        ),
        // )
      );

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
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.2,
          bottomOpacity: 1.0,
          shadowColor: theme.scaffoldBackgroundColor,
          backgroundColor: theme.scaffoldBackgroundColor,
          title: Text("Edit Address ",
              style:
                  TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
        ),
        //
        body:
            // BlocConsumer<AddresssBloc, AddresssState>(
            //   listener: (context, state) {
            // TODO: implement listener
            // if (state is SuccessAddresssState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' succeess ', textScaleFactor: 1.5),
            //     ),
            //   );
            // } else if (state is ErrorAddresssState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' error ', textScaleFactor: 1.5),
            //     ),
            //   );
            // }
            //   },
            //   builder: (context, state) {
            // return
            DefaultTabController(
          length: 2,
          child: Container(
              color: theme.backgroundColor,
              child: Column(
                children: <Widget>[
                  //            Row(children:[    Expanded(child:   Padding( padding: EdgeInsets.symmetric(horizontal:32,), child:
                  //   Text(
                  //     'Change Password',
                  //     textAlign: TextAlign.left,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ))],),

                  // SizedBox(
                  //   height: screenHeight * 0.010,
                  // ),

                  //            Row(children:[    Expanded(child:   Padding( padding: EdgeInsets.symmetric(horizontal:32,), child:
                  //   Text(
                  //     'Change Password',
                  //     textAlign: TextAlign.left,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ))],),

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
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              // return DetailPage(bean);
                                              return SearchListAddress();
                                            }));
                                          },
                                          child: FormBuilderTextField(
                                            name: '',
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              labelStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blueGrey),
                                              labelText: "Choose coin",
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .grey.shade300),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              4.0))),

                                              // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                              // errorText: _emailError,
                                            ),
                                            validator:
                                                FormBuilderValidators.compose([
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          height: screenHeight * 0.055,
                                          color: theme.backgroundColor,
                                          width: screenWidth * 0.750,
                                          child: FormBuilderTextField(
                                            name: 'address',
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              labelStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blueGrey),
                                              labelText: "Enter Address",
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .grey.shade300),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              4.0))),

                                              // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                              // errorText: _emailError,
                                            ),
                                            validator:
                                                FormBuilderValidators.compose([
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
                                        height: screenHeight * 0.075,
                                        width: screenWidth * 0.55,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              // return DetailPage(bean);
                                              return SearchListAddress();
                                            }));
                                          },
                                          child: FormBuilderTextField(
                                            name: '',
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              labelStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blueGrey),
                                              labelText: "Seelct Platform",
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .grey.shade300),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              4.0))),

                                              // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                              // errorText: _emailError,
                                            ),
                                            validator:
                                                FormBuilderValidators.compose([
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          height: screenHeight * 0.055,
                                          color: theme.backgroundColor,
                                          width: screenWidth * 0.750,
                                          child: FormBuilderTextField(
                                            name: 'walletlabel',
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              labelStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blueGrey),
                                              labelText: "Enter Wallet Label",
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .grey.shade300),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              4.0))),

                                              // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                              // errorText: _emailError,
                                            ),
                                            validator:
                                                FormBuilderValidators.compose([
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
                                            padding: EdgeInsets.all(1.0),
                                            child: InkWell(
                                              onTap: () async {
                                                // Get textfield input value
                                                final validationSuccess =
                                                    _formKey.currentState!
                                                        .validate();

                                                if (validationSuccess) {
                                                  //
                                                  // Save only when validation passed
                                                  _formKey.currentState!.save();
                                                  //
                                                  // Get form data
                                                  final formData = _formKey
                                                      .currentState!.value;
                                                  //
                                                  // Reset form
                                                  _formKey.currentState!
                                                      .reset();
                                                  // Optional: unfocus keyboard
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  // Optional: Show snackbar
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
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
                                                  final formData = _formKey
                                                      .currentState!.value;
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
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
                                                FocusScope.of(context)
                                                    .unfocus();
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

                                  ///
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
                  ),

//
                ],
              )),
        )
        // },
        // ),
        );
  }
}
