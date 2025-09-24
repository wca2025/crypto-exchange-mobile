import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// import '../../businesslogic/blocs/auth/auth_bloc.dart';
import '../../businesslogic/blocs/auth/auth_bloc.dart';
import '../../data/services/securestorage.dart';
import 'countrycode.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'sign_in.dart';
import '../Widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:expandable/expandable.dart';
// import 'package:gt4_flutter_plugin/gt4_flutter_plugin.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:gt4_flutter_plugin/gt4_flutter_plugin.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUp extends StatefulWidget {
  SignUp();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _SignUpMobile(),
          tablet: _SignUpTablet(),
        ),
      ),
    );
  }
}

class _SignUpTablet extends StatefulWidget {
  _SignUpTablet();

  @override
  __SignUpTabletState createState() => __SignUpTabletState();
}

class __SignUpTabletState extends State<_SignUpTablet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  bool _ageHasError = false;
  late String _emailError = "";
  late String _countrycode;
  late String _phonenumber;

  late String _passwordError;

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
                    children: [],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Signup',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 28 * textScale),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 1200.0)),
                      Container(
                        height: screenHeight * 0.020,
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
                          'Welcome',
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
                                              return const Padding(
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
                                              return const Padding(
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

                                                    // prefix: const Text('Name: '),
                                                    // enabled: true,
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
                                        child: ExpandablePanel(
                                          header: Text("Referal ID (Optional)",
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 12 * textScale)),
                                          collapsed: Container(),
                                          expanded: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            height: screenHeight * 0.055,
                                            color:
                                                theme.scaffoldBackgroundColor,
                                            child: FormBuilderField<String?>(
                                              name: 'name',
                                              onChanged: (val) =>
                                                  debugPrint(val.toString()),
                                              builder: (FormFieldState field) {
                                                return const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 15),
                                                  child: InputDecorator(
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      labelStyle: TextStyle(
                                                          fontSize: 18),
                                                      labelText: "Referal Code",
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
                                    )
                                  ]),
                                  Row(children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          height: screenHeight * 0.085,
                                          // color: theme.scaffoldBackgroundColor,
                                          width: screenWidth * 0.750,
                                          child: FormBuilderCheckbox(
                                            name: 'accept_terms',
                                            initialValue: false,
                                            onChanged: (value) => {},
                                            title: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        'I have read and agree to the ',
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize:
                                                            12 * textScale),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'Terms and Conditions',
                                                    style: TextStyle(
                                                      color: Colors.blueGrey,
                                                    ),
                                                    // Flutter doesn't allow a button inside a button
                                                    // https://github.com/flutter/flutter/issues/31437#issuecomment-492411086
                                                    /*
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('launch url');
                                },
                              */
                                                  ),
                                                ],
                                              ),
                                            ),
                                            validator:
                                                FormBuilderValidators.equal(
                                              true,
                                              errorText:
                                                  'You must accept terms and conditions to continue',
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
                                                  'Signup',
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
                                                return SignIn();
                                              }));
                                            },
                                            child: Text(
                                                'already have an account ?, Signin',
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
                                          child: FormBuilderTextField(
                                            name: 'countrycode',
                                            // controller: _countrycodeController,

                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
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
                                              return const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15),
                                                child: InputDecorator(
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
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
                                  height: screenWidth * 0.030,
                                ),
                                Row(children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 32,
                                      ),
                                      child: ExpandablePanel(
                                        header: Text("Referal ID (Optional)",
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 12 * textScale)),
                                        collapsed: Container(),
                                        expanded: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          height: screenHeight * 0.055,
                                          color: theme.scaffoldBackgroundColor,
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
                                                            horizontal: 5),
                                                    labelStyle: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                    labelText: "Referal Code",
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
                                  )
                                ]),
                                Row(children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        height: screenHeight * 0.085,
                                        // color: theme.scaffoldBackgroundColor,
                                        width: screenWidth * 0.750,
                                        child: FormBuilderCheckbox(
                                          name: 'accept_terms',
                                          initialValue: false,
                                          onChanged: (value) => {},
                                          title: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'I have read and agree to the ',
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize: 12 * textScale),
                                                ),
                                                TextSpan(
                                                  text: 'Terms and Conditions',
                                                  style: TextStyle(
                                                    color: Colors.blueGrey,
                                                  ),
                                                  // Flutter doesn't allow a button inside a button
                                                  // https://github.com/flutter/flutter/issues/31437#issuecomment-492411086
                                                  /*
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('launch url');
                                },
                              */
                                                ),
                                              ],
                                            ),
                                          ),
                                          validator:
                                              FormBuilderValidators.equal(
                                            true,
                                            errorText:
                                                'You must accept terms and conditions to continue',
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
                                            // onTap: verify,
                                            child: Center(
                                              child: Text(
                                                'Signup',
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
                                                  return SignIn();
                                                }));
                                              },
                                              child: Text(
                                                  'already have an account ?, Signin',
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
  }
}

class _SignUpMobile extends StatefulWidget {
  _SignUpMobile();

  @override
  _SignUpMobileState createState() => _SignUpMobileState();
}

class _SignUpMobileState extends State<_SignUpMobile> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _formKey2 = GlobalKey<FormBuilderState>();
  late String cxusername;
  late String cxpassword;
  late String cxcountrycode;
  late String cxphonenumber;
  late String cxreferalcode;
  final SecureStorage _secureStorage = SecureStorage();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countrycodeController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _referalcodeController = TextEditingController();
  Future<void> fetchSecureStorageData() async {
    cxusername = await _secureStorage.getEmail() ?? '';
    cxpassword = await _secureStorage.getPassWord() ?? '';
    cxcountrycode = await _secureStorage.getCountrycode() ?? '';
    cxphonenumber = await _secureStorage.getPhonenumber() ?? '';
    cxreferalcode = await _secureStorage.getReferalcode() ?? '';
  }

  late String _emailError = "This field is required";

  bool checkIfEmailExists(String email) {
    final existingEmails = [
      'syntacops@gmail.com',
    ];

    if (existingEmails.contains(email)) {
      return true;
    }
    return false;
  }

  bool _ageHasError = false;
  late String _countrycode;
  late String _phonenumber;
  late String _ReferalcodeError = "";
  late String _passwordError = "This field is required";

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
    fetchSecureStorageData();

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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    final formBuilderLocal = FormBuilderLocalizations();
    return Scaffold(
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
                    const Padding(padding: EdgeInsets.only(left: 350.0)),
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
                        'Signup',
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
                        'Welcome',
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
                                          color:
                                              Color.fromARGB(255, 98, 96, 139),
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
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 32,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        height: screenHeight * 0.055,
                                        color: theme.backgroundColor,
                                        width: screenWidth * 0.750,
                                        child: FormBuilderTextField(
                                          controller: _emailController,
                                          name: 'email',
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            labelStyle: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blueGrey),
                                            labelText: "Email Address",
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade300),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.0))),
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
                                        horizontal: 32,
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        height: screenHeight * 0.055,
                                        color: theme.backgroundColor,
                                        width: screenWidth * 0.750,
                                        child: FormBuilderTextField(
                                          controller: _passwordController,
                                          name: 'password',
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),

                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade300),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.0))),
                                            labelStyle: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.blueGrey),
                                            labelText: 'Password',
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
                                      child: ExpandablePanel(
                                        header: Text("Referal ID (Optional)",
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 12 * textScale)),
                                        collapsed: Container(),
                                        expanded: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          height: screenHeight * 0.055,
                                          color: theme.backgroundColor,
                                          child: FormBuilderTextField(
                                            controller: _referalcodeController,
                                            name: 'referal code',
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              labelStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blueGrey),

                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .grey.shade300),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              4.0))),
                                              labelText: 'Referal Code',
                                              // errorText: _ReferalcodeError,
                                            ),
                                            validator:
                                                FormBuilderValidators.compose(
                                                    []),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                                Row(children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        height: screenHeight * 0.085,
                                        // color: theme.scaffoldBackgroundColor,
                                        width: screenWidth * 0.750,
                                        child: FormBuilderCheckbox(
                                          name: 'accept_terms',
                                          initialValue: false,
                                          onChanged: (value) => {},
                                          title: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'I have read and agree to the ',
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize: 12 * textScale),
                                                ),
                                                TextSpan(
                                                  text: 'Terms and Conditions',
                                                  style: TextStyle(
                                                    color: Colors.blueGrey,
                                                  ),
                                                  // Flutter doesn't allow a button inside a button
                                                  // https://github.com/flutter/flutter/issues/31437#issuecomment-492411086
                                                  /*
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('launch url');
                                },
                              */
                                                ),
                                              ],
                                            ),
                                          ),
                                          validator:
                                              FormBuilderValidators.equal(
                                            true,
                                            errorText:
                                                'You must accept terms and conditions to continue',
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
                                              final validationSuccess = _formKey
                                                  .currentState!
                                                  .validate();

                                              if (validationSuccess) {
                                                //
                                                // Save only when validation passed
                                                _formKey.currentState!.save();
                                                //
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
                                                await _secureStorage.setEmail(
                                                    _emailController.text);

                                                // Get form data
                                                final formData = _formKey
                                                    .currentState!.value;

                                                //
                                                //                   context.read<AuthBloc>().add(
                                                //   _RegisterAuthEvent(
                                                //     email:_formKey.currentState!.fields['email']?.value,
                                                //     phonenumber:_formKey.currentState!.fields['phonenumber']?.value,
                                                //     countrycode:_formKey.currentState!.fields['countrycode']?.value,
                                                //     referalcode:_formKey.currentState!.fields['referalcode']?.value,
                                                //   password:_formKey.currentState!.fields['password']?.value
                                                //   ),
                                                // );

                                                // Reset form
                                                _formKey.currentState!.reset();
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
                                              FocusScope.of(context).unfocus();
                                            },
                                            child: Center(
                                              child: Text(
                                                'Signup',
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
                                      height: screenHeight * 0.030,
                                      // color: Colors.grey,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(MaterialPageRoute(
                                                    builder: (context) {
                                              return SignIn();
                                            }));
                                          },
                                          child: Text(
                                              'already have an account ?, Signin',
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
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade300),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    4.0))),
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
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            labelStyle: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blueGrey),
                                            labelText: "Phonenumber",
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade300),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.0))),

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
                                                EdgeInsets.symmetric(
                                                    horizontal: 8),

                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.grey.shade300),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.0))),
                                            labelStyle: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blueGrey),
                                            labelText: 'Password',
                                            // errorText: _passwordError,
                                          ),
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required(),

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
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 32,
                                      ),
                                      child: ExpandablePanel(
                                        header: Text("Referal ID (Optional)",
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 12 * textScale)),
                                        collapsed: Container(),
                                        expanded: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          height: screenHeight * 0.055,
                                          color: theme.backgroundColor,
                                          child: FormBuilderTextField(
                                            name: 'referalacode',
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8),

                                              enabledBorder: OutlineInputBorder(
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
                                              labelText: 'Referal Code',
                                              // errorText: _passwordError,
                                            ),
                                            validator:
                                                FormBuilderValidators.compose([
                                              FormBuilderValidators.required(),

                                              // FormBuilderValidators.pass(),
                                            ]),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                                Row(children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        height: screenHeight * 0.085,
                                        // color: theme.scaffoldBackgroundColor,
                                        width: screenWidth * 0.750,
                                        child: FormBuilderCheckbox(
                                          name: 'accept_terms',
                                          initialValue: false,
                                          onChanged: (value) => {},
                                          title: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'I have read and agree to the ',
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize: 12 * textScale),
                                                ),
                                                const TextSpan(
                                                  text: 'Terms and Conditions',
                                                  style: TextStyle(
                                                    color: Colors.blueGrey,
                                                  ),
                                                  // Flutter doesn't allow a button inside a button
                                                  // https://github.com/flutter/flutter/issues/31437#issuecomment-492411086
                                                  /*
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('launch url');
                                },
                              */
                                                ),
                                              ],
                                            ),
                                          ),
                                          validator:
                                              FormBuilderValidators.equal(
                                            true,
                                            errorText:
                                                'You must accept terms and conditions to continue',
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
                                                // verify();
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
                                                await _secureStorage.setEmail(
                                                    _emailController.text);

                                                //
                                                // Get form data
                                                final formData = _formKey2
                                                    .currentState!.value;
                                                //
                                                //                    context.read<AuthBloc>().add(
                                                //   _RegisterAuthEvent(
                                                //     email:_formKey.currentState!.fields['email']?.value,
                                                //     phonenumber:_formKey.currentState!.fields['phonenumber']?.value,
                                                //     countrycode:_formKey.currentState!.fields['countrycode']?.value,
                                                //     referalcode:_formKey.currentState!.fields['referalcode']?.value,
                                                //   password:_formKey.currentState!.fields['password']?.value
                                                //   ),
                                                // );
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
                                                'Signup',
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
                                                  return SignIn();
                                                }));
                                              },
                                              child: Text(
                                                  'already have an account ?, Signin',
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
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
