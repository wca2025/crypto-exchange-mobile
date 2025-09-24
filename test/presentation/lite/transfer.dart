import 'dart:ui';

import '../pro/selecttoken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import 'orders.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:lo_form/lo_form.dart';

import 'package:numeric_keyboard/numeric_keyboard.dart';
import '../../main.dart';

class Transfer extends StatefulWidget {
  String? token;
  String? accounttype;
  Transfer({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _TransferState createState() =>
      _TransferState(token: this.token, accounttype: this.accounttype);
}

class _TransferState extends State<Transfer> {
  String? token;
  String? accounttype;
  _TransferState({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _TransferMobile(token: token, accounttype: accounttype),
          tablet: _TransferTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _TransferTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _TransferTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __TransferTabletState createState() => __TransferTabletState();
}

class __TransferTabletState extends State<_TransferTablet> {
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
        padding: const EdgeInsets.only(right: 270),
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

  String text = '';
  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

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
          appBar: AppBar(
            backgroundColor: theme.scaffoldBackgroundColor,
            elevation: 0.5,
            title: Text("Transfer",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            automaticallyImplyLeading: false,
            actions: [
              Container(
                  width: screenWidth * 0.40,
                  height: screenHeight * 0.35,
                  // color: Colors.grey[400],
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth * 0.250,
                        height: screenHeight * 0.35,
                        // color: Colors.grey[400],
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(
                          Icons.history,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            // return DetailPage(bean);
                            return Order();
                          }));
                        },
                      ),
                    ],
                  )),
            ],
          ),
          body: Container(
            color: theme.backgroundColor,
            child: ListView(
                // controller: _controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: <Widget>[
                  SizedBox(
                    height: screenHeight * 0.010,
                  ),
                  Row(children: [
                    const Padding(padding: EdgeInsets.only(left: 28)),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        width: screenWidth * 0.600,
                        height: screenHeight * 0.055,
                        color: theme.scaffoldBackgroundColor,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                // return DetailPage(bean);
                                return const SearchListTransfer();
                              }));
                            },
                            child: const TextField(
                              // controller: usernameController,
                              obscureText: false,

                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: '',
                                suffixIcon: Icon(
                                  FontAwesomeIcons.caretDown,
                                  size: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 28)),
                  ]),
                  SizedBox(
                    height: screenHeight * 0.010,
                  ),
                  Row(children: [
                    const Padding(padding: EdgeInsets.only(left: 28)),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        height: screenHeight * 0.055,
                        color: theme.scaffoldBackgroundColor,
                        width: screenWidth * 0.600,
                        child: const TextField(
                          // controller: usernameController,
                          obscureText: false,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'From',
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: const EdgeInsets.only(right: 28)),
                  ]),
                  SizedBox(
                    height: screenHeight * 0.010,
                  ),
                  Row(children: [
                    const Padding(padding: const EdgeInsets.only(left: 28)),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        height: screenHeight * 0.055,
                        color: theme.scaffoldBackgroundColor,
                        width: screenWidth * 0.600,
                        child: const TextField(
                          // controller: usernameController,
                          obscureText: false,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'To',
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 28)),
                  ]),
                  SizedBox(
                    height: screenHeight * 0.010,
                  ),
                  Row(children: [
                    const Padding(padding: EdgeInsets.only(left: 28)),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        height: screenHeight * 0.055,
                        color: theme.scaffoldBackgroundColor,
                        width: screenWidth * 0.600,
                        child: const TextField(
                          // controller: usernameController,
                          obscureText: false,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Coin',
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: const EdgeInsets.only(right: 28)),
                  ]),
                  SizedBox(
                    height: screenHeight * 0.010,
                  ),
                  Row(children: [
                    const Padding(padding: const EdgeInsets.only(left: 28)),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        height: screenHeight * 0.055,
                        color: theme.scaffoldBackgroundColor,
                        width: screenWidth * 0.600,
                        child: const TextField(
                          // controller: usernameController,
                          obscureText: false,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Amount',
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: const EdgeInsets.only(right: 28)),
                  ]),
                  SizedBox(
                    height: screenHeight * 0.010,
                  ),
                  SizedBox(
                    height: screenHeight * 0.10,
                  ),
                  Text(text),
                  Container(
                    child: NumericKeyboard(
                      onKeyboardTap: _onKeyboardTap,
                      textColor: Colors.black,
                      rightButtonFn: () {
                        setState(() {
                          text = text.substring(0, text.length - 1);
                        });
                      },
                      rightIcon: const Icon(
                        Icons.backspace,
                        color: Colors.black,
                      ),
                      leftButtonFn: () {
                        print('left button clicked');
                      },
                      leftIcon: const Icon(
                        Icons.check,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
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
                            borderRadius: BorderRadius.circular(3.0),
                            color: theme.primaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: InkWell(
                              // onTap: _signUp,
                              child: Center(
                                child: Text(
                                  'Transfer',
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
                ]),
          )),
    );
  }
}

class _TransferMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  _TransferMobile({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _TransferMobileState createState() =>
      _TransferMobileState(token: this.token, accounttype: this.accounttype);
}

class _TransferMobileState extends State<_TransferMobile> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _TransferMobileState({this.token, this.accounttype});
  SlidingUpPanelController panelController1 = SlidingUpPanelController();
  SlidingUpPanelController panelController2 = SlidingUpPanelController();
  late String setvalue = "";
  late String setvalue2 = "";
  final ScrollController _controller = ScrollController();

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
        padding: const EdgeInsets.only(right: 270),
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

  String text = '';
  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Stack(children: <Widget>[
      Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: theme.scaffoldBackgroundColor,
            elevation: 0.5,
            title: Text("Transfer",
                style:
                    TextStyle(fontSize: 16 * textScale, color: Colors.black87)),
            automaticallyImplyLeading: false,
            actions: [
              Container(
                  width: screenWidth * 0.40,
                  height: screenHeight * 0.35,
                  // color: Colors.grey[400],
                  child: Row(
                    children: [
                      Container(
                        width: screenWidth * 0.250,
                        height: screenHeight * 0.35,
                        // color: Colors.grey[400],
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0.0),
                        iconSize: 18,
                        icon: const Icon(
                          Icons.history,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(builder: (context) {
                            // return DetailPage(bean);
                            return Order();
                          }));
                        },
                      ),
                    ],
                  )),
            ],
          ),
          body: Container(
              color: theme.backgroundColor,
              child:
                  // BlocConsumer<TransactionBloc, TransactionState>(
                  //   listener: (context, state) {
                  // TODO: implement listener
                  //             if (state is _SuccessTransactionState) {
                  //   ScaffoldMessenger.of(context).showSnackBar((
                  //     const SnackBar(
                  //       duration: Duration(seconds: 2),
                  //       content: Text(' succeess ', textScaleFactor: 1.5),
                  //     ),
                  //   );
                  // }         else if (state is _ErrorTransactionState) {

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
                  ListView(
                      // controller: _controller,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      children: <Widget>[
                    FormBuilder(
                        key: _formKey,
                        skipDisabled: true,
                        child: Container(
                            //  height:screenHeight*1.5,
                            child: Container(
                                // height:screenHeight*1.5,
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
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(5.0),
                                      color: theme.backgroundColor,
                                      height: screenHeight * 0.060,
                                      width: screenWidth * 0.55,
                                      child: FormBuilderTextField(
                                        name: 'token',
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 8),

                                          labelStyle: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                          labelText: token != null
                                              ? 'Coin:                                                                         ${token} '
                                              : null,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),
                                          // prefix: const Text('Name: '),
                                          // InputBorder(borderSide: BorderSide(width: 0,style: BorderStyle.none))
                                          // enabled: false,
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
                                )
                              ]),
                              SizedBox(
                                height: screenHeight * 0.010,
                              ),
                              Row(children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 28)),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    height: screenHeight * 0.055,
                                    color: theme.backgroundColor,
                                    width: screenWidth * 0.600,
                                    child: FormBuilderTextField(
                                      name: 'from',
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey),
                                        labelText: "Fron",
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade300),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0))),
                                        // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                        // errorText: _emailError,
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                    ),
                                  ),
                                ),
                                const Padding(
                                    padding: const EdgeInsets.only(right: 28)),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.020,
                              ),
                              Row(children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 28)),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    height: screenHeight * 0.055,
                                    color: theme.backgroundColor,
                                    width: screenWidth * 0.600,
                                    child: FormBuilderTextField(
                                      name: 'to',
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey),
                                        labelText: "To",
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade300),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0))),

                                        // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                        // errorText: _emailError,
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                    ),
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(right: 28)),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.010,
                              ),
                              Row(children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(5.0),
                                      height: screenHeight * 0.065,
                                      color: theme.backgroundColor,
                                      width: screenWidth * 0.750,
                                      child: InkWell(
                                        onTap: () {},
                                        child: FormBuilderTextField(
                                          name: 'accounttype',
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                if (SlidingUpPanelStatus
                                                        .anchored ==
                                                    panelController2.status) {
                                                  // panelController.hide();
                                                  panelController2.hide();
                                                } else {
                                                  panelController2.anchor();
                                                }
                                              },
                                              child: const Icon(
                                                Icons.keyboard_arrow_right,
                                                size: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                            labelStyle: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.blueGrey),
                                            labelText:
                                                'Accountype:                                         ' +
                                                    setvalue2,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade300),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.0))),

                                            // prefix: const Text('Name: '),
                                            // InputBorder(borderSide: BorderSide(width: 0,style: BorderStyle.none))
                                            // enabled: false,
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
                                )
                              ]),
                              SizedBox(
                                height: screenHeight * 0.010,
                              ),
                              Row(children: [
                                const Padding(
                                    padding: EdgeInsets.only(left: 28)),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    height: screenHeight * 0.055,
                                    color: theme.backgroundColor,
                                    width: screenWidth * 0.630,
                                    child: FormBuilderTextField(
                                      name: 'amount',
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey),
                                        labelText: "Amount",
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade300),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0))),

                                        // errorText: field.errorText != null ? Text(field.errorText!) : null,

                                        // errorText: _emailError,
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                    ),
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(right: 28)),
                              ]),
                              SizedBox(
                                height: screenHeight * 0.010,
                              ),
                              SizedBox(
                                height: screenHeight * 0.10,
                              ),
                              Text(text),
                              Container(
                                child: NumericKeyboard(
                                  onKeyboardTap: _onKeyboardTap,
                                  textColor: Colors.black,
                                  rightButtonFn: () {
                                    setState(() {
                                      text = text.substring(0, text.length - 1);
                                    });
                                  },
                                  rightIcon: const Icon(
                                    Icons.backspace,
                                    color: Colors.black,
                                  ),
                                  leftButtonFn: () {
                                    print('left button clicked');
                                  },
                                  leftIcon: const Icon(
                                    Icons.check,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
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
                                              'Transfer',
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
                            ],
                          ),
                        ))))
                  ]
                      //       );
                      // },
                      ))),
      SlidingUpPanelWidget(
        panelStatus: SlidingUpPanelStatus.hidden,
        controlHeight: screenHeight * 0.35,
        anchor: 0.35,
        panelController: panelController2,
        onTap: () {
          ///Customize the processing logic
        },
        dragStart: (details) {
          panelController2.collapse();
        },

        dragUpdate: (details) {
          panelController2.collapse();
        },
        enableOnTap: false,
        child: Container(
          height: screenHeight * 0.0,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: const ShapeDecoration(
            color: Colors.white,
            shadows: [
              BoxShadow(
                  blurRadius: 5.0, spreadRadius: 2.0, color: Color(0x11000000))
            ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: const <Widget>[
                      // Text(
                      //   'click or drag',
                      // )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: screenHeight * 0.02,
                ),
                // Divider(
                //   height: 0.5,
                //   color: Colors.grey[300],
                // ),
                SingleChildScrollView(
                  child: ListView.builder(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    padding: const EdgeInsets.all(1.0),
                    itemBuilder: (context, index) {
                      return Container(
                          color: Colors.white70,
                          // width: screenWidth * 0.880,

                          child: Column(children: [
                            ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Select Account",
                                      style: TextStyle(
                                        fontSize: 16 * textScale,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                              subtitle: Column(children: [
                                Row(
                                  children: [
                                    Text(
                                        "Ensure that the selected network is consistet with your   ",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12 * textScale)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        "method of withdrawal Otherwise you are aat risk of losing",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12 * textScale)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("your assets",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12 * textScale)),
                                  ],
                                ),
                              ]),
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  setvalue2 = 'Main Account';
                                });
                              },
                              title: Row(
                                children: [
                                  Text('Main Account',
                                      style: TextStyle(
                                        fontSize: 16 * textScale,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text("",
                                      style:
                                          TextStyle(fontSize: 12 * textScale)),
                                ],
                              ),
                            ),
                          ]));
                    },
                  ),
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ), //Enable the onTap callback for control bar.
      ),
    ]);
  }
}
