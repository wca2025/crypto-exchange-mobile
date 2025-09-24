// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:gt4_flutter_plugin/gt4_flutter_plugin.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _platformVersion = 'Unknown';

//   /// 监控页面配置变化
//   static const MethodChannel _demoChannel = MethodChannel('gt4_flutter_demo');

//   /// TO-DO
//   /// 集成前，请先替换从后台申请的 `captchaId`
//   /// Before initial new instance, replace `captchaId` sample with one of the captchaId registered from account backend.
//   final Gt4FlutterPlugin captcha =
//       Gt4FlutterPlugin("0a8f29a1127df8b6cbbfe07b12b06be7");

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     // We also handle the message potentially returning null.
//     try {
//       platformVersion =
//           await Gt4FlutterPlugin.platformVersion ?? 'Unknown platform version';
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }

//     try {
//       _demoChannel.setMethodCallHandler(_configurationChanged);

//       captcha.addEventHandler(onShow: (Map<String, dynamic> message) async {
//         // TO-DO
//         // 验证视图已展示
//         debugPrint("Captcha did show");
//       }, onResult: (Map<String, dynamic> message) async {
//         debugPrint("Captcha result: " + message.toString());
//         Fluttertoast.showToast(
//           msg: message.toString(),
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//         );

//         String status = message["status"];
//         if (status == "1") {
//           // TODO
//           // 发送 message["result"] 中的数据向服务端二次查询接口查询结果
//           Map result = message["result"] as Map;
//           await validateCaptchaResult(result
//               .map((key, value) => MapEntry(key.toString(), value.toString())));
//         } else {
//           // 终端用户完成验证错误，自动重试
//           debugPrint("Captcha 'onResult' state: $status");
//         }
//       }, onError: (Map<String, dynamic> message) async {
//         debugPrint("Captcha onError: " + message.toString());
//         Fluttertoast.showToast(
//           msg: message.toString(),
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//         );
//         String code = message["code"];
//         // TODO 处理验证中返回的错误
//         if (Platform.isAndroid) {
//           // Android 平台
//           if (code == "-14460") {
//             // 验证会话已取消
//           } else {
//             // 更多错误码参考开发文档
//             // https://docs.geetest.com/gt4/apirefer/errorcode/android
//           }
//         }

//         if (Platform.isIOS) {
//           // iOS 平台
//           if (code == "-20201") {
//             // 验证请求超时
//           } else if (code == "-20200") {
//             // 验证会话已取消
//           } else {
//             // 更多错误码参考开发文档
//             // https://docs.geetest.com/gt4/apirefer/errorcode/ios
//           }
//         }
//       });
//     } catch (e) {
//       debugPrint("Event handler exception " + e.toString());
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }

//   void verify() {
//     debugPrint("Start captcha. Current version: " + _platformVersion);
//     captcha.verify();
//   }

//   void close() {
//     debugPrint("Close captcha.");
//     captcha.close();
//   }

//   Future<dynamic> _configurationChanged(MethodCall methodCall) async {
//     debugPrint("Activity configurationChanged");
//     return captcha
//         .configurationChanged(methodCall.arguments.cast<String, dynamic>());
//   }

//   Future<dynamic> validateCaptchaResult(Map<String, String> result) async {
//     // TODO
//     // Submit captcha result for validation
//     debugPrint("Captcha validateCaptchaResult");
//     String validate = "http://gcaptcha4.geetest.com/validate";
//     final response = await http.post(Uri.parse(validate),
//         headers: {
//           "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8"
//         },
//         body: result);
//     if (response.statusCode == 200) {
//       debugPrint("Validate response: " + response.body);
//     } else {
//       debugPrint("URL: $validate, Response statusCode: ${response.statusCode}");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Running on: $_platformVersion\n'),
//               TextButton(
//                   style: ButtonStyle(
//                     foregroundColor:
//                         MaterialStateProperty.all<Color>(Colors.blue),
//                     overlayColor: MaterialStateProperty.resolveWith<Color?>(
//                       (Set<MaterialState> states) {
//                         if (states.contains(MaterialState.hovered)) {
//                           return Colors.blue.withOpacity(0.04);
//                         }
//                         if (states.contains(MaterialState.focused) ||
//                             states.contains(MaterialState.pressed)) {
//                           return Colors.blue.withOpacity(0.12);
//                         }
//                         return null; // Defer to the widget's default.
//                       },
//                     ),
//                   ),
//                   onPressed: verify,
//                   child: const Text('点击验证')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }








import 'dart:ui';
import 'package:flutter_fusioncharts/flutter_fusioncharts.dart';

import 'package:test/test.dart';
// import 'package:mocktail/mocktail.dart';

// import 'package:integration_test/integration_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:riverpod/riverpod.dart';
import '../../presentation/pro/themes.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:provider/provider.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:device_preview/device_preview.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import './presentation/pro/splash_screen_main.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_driver/driver_extension.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
// import 'l10n/l10n.dart';
import 'presentation/pro/language.dart';
import 'world_languages.dart';
import 'package:get/get.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';


import 'presentation/pro/onboarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(DevicePreview(
    builder: (context) => Solution(),
    enabled: !kReleaseMode,
  ));
}




class Solution extends StatefulWidget {
  @override
  _SolutionState createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {
  late Mixpanel mixpanel;

  @override
  void initState() {
    super.initState();
    initMixpanel();
  }

  Future<void> initMixpanel() async {
    mixpanel = await Mixpanel.init("54fad39ef67531ed13241c708abc985f",
        trackAutomaticEvents: true);
    // Track with event-name
    mixpanel.setLoggingEnabled(true);
    mixpanel.track('Sent Message');
// Track with event-name and property
    mixpanel.track('Plan Selected', properties: {'Plan': 'Premium'});

    mixpanel.flush();
  }

  @override
  Widget build(BuildContext context) 
         {
          // final provider = Provider.of<LocaleProvider>(context);

          final theme = Theme.of(context);
          if (UniversalPlatform.isAndroid) {
            return GetMaterialApp(
              theme: CustomTheme.lightTheme,
              darkTheme: CustomTheme.darkTheme,
              themeMode: currentTheme.currentTheme,

              // supportedLocales: L10n.all,
              localizationsDelegates: [
                FormBuilderLocalizations.delegate,

                // AppLocalizations.delegate,
                // GlobalMaterialLocalizations.delegate,
                // GlobalCupertinoLocalizations.delegate,
                // GlobalWidgetsLocalizations.delegate,
              ],
              home: _decideMainMaterialPage(),
              translations:
                  WorldLanguage(), //Language class from world_languages.dart
              locale: const Locale(
                  'en', 'US'), // translations will be displayed in that locale
              fallbackLocale: const Locale('en', 'US'),
              color: theme
                  .backgroundColor, // specify the fallback locale in case an invalid locale is selected.
            );
          } else if (UniversalPlatform.isIOS) {
            return GetCupertinoApp(
              // theme: CustomTheme.lightTheme,
              // darkTheme: CustomTheme.darkTheme,
              // themeMode: currentTheme.currentTheme,

              // supportedLocales: L10n.all,
              localizationsDelegates: [
                FormBuilderLocalizations.delegate,

                // AppLocalizations.delegate,
                // GlobalMaterialLocalizations.delegate,
                // GlobalCupertinoLocalizations.delegate,
                // GlobalWidgetsLocalizations.delegate,
              ],
              home: _decideMainCupertinoPage(),
              translations:
                  WorldLanguage(), //Language class from world_languages.dart
              locale: const Locale(
                  'en', 'US'), // translations will be displayed in that locale
              fallbackLocale: const Locale('en', 'US'),
              color: theme
                  .backgroundColor, // specify the fallback locale in case an invalid locale is selected.
            );
          }
          return Container(child: Text("Loading"),);
        }
      
}



_decideMainMaterialPage() {

    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
          title: 'Adaptive Theme Demo',
          theme: theme,
          darkTheme: darkTheme,
          home: SplashScreenMaterial()),
    );

}

_decideMainCupertinoPage() {
 
    return CupertinoAdaptiveTheme(
      light: CupertinoThemeData(
        brightness: Brightness.light,
        // primarySwatch: Colors.red,
        // accentColor: Colors.amber,
      ),
      dark: CupertinoThemeData(
        brightness: Brightness.dark,
        // primarySwatch: Colors.red,
        // accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme) => CupertinoApp(
          title: 'Adaptive Theme Demo',
          theme: theme,
          // darkTheme: darkTheme,
          home: SplashScreenCupertino()),
    );

}











// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';

// void main() {
//   runApp(DevicePreview(
//     builder: (context) => MyApp(),
//     enabled: !kReleaseMode,
//   ));
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Chat App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ChatPage(),
//     );
//   }
// }
// class ChatPage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//      return Chatprotate();
//   }
// }

// class Chatprotate extends State<ChatPage>{

//   late IOWebSocketChannel channel; //channel varaible for websocket
//   late bool connected; // boolean value to track connection status

//   String myid = "222"; //my id
//   String recieverid = "111"; //reciever id
//   // swap myid and recieverid value on another mobile to test send and recieve
//   String auth = "chatapphdfgjd34534hjdfk"; //auth key

//   List<MessageData> msglist = [];

//   TextEditingController msgtext = TextEditingController();

//   @override
//   void initState() {
//     connected = false;
//     msgtext.text = "";
//     channelconnect();
//     super.initState();
//   }

//   channelconnect(){ //function to connect
//     try{
//          channel = IOWebSocketChannel.connect("ws://192.168.43.3:6060/$myid&$recieverid"); //channel IP : Port
//          channel.stream.listen((message) {
//             print('testing123:'+message);
//             setState(() {
//                  if(message == "connected"){
//                       connected = true;
//                       setState(() { });
//                       print("Connection establised.");
//                  }else if(message == "send:success"){
//                       print("Message send success");
//                       setState(() {
//                         msgtext.text = "";
//                       });
//                  }else if(message == "send:error"){
//                      print("Message send error");
//                  }else if (message.substring(0, 6) == "{'cmd'") {
//                      print("Message data");
//                      message = message.replaceAll(RegExp("'"), '"');
//                      var jsondata = json.decode(message);

//                        msglist.add(MessageData( //on message recieve, add data to model
//                               msgtext: jsondata["msgtext"],
//                               userid: jsondata["userid"],
//                               recieverid:jsondata["recieverid"],
//                               isme: false,
//                           )
//                        );
//                     setState(() { //update UI after adding data to message model

//                     });
//                  }
//             });
//           },
//         onDone: () {
//           //if WebSocket is disconnected
//           print("Web socket is closed");
//           setState(() {
//                 connected = false;
//           });
//         },
//         onError: (error) {
//              print('herh:'+error.toString());
//         },);
//     }catch (_){
//       print("error on connecting to websocket.");
//     }
//   }

//   Future<void> sendmsg(String sendmsg, String id) async {
//          if(connected == true){
//             String msg = "{'auth':'$auth','cmd':'send','userid':'$id', 'msgtext':'$sendmsg'}";
//             setState(() {
//                msgtext.text = "";
//                msglist.add(MessageData(msgtext: sendmsg, userid: myid, isme: true));
//             });
//             channel.sink.add(msg); //send message to reciever channel
//          }else{
//             channelconnect();
//             print("Websocket is not connected.");
//          }
//   }

//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//         appBar: AppBar(
//           title: Text("My ID: $myid - Chat App Example"),
//           leading: Icon(Icons.circle, color: connected?Colors.greenAccent:Colors.redAccent),
//           //if app is connected to node.js then it will be gree, else red.
//           titleSpacing: 0,
//         ),
//         body: Container(
//            child: Stack(children: [
//                Positioned(
//                   top:0,bottom:70,left:0, right:0,
//                   child:Container(
//                     padding: EdgeInsets.all(15),
//                     child: SingleChildScrollView(
//                       child:Column(children: [

//                             Container(
//                               child:Text("Your Messages", style: TextStyle(fontSize: 20)),
//                             ),

//                             Container(
//                               child: Column(
//                                 children: msglist.map((onemsg){
//                                   return Container(
//                                      margin: EdgeInsets.only( //if is my message, then it has margin 40 at left
//                                              left: onemsg.isme?40:0,
//                                              right: onemsg.isme?0:40, //else margin at right
//                                           ),
//                                      child: Card(
//                                         color: onemsg.isme?Colors.blue[100]:Colors.red[100],
//                                         //if its my message then, blue background else red background
//                                         child: Container(
//                                           width: double.infinity,
//                                           padding: EdgeInsets.all(15),

//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [

//                                               Container(
//                                                 child:Text(onemsg.isme?"ID: ME":"ID: " + onemsg.userid)
//                                               ),

//                                               Container(
//                                                  margin: EdgeInsets.only(top:10,bottom:10),
//                                                  child: Text("Message: " + onemsg.msgtext, style: TextStyle(fontSize: 17)),
//                                               ),

//                                             ],),
//                                         )
//                                      )
//                                   );
//                                 }).toList(),
//                               )
//                             )
//                        ],)
//                     )
//                   )
//                ),

//                Positioned(  //position text field at bottom of screen

//                  bottom: 0, left:0, right:0,
//                  child: Container(
//                       color: Colors.black12,
//                       height: 70,
//                       child: Row(children: [

//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.all(10),
//                               child: TextField(
//                                   controller: msgtext,
//                                   decoration: InputDecoration(
//                                     hintText: "Enter your Message"
//                                   ),
//                               ),
//                             )
//                           ),

//                           Container(
//                             margin: EdgeInsets.all(10),
//                             child: ElevatedButton(
//                               child:Icon(Icons.send),
//                               onPressed: (){
//                                 if(msgtext.text != ""){
//                                   sendmsg(msgtext.text, recieverid); //send message with webspcket
//                                 }else{
//                                   print("Enter message");
//                                 }
//                               },
//                             )
//                           )
//                       ],)
//                     ),
//                )
//            ],)
//         )
//      );
//   }
// }

// class MessageData{ //message data model
//     String msgtext, userid;
//     bool isme;
//     MessageData({required this.msgtext, required this.userid, required this.isme, recieverid});

// }
