import 'dart:io';

import '../../presentation/pro/responsive.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:web_socket_channel/io.dart';

class Chat extends StatefulWidget {
  String? token;
  String? accounttype;
  Chat({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  ChatState createState() =>
      ChatState(token: this.token, accounttype: this.accounttype);
}

class ChatState extends State<Chat> {
  String? token;
  String? accounttype;
  ChatState({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: ChatMobile(token: token, accounttype: accounttype),
          tablet: ChatTablet(),
        ),
      ),
    );
  }
}

class ChatMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  ChatMobile({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  ChatMobileState createState() =>
      ChatMobileState(token: this.token, accounttype: this.accounttype);
}

class ChatMobileState extends State<ChatMobile> {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  ChatMobileState({this.token, this.accounttype});

  late IOWebSocketChannel channel; //channel varaible for websocket
  late bool connected; // boolean value to track connection status

  String myid = "222"; //my id
  String recieverid = "111"; //reciever id
  // swap myid and recieverid value on another mobile to test send and recieve
  String auth = "chatapphdfgjd34534hjdfk"; //auth key

  List<MessageData> msglist = [];

  TextEditingController msgtext = TextEditingController();

  @override
  void initState() {
    connected = false;
    msgtext.text = "";
    channelconnect();
    super.initState();
  }

  channelconnect() {
    //function to connect
    try {
      channel = IOWebSocketChannel.connect(
          "ws://192.168.0.109:6060/$myid"); //channel IP : Port
      channel.stream.listen(
        (message) {
          print(message);
          setState(() {
            if (message == "connected") {
              connected = true;
              setState(() {});
              print("Connection establised.");
            } else if (message == "send:success") {
              print("Message send success");
              setState(() {
                msgtext.text = "";
              });
            } else if (message == "send:error") {
              print("Message send error");
            } else if (message.substring(0, 6) == "{'cmd'") {
              print("Message data");
              message = message.replaceAll(RegExp("'"), '"');
              var jsondata = json.decode(message);

              msglist.add(MessageData(
                //on message recieve, add data to model
                msgtext: jsondata["msgtext"],
                userid: jsondata["userid"],
                isme: false,
              ));
              setState(() {
                //update UI after adding data to message model
              });
            }
          });
        },
        onDone: () {
          //if WebSocket is disconnected
          print("Web socket is closed");
          setState(() {
            connected = false;
          });
        },
        onError: (error) {
          print(error.toString());
        },
      );
    } catch (_) {
      print("error on connecting to websocket.");
    }
  }

  Future<void> sendmsg(String sendmsg, String id) async {
    if (connected == true) {
      String msg =
          "{'auth':'$auth','cmd':'send','userid':'$id', 'msgtext':'$sendmsg'}";
      setState(() {
        msgtext.text = "";
        msglist.add(MessageData(msgtext: sendmsg, userid: myid, isme: true));
      });
      channel.sink.add(msg); //send message to reciever channel
    } else {
      channelconnect();
      print("Websocket is not connected.");
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
          title:
              Text("Chat", style: TextStyle(color: Colors.black, fontSize: 20)),
          leading: Icon(Icons.circle,
              color: connected ? Colors.greenAccent : Colors.redAccent),
          //if app is connected to node.js then it will be gree, else red.
          elevation: 0.4,
        ),
        body: Container(
            child: Stack(
          children: [
            Positioned(
                top: 0,
                bottom: 70,
                left: 0,
                right: 0,
                child: Container(
                    padding: EdgeInsets.all(15),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Container(
                          child: Text("Your Messages",
                              style: TextStyle(fontSize: 20)),
                        ),
                        Container(
                            child: Column(
                          children: msglist.map((onemsg) {
                            return Container(
                                margin: EdgeInsets.only(
                                  //if is my message, then it has margin 40 at left
                                  left: onemsg.isme ? 40 : 0,
                                  right: onemsg.isme
                                      ? 0
                                      : 40, //else margin at right
                                ),
                                child: Card(
                                    color: onemsg.isme
                                        ? Colors.blue[100]
                                        : Colors.red[100],
                                    //if its my message then, blue background else red background
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(onemsg.isme
                                                  ? "ID: ME"
                                                  : "ID: " + onemsg.userid)),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                                "Message: " + onemsg.msgtext,
                                                style: TextStyle(fontSize: 17)),
                                          ),
                                        ],
                                      ),
                                    )));
                          }).toList(),
                        ))
                      ],
                    )))),
            Positioned(
              //position text field at bottom of screen

              bottom: 0, left: 0, right: 0,
              child: Container(
                  color: theme.scaffoldBackgroundColor,
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          controller: msgtext,
                          decoration:
                              InputDecoration(hintText: "Enter your Message"),
                        ),
                      )),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Icon(Icons.send),
                            onPressed: () {
                              if (msgtext.text != "") {
                                sendmsg(msgtext.text,
                                    recieverid); //send message with webspcket
                              } else {
                                print("Enter message");
                              }
                            },
                          ))
                    ],
                  )),
            )
          ],
        )));
  }
}

class ChatTablet extends StatefulWidget {
  @override
  ChatMobileState createState() => ChatMobileState();
}

class ChatTabletState extends State<ChatTablet> {
  late IOWebSocketChannel channel; //channel varaible for websocket
  late bool connected; // boolean value to track connection status

  String myid = "222"; //my id
  String recieverid = "111"; //reciever id
  // swap myid and recieverid value on another mobile to test send and recieve
  String auth = "chatapphdfgjd34534hjdfk"; //auth key

  List<MessageData> msglist = [];

  TextEditingController msgtext = TextEditingController();

  @override
  void initState() {
    connected = false;
    msgtext.text = "";
    channelconnect();
    super.initState();
  }

  channelconnect() {
    //function to connect
    try {
      channel = IOWebSocketChannel.connect(
          "ws://192.168.0.109:6060/$myid"); //channel IP : Port
      channel.stream.listen(
        (message) {
          print(message);
          setState(() {
            if (message == "connected") {
              connected = true;
              setState(() {});
              print("Connection establised.");
            } else if (message == "send:success") {
              print("Message send success");
              setState(() {
                msgtext.text = "";
              });
            } else if (message == "send:error") {
              print("Message send error");
            } else if (message.substring(0, 6) == "{'cmd'") {
              print("Message data");
              message = message.replaceAll(RegExp("'"), '"');
              var jsondata = json.decode(message);

              msglist.add(MessageData(
                //on message recieve, add data to model
                msgtext: jsondata["msgtext"],
                userid: jsondata["userid"],
                isme: false,
              ));
              setState(() {
                //update UI after adding data to message model
              });
            }
          });
        },
        onDone: () {
          //if WebSocket is disconnected
          print("Web socket is closed");
          setState(() {
            connected = false;
          });
        },
        onError: (error) {
          print(error.toString());
        },
      );
    } catch (_) {
      print("error on connecting to websocket.");
    }
  }

  Future<void> sendmsg(String sendmsg, String id) async {
    if (connected == true) {
      String msg =
          "{'auth':'$auth','cmd':'send','userid':'$id', 'msgtext':'$sendmsg'}";
      setState(() {
        msgtext.text = "";
        msglist.add(MessageData(msgtext: sendmsg, userid: myid, isme: true));
      });
      channel.sink.add(msg); //send message to reciever channel
    } else {
      channelconnect();
      print("Websocket is not connected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
          leading: Icon(Icons.circle,
              color: connected ? Colors.greenAccent : Colors.redAccent),
          //if app is connected to node.js then it will be gree, else red.
          elevation: 0.4,
        ),
        body: Container(
            child: Stack(
          children: [
            Positioned(
                top: 0,
                bottom: 70,
                left: 0,
                right: 0,
                child: Container(
                    padding: EdgeInsets.all(15),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Container(
                          child: Text("Your Messages",
                              style: TextStyle(fontSize: 20)),
                        ),
                        Container(
                            child: Column(
                          children: msglist.map((onemsg) {
                            return Container(
                                margin: EdgeInsets.only(
                                  //if is my message, then it has margin 40 at left
                                  left: onemsg.isme ? 40 : 0,
                                  right: onemsg.isme
                                      ? 0
                                      : 40, //else margin at right
                                ),
                                child: Card(
                                    color: onemsg.isme
                                        ? Colors.blue[100]
                                        : Colors.red[100],
                                    //if its my message then, blue background else red background
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(onemsg.isme
                                                  ? "ID: ME"
                                                  : "ID: " + onemsg.userid)),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                                "Message: " + onemsg.msgtext,
                                                style: TextStyle(fontSize: 17)),
                                          ),
                                        ],
                                      ),
                                    )));
                          }).toList(),
                        ))
                      ],
                    )))),
            Positioned(
              //position text field at bottom of screen

              bottom: 0, left: 0, right: 0,
              child: Container(
                  color: Colors.black12,
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          controller: msgtext,
                          decoration:
                              InputDecoration(hintText: "Enter your Message"),
                        ),
                      )),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Icon(Icons.send),
                            onPressed: () {
                              if (msgtext.text != "") {
                                sendmsg(msgtext.text,
                                    recieverid); //send message with webspcket
                              } else {
                                print("Enter message");
                              }
                            },
                          ))
                    ],
                  )),
            )
          ],
        )));
  }
}

class MessageData {
  //message data model
  String msgtext, userid;
  bool isme;
  MessageData(
      {required this.msgtext, required this.userid, required this.isme});
}
