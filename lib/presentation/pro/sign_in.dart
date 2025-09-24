import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../businesslogic/blocs/auth/auth_bloc.dart';
import '../../data/services/securestorage.dart';
import 'countrycode.dart';
import 'resetpassword1.dart';
import 'sign_in.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:expandable/expandable.dart';
import '../../main.dart';
// import '../../businesslogic/blocs/auth/auth_bloc.dart';
// import '../../businesslogic/blocs/asset/asset_bloc.dart';
import 'package:http/http.dart' as http;

// import 'package:form_builder_phone_field/form_builder_phone_field.dart';
// import 'package:gt4_flutter_plugin/gt4_flutter_plugin.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:gt4_flutter_plugin/gt4_flutter_plugin.dart';

class SignIn extends StatefulWidget {
  SignIn();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _SignInMobile(),
          tablet: _SignInTablet(),
        ),
      ),
    );
  }
}

class _SignInTablet extends StatefulWidget {
  _SignInTablet(
      // this.showResult, this.changeDisplay, this.setError, this.backToSignIn
      );

  @override
  __SignInTabletState createState() => __SignInTabletState();
}

class __SignInTabletState extends State<_SignInTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;
  String _platformVersion = 'Unknown';

  /// 监控页面配置变化
  static const MethodChannel _demoChannel = MethodChannel('gt4_flutter_demo');

  /// TO-DO
  /// 集成前，请先替换从后台申请的 `captchaId`
  /// Before initial new instance, replace `captchaId` sample with one of the captchaId registered from account backend.
  // final Gt4FlutterPlugin captcha =
  //     Gt4FlutterPlugin("0a8f29a1127df8b6cbbfe07b12b06be7");

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      // platformVersion =
      //     await Gt4FlutterPlugin.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try {
      // _demoChannel.setMethodCallHandler(_configurationChanged);

      // captcha.addEventHandler(onShow: (Map<String, dynamic> message) async {
      //   // TO-DO
      //   // 验证视图已展示
      //   debugPrint("Captcha did show");
      // }, onResult: (Map<String, dynamic> message) async {
      //   debugPrint("Captcha result: " + message.toString());
      //   Fluttertoast.showToast(
      //     msg: message.toString(),
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //   );

      //   String status = message["status"];
      //   if (status == "1") {
      //     // TODO
      //     // 发送 message["result"] 中的数据向服务端二次查询接口查询结果
      //     Map result = message["result"] as Map;
      //     await validateCaptchaResult(result
      //         .map((key, value) => MapEntry(key.toString(), value.toString())));
      //   } else {
      //     // 终端用户完成验证错误，自动重试
      //     debugPrint("Captcha 'onResult' state: $status");
      //   }
      // }, onError: (Map<String, dynamic> message) async {
      //   debugPrint("Captcha onError: " + message.toString());
      //   Fluttertoast.showToast(
      //     msg: message.toString(),
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //   );
      //   String code = message["code"];
      //   // TODO 处理验证中返回的错误
      //   if (Platform.isAndroid) {
      //     // Android 平台
      //     if (code == "-14460") {
      //       // 验证会话已取消
      //     } else {
      //       // 更多错误码参考开发文档
      //       // https://docs.geetest.com/gt4/apirefer/errorcode/android
      //     }
      //   }

      //   if (Platform.isIOS) {
      //     // iOS 平台
      //     if (code == "-20201") {
      //       // 验证请求超时
      //     } else if (code == "-20200") {
      //       // 验证会话已取消
      //     } else {
      //       // 更多错误码参考开发文档
      //       // https://docs.geetest.com/gt4/apirefer/errorcode/ios
      //     }
      //   }
      // });
    } catch (e) {
      debugPrint("Event handler exception " + e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // setState(() {
    //   _platformVersion = platformVersion;
    // });
  }

  // void verify() {
  //   debugPrint("Start captcha. Current version: " + _platformVersion);
  //   captcha.verify();
  // }

  // void close() {
  //   debugPrint("Close captcha.");
  //   captcha.close();
  // }

  // Future<dynamic> _configurationChanged(MethodCall methodCall) async {
  //   debugPrint("Activity configurationChanged");
  //   return captcha
  //       .configurationChanged(methodCall.arguments.cast<String, dynamic>());
  // }

  Future<void> validateCaptchaResult(Map<String, String> result) async {
    // TODO
    // Submit captcha result for validation
    debugPrint("Captcha validateCaptchaResult");
    String validate = "http://gcaptcha4.geetest.com/validate";
    final response = await http.post(Uri.parse(validate),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8"
        },
        body: result);
    if (response.statusCode == 200) {
      debugPrint("Validate response: " + response.body);
    } else {
      debugPrint("URL: $validate, Response statusCode: ${response.statusCode}");
    }
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

  final _formKey = GlobalKey<FormBuilderState>();

  // void submitForm(BuildContext context) {
  //   if (_formKey.currentState?.saveAndValidate() ?? false) {
  //     final data = _formKey.currentState?.value;
  //     context.read<AuthBloc>().add(
  //           login(

  //           ),
  //         );
  //   }
  // }

  // Future<bool> popScreen(state) async {
  //   return state is! LoginLoadingState;
  // }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    final ScrollController _controller = ScrollController();
    final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
    final _passwordFieldKey = GlobalKey<FormBuilderFieldState>();

    final _formKeyEmail = GlobalKey<FormBuilderState>();
    final _formKeyPhone = GlobalKey<FormBuilderState>();
    final _formKeyPwd1 = GlobalKey<FormBuilderState>();
    final _formKeyPwd2 = GlobalKey<FormBuilderState>();

    // return MaterialApp(
    //     navigatorKey: _navigatorKey,
    //     builder: (context, child) {
    // return (BlocConsumer<AuthBloc, AuthState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    //   },
    //   builder: (context, state) {

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
            child: Container(
              color: theme.backgroundColor,
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 1200.0)),
                      Expanded(
                        child: Container(
                          width: screenWidth * 0.0,
                          height: screenHeight * 0.020,
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.close_rounded, size: 22),
                          ),
                        ),
                      ),
                      // Expanded(child: Container(width: screenWidth * 0.65)),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'SignIn',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 28 * textScale),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Lets get Started',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14 * textScale,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: Container(
                          color: theme.backgroundColor,
                          constraints: const BoxConstraints.expand(height: 50),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TabBar(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              indicatorColor: Colors.white,
                              labelColor: Colors.lightBlue,
                              unselectedLabelColor: Colors.black54,
                              isScrollable: true,
                              tabs: <Widget>[
                                Tab(
                                    child: Text('Email',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 14 * textScale))),
                                Tab(
                                    child: Text("Phone",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 14 * textScale))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                  Expanded(
                    child: Container(
                      color: theme.backgroundColor,
                      child: TabBarView(children: [
                        FormBuilder(
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
                                          horizontal: 32,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          height: screenHeight * 0.055,
                                          color: theme.scaffoldBackgroundColor,
                                          width: screenWidth * 0.750,
                                          child: FormBuilderField<String?>(
                                            name: 'email',
                                            onChanged: (val) =>
                                                debugPrint(val.toString()),
                                            builder: (FormFieldState field) {
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15),
                                                child: InputDecorator(
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    labelStyle:
                                                        TextStyle(fontSize: 20),
                                                    labelText: "Email Address",
                                                    border: InputBorder.none,

                                                    // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                                  ),
                                                ),
                                              );
                                            },
                                            autovalidateMode:
                                                AutovalidateMode.always,
                                            validator: (valueCandidate) {
                                              if (valueCandidate?.isEmpty ??
                                                  true) {
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
                                    height: screenHeight * 0.030,
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
                                          color: theme.scaffoldBackgroundColor,
                                          width: screenWidth * 0.750,
                                          child: FormBuilderField<String?>(
                                            name: 'name',
                                            onChanged: (val) =>
                                                debugPrint(val.toString()),
                                            builder: (FormFieldState field) {
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15),
                                                child: InputDecorator(
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2),
                                                    labelStyle:
                                                        TextStyle(fontSize: 20),
                                                    labelText: "Password",
                                                    border: InputBorder.none,

                                                    // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                                  ),
                                                ),
                                              );
                                            },
                                            autovalidateMode:
                                                AutovalidateMode.always,
                                            validator: (valueCandidate) {
                                              if (valueCandidate?.isEmpty ??
                                                  true) {
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
                                    height: screenWidth * 0.030,
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
                                              // onTap: _signUp,
                                              child: Center(
                                                child: Text(
                                                  'SignUp',
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
                                    height: screenWidth * 0.030,
                                  ),
                                  Row(children: [
                                    Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 32,
                                            ),
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: screenHeight * 0.030,
                                              // color: Colors.grey,
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .push(MaterialPageRoute(
                                                          builder: (context) {
                                                    return ResetPassword();
                                                  }));
                                                },
                                                child: Text('Forgot Password ?',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize:
                                                            12 * textScale)),
                                              ),
                                            ))),
                                  ]),
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
                                              color: theme
                                                  .scaffoldBackgroundColor),
                                          child: Padding(
                                            padding: EdgeInsets.all(1.0),
                                            child: InkWell(
                                              // onTap: _signUp,
                                              child: Center(
                                                  child: TextButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                  Color(0xFFf5f7fa),
                                                )),
                                                onPressed: () {
                                                  // Navigator.of(context,rootNavigator: true).push(
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) {
                                                  //   return Convert();
                                                  // }));
                                                },
                                                child: Text(
                                                  'Google',
                                                  style: TextStyle(
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                  ]),
                                  SizedBox(
                                    height: screenWidth * 0.020,
                                  ),
                                  Row(children: [
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 32,
                                      ),
                                      child: Container(
                                        height: screenHeight * 0.030,
                                        // color: Colors.grey,
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(MaterialPageRoute(
                                                      builder: (context) {
                                                return SignUp();
                                              }));
                                            },
                                            child: Text(
                                                'dont have an account ?, SignUp',
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 12 * textScale))),
                                      ),
                                    ))
                                  ]),
                                  SizedBox(
                                    height: screenWidth * 0.030,
                                  ),
                                ]),
                          ),
                        ),
                        FormBuilder(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.010,
                                ),
                                SizedBox(
                                  height: screenHeight * 0.010,
                                ),
                                Row(children: [
                                  Padding(padding: EdgeInsets.only(left: 30)),
                                  Container(
                                    alignment: Alignment.center,
                                    width: screenWidth * 0.150,
                                    height: screenHeight * 0.055,
                                    color: theme.scaffoldBackgroundColor,
                                    child: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .push(MaterialPageRoute(
                                                  builder: (context) {
                                            // return DetailPage(bean);
                                            return CountryCode();
                                          }));
                                        },
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
                                                          horizontal: 10),
                                                  labelStyle:
                                                      TextStyle(fontSize: 18),
                                                  labelText: "",
                                                  border: InputBorder.none,

                                                  suffixIcon: Icon(
                                                    FontAwesomeIcons.caretDown,
                                                    size: 17,
                                                  ),
                                                  // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                                ),
                                              ),
                                            );
                                          },
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          validator: (valueCandidate) {
                                            if (valueCandidate?.isEmpty ??
                                                true) {
                                              return 'This field is required.';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 5)),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth * 0.700,
                                      height: screenHeight * 0.055,
                                      color: theme.scaffoldBackgroundColor,
                                      child: Padding(
                                        padding: EdgeInsets.all(0.0),
                                        child: InkWell(
                                          onTap: () {
                                            // Navigator.of(context,
                                            //         rootNavigator: true)
                                            //     .push(MaterialPageRoute(
                                            //         builder: (context) {
                                            //   // return DetailPage(bean);
                                            //   return CountryCode();
                                            // }));
                                          },
                                          child: FormBuilderField<String?>(
                                            name: 'name',
                                            onChanged: (val) =>
                                                debugPrint(val.toString()),
                                            builder: (FormFieldState field) {
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15),
                                                child: InputDecorator(
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0),
                                                    labelStyle:
                                                        TextStyle(fontSize: 18),
                                                    labelText: "Phone Number",
                                                    border: InputBorder.none,

                                                    // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                                  ),
                                                ),
                                              );
                                            },
                                            autovalidateMode:
                                                AutovalidateMode.always,
                                            validator: (valueCandidate) {
                                              if (valueCandidate?.isEmpty ??
                                                  true) {
                                                return 'This field is required.';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 46)),
                                ]),
                                SizedBox(
                                  height: screenHeight * 0.030,
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
                                                  border: InputBorder.none,

                                                  // errorText: field.errorText != null ? Text(field.errorText!) : null,
                                                ),
                                              ),
                                            );
                                          },
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          validator: (valueCandidate) {
                                            if (valueCandidate?.isEmpty ??
                                                true) {
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
                                            onTap: () async {},
                                            child: Center(
                                              child: Text(
                                                'SignIn',
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
                                  height: screenWidth * 0.030,
                                ),
                                Row(children: [
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 32,
                                          ),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: screenHeight * 0.030,
                                            // color: Colors.grey,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .push(MaterialPageRoute(
                                                        builder: (context) {
                                                  return ResetPassword();
                                                }));
                                              },
                                              child: Text('Forgot Password ?',
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize:
                                                          12 * textScale)),
                                            ),
                                          ))),
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
                                    child: GestureDetector(
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: screenWidth * 0.750,
                                        height: screenHeight * 0.055,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color:
                                                theme.scaffoldBackgroundColor),
                                        child: Padding(
                                          padding: EdgeInsets.all(1.0),
                                          child: InkWell(
                                            // onTap: _signUp,
                                            child: Center(
                                              child: Text(
                                                'Google',
                                                style: TextStyle(
                                                  color: Colors.black,
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
                                Row(children: [
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 32,
                                          ),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: screenHeight * 0.030,
                                            // color: Colors.grey,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .push(MaterialPageRoute(
                                                        builder: (context) {
                                                  return SignUp();
                                                }));
                                              },
                                              child: Text(
                                                  'dont have an account ?, Signup',
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize:
                                                          12 * textScale)),
                                            ),
                                          ))),
                                ]),
                                SizedBox(
                                  height: screenWidth * 0.020,
                                ),
                              ]),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );

    //   },
    // ));
    // });
  }
}

class _SignInMobile extends StatefulWidget {
  _SignInMobile();

  @override
  _SignInMobileState createState() => _SignInMobileState();
}

class _SignInMobileState extends State<_SignInMobile> {
  final SecureStorage _secureStorage = SecureStorage();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;
  String _platformVersion = 'Unknown';

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countrycodeController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();

  /// 监控页面配置变化
  static const MethodChannel _demoChannel = MethodChannel('gt4_flutter_demo');

  /// TO-DO
  /// 集成前，请先替换从后台申请的 `captchaId`
  /// Before initial new instance, replace `captchaId` sample with one of the captchaId registered from account backend.
  // final Gt4FlutterPlugin captcha =
  //     Gt4FlutterPlugin("0a8f29a1127df8b6cbbfe07b12b06be7");

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    initPlatformState();
    fetchSecureStorageData();
  }

  Future<void> fetchSecureStorageData() async {
    _emailController.text = await _secureStorage.getEmail() ?? '';
    _passwordController.text = await _secureStorage.getPassWord() ?? '';
    _countrycodeController.text = await _secureStorage.getCountrycode() ?? '';
    _phonenumberController.text = await _secureStorage.getPhonenumber() ?? '';
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      // platformVersion =
      //     await Gt4FlutterPlugin.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try {
      // _demoChannel.setMethodCallHandler(_configurationChanged);

      // captcha.addEventHandler(onShow: (Map<String, dynamic> message) async {
      //   // TO-DO
      //   // 验证视图已展示
      //   debugPrint("Captcha did show");
      // }, onResult: (Map<String, dynamic> message) async {
      //   debugPrint("Captcha result: " + message.toString());
      //   Fluttertoast.showToast(
      //     msg: message.toString(),
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //   );

      //   String status = message["status"];
      //   if (status == "1") {
      //     // TODO
      //     // 发送 message["result"] 中的数据向服务端二次查询接口查询结果
      //     Map result = message["result"] as Map;
      //     await validateCaptchaResult(result
      //         .map((key, value) => MapEntry(key.toString(), value.toString())));
      //   } else {
      //     // 终端用户完成验证错误，自动重试
      //     debugPrint("Captcha 'onResult' state: $status");
      //   }
      // }, onError: (Map<String, dynamic> message) async {
      //   debugPrint("Captcha onError: " + message.toString());
      //   Fluttertoast.showToast(
      //     msg: message.toString(),
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //   );
      //   String code = message["code"];
      //   // TODO 处理验证中返回的错误
      //   if (Platform.isAndroid) {
      //     // Android 平台
      //     if (code == "-14460") {
      //       // 验证会话已取消
      //     } else {
      //       // 更多错误码参考开发文档
      //       // https://docs.geetest.com/gt4/apirefer/errorcode/android
      //     }
      //   }

      //   if (Platform.isIOS) {
      //     // iOS 平台
      //     if (code == "-20201") {
      //       // 验证请求超时
      //     } else if (code == "-20200") {
      //       // 验证会话已取消
      //     } else {
      //       // 更多错误码参考开发文档
      //       // https://docs.geetest.com/gt4/apirefer/errorcode/ios
      //     }
      //   }
      // });
    } catch (e) {
      debugPrint("Event handler exception " + e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      // _platformVersion = platformVersion;
    });
  }

  void verify() {
    debugPrint("Start captcha. Current version: " + _platformVersion);
    // captcha.verify();
  }

  void close() {
    debugPrint("Close captcha.");
    // captcha.close();
  }

  Future<void> _configurationChanged(MethodCall methodCall) async {
    // debugPrint("Activity configurationChanged");
    // return captcha
    //     .configurationChanged(methodCall.arguments.cast<String, dynamic>());
  }

  Future<void> validateCaptchaResult(Map<String, String> result) async {
    // TODO
    // Submit captcha result for validation
    debugPrint("Captcha validateCaptchaResult");
    String validate = "http://gcaptcha4.geetest.com/validate";
    final response = await http.post(Uri.parse(validate),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8"
        },
        body: result);
    if (response.statusCode == 200) {
      debugPrint("Validate response: " + response.body);
    } else {
      debugPrint("URL: $validate, Response statusCode: ${response.statusCode}");
    }
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

  final _formKey = GlobalKey<FormBuilderState>();

  //   void submitForm(BuildContext context) {
  //   if (_formKey.currentState?.saveAndValidate() ?? false) {
  //     final data = _formKey.currentState?.value;
  //     context.read<AuthBloc>().add(
  //           AuthenticateEvent(
  //             email: data!['email'],
  //             password: data['password'],
  //             cellphone: data['cellphone'],
  //           ),
  //         );
  //   }
  // }

  // Future<bool> popScreen(state) async {
  //   return state is! LoginLoadingState;
  // }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    final ScrollController _controller = ScrollController();
    final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
    final _passwordFieldKey = GlobalKey<FormBuilderFieldState>();

    final _formKeyEmail = GlobalKey<FormBuilderState>();
    final _formKeyPhone = GlobalKey<FormBuilderState>();
    final _formKeyPwd1 = GlobalKey<FormBuilderState>();
    final _formKeyPwd2 = GlobalKey<FormBuilderState>();
    final _formKey = GlobalKey<FormBuilderState>();

    final _formKey2 = GlobalKey<FormBuilderState>();

    // return MaterialApp(
    //     navigatorKey: _navigatorKey,
    //     builder: (context, child) {
    // return (BlocConsumer<AuthBloc, AuthState>(
    //   listener: (context, state) {
    // if (state is AuthenticateState) {
    //               context.read<AuthBloc>().add(
    //                     AuthenticateEvent(state.user),
    //                   );
    //               SnackBar(
    //                         duration: Duration(seconds: 2),
    //                         content: Text(
    //                             'Registration sucessful',
    //                             textScaleFactor: 1.5),
    //                       );
    //             }
    //   },
    //   builder: (context, state) {

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
            child: Container(
              color: theme.backgroundColor,
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 345.0)),
                      Container(
                        height: screenHeight * 0.015,
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close_rounded, size: 22),
                        ),
                      ),
                      Expanded(child: Container(width: screenWidth * 0.65)),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'SignIn',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 28 * textScale),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Lets get Started',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14 * textScale,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8
                        ),
                        child: Container(
                          color: theme.backgroundColor,
                          constraints: const BoxConstraints.expand(height: 50),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TabBar(
                              padding: EdgeInsets.symmetric(horizontal:8),
                              indicatorColor: Colors.white,
                              labelColor: Colors.lightBlue,
                              unselectedLabelColor: Colors.black54,
                              isScrollable: true,
                              tabs: <Widget>[
                                Tab(
                                    child: Text('Email',
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 14 * textScale))),
                                Tab(
                                    child: Text("Phone",
                                        style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 14 * textScale))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                  Expanded(
                    child: Container(
                      color: theme.backgroundColor,
                      child: TabBarView(children: [
                        FormBuilder(
                          key: _formKey,
                          skipDisabled: true,
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
                                          horizontal: 20,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          height: screenHeight * 0.055,
                                          color: theme.backgroundColor,
                                          width: screenWidth * 0.750,
                                          child: FormBuilderTextField(
                                            controller: _passwordController,
                                            name: 'password',
                                            decoration:  InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              labelStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blueGrey),
                                              labelText: "Email Address",
                                              enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

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
                                    height: screenHeight * 0.030,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 18,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          height: screenHeight * 0.055,
                                          color: theme.backgroundColor,
                                          width: screenWidth * 0.750,
                                          child: FormBuilderTextField(
                                            controller: _passwordController,
                                            name: 'password',
                                            decoration:  InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              labelStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blueGrey),
                                              labelText: "Password",
                                                enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

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
                                    height: screenWidth * 0.030,
                                  ),
                                  Row(children: [
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 28,
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
                                                final validationSuccess =
                                                    _formKey.currentState!
                                                        .validate();

                                                if (validationSuccess) {
                                                  //
                                                  // Save only when validation passed
                                                  _formKey.currentState!.save();
                                                  await _secureStorage.setEmail(
                                                      _emailController.text);
                                                  await _secureStorage
                                                      .setPassWord(
                                                          _passwordController
                                                              .text);
                                                  //
                                                  // Get form data
                                                  final formData = _formKey
                                                      .currentState!.value;
                                                  //
                                                  //  context.read<AuthBloc>().add(
                                                  //     _LoginAuthEvent(
                                                  //       email:_formKey.currentState!.fields['email']?.value,
                                                  //       phonenumber:_formKey.currentState!.fields['phonenumber']?.value,
                                                  //       countrycode:_formKey.currentState!.fields['countrycode']?.value,
                                                  //     password:_formKey.currentState!.fields['password']?.value
                                                  //     ),
                                                  //   );
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
                                                  'Signin',
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
                                    height: screenWidth * 0.030,
                                  ),
                                  Row(children: [
                                    Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 32,
                                            ),
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: screenHeight * 0.030,
                                              // color: Colors.grey,
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .push(MaterialPageRoute(
                                                          builder: (context) {
                                                    return ResetPassword();
                                                  }));
                                                },
                                                child: Text('Forgot Password ?',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize:
                                                            12 * textScale)),
                                              ),
                                            ))),
                                  ]),
                                  SizedBox(
                                    height: screenWidth * 0.020,
                                  ),
                                  Row(children: [
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal:28,
                                      ),
                                      child: GestureDetector(
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: screenWidth * 0.750,
                                          height: screenHeight * 0.055,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              color: theme
                                                  .scaffoldBackgroundColor),
                                          child: Padding(
                                            padding: EdgeInsets.all(1.0),
                                            child: InkWell(
                                              onTap: () {},
                                              child: Center(
                                                  child: TextButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                  Color(0xFFf5f7fa),
                                                )),
                                                onPressed: () {
                                                  // Navigator.of(context,rootNavigator: true).push(
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) {
                                                  //   return Convert();
                                                  // }));
                                                },
                                                child: Text(
                                                  'Google',
                                                  style: TextStyle(
                                                      fontSize: 14 * textScale,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                  ]),
                                  SizedBox(
                                    height: screenWidth * 0.020,
                                  ),
                                  Row(children: [
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 32,
                                      ),
                                      child: Container(
                                        height: screenHeight * 0.030,
                                        // color: Colors.grey,
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(MaterialPageRoute(
                                                      builder: (context) {
                                                return SignUp();
                                              }));
                                            },
                                            child: Text(
                                                'dont have an account ?, SignUp',
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 12 * textScale))),
                                      ),
                                    ))
                                  ]),
                                  SizedBox(
                                    height: screenWidth * 0.030,
                                  ),
                                ]),
                          ),
                        ),
                        FormBuilder(
                          key: _formKey2,
                          skipDisabled: true,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.010,
                                ),
                                SizedBox(
                                  height: screenHeight * 0.010,
                                ),

                                
                                Row(children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 35)),
                                  Container(
                                    alignment: Alignment.center,
                                    width: screenWidth * 0.150,
                                    height: screenHeight * 0.055,
                                    color: theme.backgroundColor,
                                    child: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              // return DetailPage(bean);
                                              return CountryCode();
                                            }));
                                          },
                                          child: FormBuilderTextField(
                                            name: 'countrycode',
                                            controller: _countrycodeController,

                                            decoration: InputDecoration(
                                                 enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),
                                                labelText: '',
                                                suffixIcon: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .push(MaterialPageRoute(
                                                            builder: (context) {
                                                      // return DetailPage(bean);
                                                      return CountryCode();
                                                    }));
                                                  },
                                                  child: const Icon(
                                                    FontAwesomeIcons.caretDown,
                                                    size: 20,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            // controller: cellphoneController,
                                            // inputFormatters: [cellphoneFormatter],
                                            
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            validator:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.required(),
                                              FormBuilderValidators.match(
                                                r"^\(?[1-9]{2}\)? ?(?:[2-8]|9[1-9])[0-9]{3}\-?[0-9]{4}$",
                                              ),
                                            ]),
                                          )),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 5)),
                                  Container(
                                    alignment: Alignment.center,
                                    width: screenWidth * 0.650,
                                    height: screenHeight * 0.055,
                                    color: theme.backgroundColor,
                                    child: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.of(context,
                                          //         rootNavigator: true)
                                          //     .push(MaterialPageRoute(
                                          //         builder: (context) {
                                          //   // return DetailPage(bean);
                                          //   return CountryCode();
                                          // }));
                                        },
                                        child: FormBuilderTextField(
                                          controller: _phonenumberController,
                                          name: 'phonenumber',
                                          decoration:  InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            labelStyle: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blueGrey),
                                            labelText: "Phonenumber",
                   enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

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
                                  Padding(padding: EdgeInsets.only(right: 0)),
                                ]),
                                
                                
                                SizedBox(
                                  height: screenHeight * 0.030,
                                ),
                                Row(children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 28,
                                      ),
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        height: screenHeight * 0.055,
                                        color: theme.backgroundColor,
                                        width: screenWidth * 0.750,
                                        child: FormBuilderTextField(
                                          controller: _passwordController,
                                          name: 'password',
                                          decoration:  InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            labelStyle: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blueGrey),
                                            labelText: "Password ",
                                             enabledBorder: OutlineInputBorder(
                                                borderSide:BorderSide(color: Colors.grey.shade300) ,
                                                borderRadius: BorderRadius.all(Radius.circular(4.0))),

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
                                          padding: EdgeInsets.all(1.0),
                                          child: InkWell(
                                            onTap: () async {
                                              final validationSuccess =
                                                  _formKey2.currentState!
                                                      .validate();

                                              if (validationSuccess) {
                                                //
                                                // Save only when validation passed
                                                _formKey2.currentState!.save();
                                                await _secureStorage
                                                    .setCountrycode(
                                                        _countrycodeController
                                                            .text);
                                                await _secureStorage
                                                    .setPhonenumber(
                                                        _phonenumberController
                                                            .text);
                                                await _secureStorage
                                                    .setPassWord(
                                                        _passwordController
                                                            .text);

                                                //
                                                // Get form data
                                                final formData = _formKey2
                                                    .currentState!.value;
                                                //
                                                //  context.read<AuthBloc>().add(
                                                //     _LoginAuthEvent(
                                                //       email:_formKey.currentState!.fields['email']?.value,
                                                //       phonenumber:_formKey.currentState!.fields['phonenumber']?.value,
                                                //       countrycode:_formKey.currentState!.fields['countrycode']?.value,
                                                //     password:_formKey.currentState!.fields['password']?.value
                                                //     ),
                                                //   );
                                                // Reset form
                                                _formKey2.currentState!.reset();
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
                                                final formData = _formKey2
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
                                              FocusScope.of(context).unfocus();
                                            },
                                            child: Center(
                                              child: Text(
                                                'SignIn',
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
                                  height: screenWidth * 0.030,
                                ),
                                Row(children: [
                                  Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 32,
                                          ),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: screenHeight * 0.030,
                                            // color: Colors.grey,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .push(MaterialPageRoute(
                                                        builder: (context) {
                                                  return ResetPassword();
                                                }));
                                              },
                                              child: Text('Forgot Password ?',
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize:
                                                          12 * textScale)),
                                            ),
                                          ))),
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
                                    child: GestureDetector(
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: screenWidth * 0.750,
                                        height: screenHeight * 0.055,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color:
                                                theme.scaffoldBackgroundColor),
                                        child: Padding(
                                          padding: EdgeInsets.all(1.0),
                                          child: InkWell(
                                            // onTap: _signUp,
                                            child: Center(
                                              child: Text(
                                                'Google',
                                                style: TextStyle(
                                                  color: Colors.black,
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
                                Row(children: [
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 32,
                                          ),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: screenHeight * 0.030,
                                            // color: Colors.grey,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .push(MaterialPageRoute(
                                                        builder: (context) {
                                                  return SignUp();
                                                }));
                                              },
                                              child: Text(
                                                  'dont have an account ?, Signup',
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize:
                                                          12 * textScale)),
                                            ),
                                          ))),
                                ]),
                                SizedBox(
                                  height: screenWidth * 0.020,
                                ),
                              ]),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );

    //   },
    // ));
    // });
  }
}
