import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/responsive.dart';
import 'sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class deleteAccount extends StatefulWidget {
  deleteAccount(
      // Function showResult,
      //  Function changeDisplay,
      // //  Function showCreateUser,
      //   // Function signOut,
      //   // Function fetchSession,
      //    Function getCurrentUser,
      //    Function setError
      );

  @override
  _deleteAccountState createState() => _deleteAccountState();
}

class _deleteAccountState extends State<deleteAccount> {
  // Function showResult;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _deleteAccountMobile(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
          tablet: _deleteAccountTablet(
              // showResult, changeDisplay,
              //                         setError, _backToSignIn
              ),
        ),
      ),
    );
  }
}

class _deleteAccountTablet extends StatefulWidget {
  //  final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _deleteAccountTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __deleteAccountTabletState createState() => __deleteAccountTabletState();
}

class __deleteAccountTabletState extends State<_deleteAccountTablet> {
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
  dispose() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0.5,
          title: Text(
            "Delete Account",
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: Scaffold(
          backgroundColor: theme.backgroundColor,
          body:
              // Column(
              // // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.start,
              // children: <Widget>[

              Padding(
            padding: EdgeInsets.symmetric(horizontal: 1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              // height: screenHeight * 0.150,
              color: theme.backgroundColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: InkWell(
                  // onTap: _signUp,
                  child: Container(
                    height: screenHeight * 0.25,
                    color: theme.scaffoldBackgroundColor,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '- Delete your account will result in the following:' +
                                    '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Row(
                            children: [
                              Text(
                                '-1 All trading capabilities for your account will be disabled' +
                                    '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Row(
                            children: [
                              Text(
                                '-2.All Api Keys for your account will be deleted' +
                                    '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Row(
                            children: [
                              Text(
                                '-3.All API keys for your account to be deleted' +
                                    '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Row(
                            children: [
                              Text(
                                '- All devices for your account will be deleted' +
                                    '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Row(
                            children: [
                              Text(
                                '- Verified personal information will not be deleted' +
                                    '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Row(
                            children: [
                              Text(
                                '- Inorder to reactivate your account you will need' +
                                    ' ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '  to contact cx support' + ' ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //   SizedBox(
                //       height: screenHeight * 0.060,
                // width: screenWidth * 0.360,
                //     child:
                //   FloatingActionButton(
                //   backgroundColor: theme.primaryColor,
                //   elevation: 0,
                //   heroTag: 'back',
                //   onPressed: () {/* Do something */},
                //   child: Text('cancel'),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(2),
                //   ),
                // )),
                // SizedBox(width: 40.0,),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                        height: screenHeight * 0.060,
                        width: screenWidth * 0.200,
                        child: FloatingActionButton(
                          backgroundColor: theme.primaryColor,
                          elevation: 0,
                          heroTag: 'back',
                          onPressed: () {/* Do something */},
                          child: Center(
                            child: Text(
                              'Delete Account ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )),
                  ),
                ),
              ]),
        ));
  }
}

class _deleteAccountMobile extends StatefulWidget {
  // final Function showResult;
  // final Function changeDisplay;
  // final Function setError;
  // final Function backToSignIn;

  _deleteAccountMobile(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  _deleteAccountMobileState createState() => _deleteAccountMobileState();
}

class _deleteAccountMobileState extends State<_deleteAccountMobile> {
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
  dispose() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final ScrollController _controller = ScrollController();
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0.5,
          title: Text(
            "Delete Account",
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: Scaffold(
          backgroundColor: theme.backgroundColor,
          body:
              // Column(
              // // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.start,
              // children: <Widget>[

              Padding(
            padding: EdgeInsets.symmetric(horizontal: 1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              // height: screenHeight * 0.150,
              color: theme.backgroundColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: InkWell(
                  // onTap: _signUp,
                  child: Container(
                    height: screenHeight * 0.25,
                    color: theme.scaffoldBackgroundColor,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '- Delete your account will result in the following:' +
                                    '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Row(
                            children: [
                              Text(
                                '-1 All trading capabilities for your account will be disabled' +
                                    '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Row(
                            children: [
                              Text(
                                '-2.All Api Keys for your account will be deleted' +
                                    '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Row(
                            children: [
                              Text(
                                '-3.All API keys for your account to be deleted' +
                                    '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Row(
                            children: [
                              Text(
                                '- All devices for your account will be deleted' +
                                    '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Row(
                            children: [
                              Text(
                                '- Verified personal information will not be deleted' +
                                    '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Row(
                            children: [
                              Text(
                                '- Inorder to reactivate your account you will need' +
                                    ' ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '  to contact cx support' + ' ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: theme.hoverColor,
                                  fontSize: 12 * textScale,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //   SizedBox(
                //       height: screenHeight * 0.060,
                // width: screenWidth * 0.360,
                //     child:
                //   FloatingActionButton(
                //   backgroundColor: theme.primaryColor,
                //   elevation: 0,
                //   heroTag: 'back',
                //   onPressed: () {/* Do something */},
                //   child: Text('cancel'),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(2),
                //   ),
                // )),
                // SizedBox(width: 40.0,),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                        height: screenHeight * 0.060,
                        width: screenWidth * 0.200,
                        child: FloatingActionButton(
                          backgroundColor: theme.primaryColor,
                          elevation: 0,
                          heroTag: 'back',
                          onPressed: () {/* Do something */},
                          child: Center(
                            child: Text(
                              'Delete Account ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )),
                  ),
                ),
              ]),
        ));
  }
}
