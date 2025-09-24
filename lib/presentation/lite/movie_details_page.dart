import 'package:expandable/expandable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'actor_scroller.dart';

import 'movie_detail_header.dart';
import 'photo_scroller.dart';
import 'story_line.dart';
import 'package:share/share.dart';

import 'package:back_button_interceptor/back_button_interceptor.dart';

Widget myWidget(BuildContext context) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 300,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.amber,
            child: Center(child: Text('$index')),
          );
        }),
  );
}

class NftDetailsPage extends StatefulWidget {
  String? token;
  String? accounttype;
  NftDetailsPage({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  NftDetailsprotate createState() =>
      NftDetailsprotate(token: this.token, accounttype: this.accounttype);
}

class NftDetailsprotate extends State<NftDetailsPage> {
  String? token;
  String? accounttype;
  NftDetailsprotate({this.token, this.accounttype});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: NftDetailsPageMobile(token: token, accounttype: accounttype),
          tablet: NftDetailsPageTablet(),
        ),
      ),
    );
  }
}

class NftDetailsPageTablet extends StatefulWidget {
  @override
  NftDetailsPageTabletState createState() => new NftDetailsPageTabletState();

  NftDetailsPageTablet();
}

class NftDetailsPageTabletState extends State<NftDetailsPageTablet> {
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    // BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context);

    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  final ScrollController _controller = ScrollController();

// class NftDetailsPageMobile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Container(
        // height: screenHeight * 3.8,
        color: theme.backgroundColor,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Container(
                      color: theme.backgroundColor,
                      height: screenHeight * 0.40,
                      width: screenWidth * 0.880,
                      child: NftDetailHeader(),
                    ))),
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: Container(
                      color: theme.backgroundColor,
                      height: screenHeight * 0.5,
                      width: screenWidth * 0.880,
                      child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // movie

                              ExpandablePanel(
                                header: Container(
                                    width: screenWidth * 0.700,

                                    // color: theme.backgroundColor,
                                    child: Column(children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 32,
                                                    left: 15,
                                                    bottom: 0),
                                                child: Text(
                                                  'Moon Bird',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                            Expanded(child: Container()),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 18,
                                                    left: 10,
                                                    bottom: 0),
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                        iconSize: 20,
                                                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                                        icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .instagram),
                                                        onPressed: () {
                                                          print("Pressed");
                                                        }),
                                                    IconButton(
                                                        iconSize: 20,
                                                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                                        icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .twitter),
                                                        onPressed: () {
                                                          print("Pressed");
                                                        }),
                                                    IconButton(
                                                        iconSize: 20,
                                                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                                        icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .globe),
                                                        onPressed: () {
                                                          print("Pressed");
                                                        })
                                                  ],
                                                )),
                                          ]),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 15,
                                                    left: 15,
                                                    bottom: 0),
                                                child: Text(
                                                  'Price',
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: Colors.black38,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 15,
                                                    left: 15,
                                                    bottom: 0),
                                                child: Text(
                                                  '0.324 Matic',
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 15,
                                                    left: 15,
                                                    bottom: 0),
                                                child: Text(
                                                  'Owners',
                                                  style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 15,
                                                    left: 15,
                                                    bottom: 0),
                                                child: Text(
                                                  '2.4k',
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 15,
                                                    left: 15,
                                                    bottom: 0),
                                                child: Text(
                                                  'Last sale',
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: Colors.black38,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 15,
                                                    left: 15,
                                                    bottom: 0),
                                                child: Text(
                                                  '0.243',
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )),
                                          ])
                                    ])),
                                collapsed: Container(
                                  color: theme.backgroundColor,
                                  child: Column(children: [
                                    Container(
                                        color: theme.backgroundColor,
                                        height: screenHeight * 0.06,
                                        child: ListView(
                                            controller: _controller,

                                            // itemCount: 8,
                                            padding: const EdgeInsets.all(1.0),
                                            // itemBuilder: (context, index) {
                                            //   var bean = _list[index]; return
                                            children: [
                                              Container(
                                                color: Colors.white70,
                                                // width: screenWidth * 0.880,
                                                child: InkWell(
                                                  onTap: () {
                                                    // Navigator.of(context,rootNavigator: true)
                                                    //     .push(MaterialPageRoute(builder: (context) {
                                                    //   // return DetailPage(bean);
                                                    //   return NftDetailsPage();
                                                    // }));
                                                  },
                                                  child: Column(children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text(
                                                        " Virgo is a sapphire rarity tier hoiscope of 12 hprpsope nfts collection....",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize:
                                                                13 * textScale,
                                                            color:
                                                                Colors.black38)
                                                        // storyline "
                                                        ,
                                                        // style: textTheme.body1.copyWith(
                                                        //   color: Colors.black45,
                                                        //   fontSize: 12.0,
                                                        // ),
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              ),
                                            ]
                                            // },
                                            )),
                                  ]),
                                ),
                                expanded: Container(
                                  color: theme.backgroundColor,
                                  child: Column(children: [
                                    Container(
                                        color: theme.backgroundColor,
                                        height: screenHeight * 0.10,
                                        child: ListView(
                                            controller: _controller,

                                            // itemCount: 8,
                                            padding: const EdgeInsets.all(1.0),
                                            // itemBuilder: (context, index) {
                                            //   var bean = _list[index]; return
                                            children: [
                                              Container(
                                                color: Colors.white70,
                                                // width: screenWidth * 0.880,
                                                child: InkWell(
                                                  onTap: () {
                                                    // Navigator.of(context,rootNavigator: true)
                                                    //     .push(MaterialPageRoute(builder: (context) {
                                                    //   // return DetailPage(bean);
                                                    //   return NftDetailsPage();
                                                    // }));
                                                  },
                                                  child: Column(children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text(
                                                        " Virgo is a sapphire rarity tier hoiscope of 12 hprpsope nfts collection that will be released for the upcoming amazing pandaverse ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize:
                                                                14 * textScale,
                                                            color:
                                                                Colors.black38)
                                                        // storyline "
                                                        ,
                                                        // style: textTheme.body1.copyWith(
                                                        //   color: Colors.black45,
                                                        //   fontSize: 12.0,
                                                        // ),
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              ),
                                            ]
                                            // },
                                            )),
                                  ]),
                                ),
                              ),

                              Container(
                                  color: theme.backgroundColor,
                                  height: screenHeight * 0.73,
                                  child: ListView(
                                      controller: _controller,

                                      // itemCount: 8,
                                      padding: const EdgeInsets.all(1.0),
                                      // itemBuilder: (context, index) {
                                      //   var bean = _list[index]; return
                                      children: [
                                        Container(
                                          color: Colors.white70,
                                          // width: screenWidth * 0.880,
                                          child: InkWell(
                                            onTap: () {
                                              // Navigator.of(context,rootNavigator: true)
                                              //     .push(MaterialPageRoute(builder: (context) {
                                              //   // return DetailPage(bean);
                                              //   return NftDetailsPage();
                                              // }));
                                            },
                                            child: Column(children: [
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Text(" About",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:
                                                              16 * textScale,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        )),
                                                    Expanded(
                                                        child: Container(
                                                            width: screenWidth *
                                                                0.08)),
                                                    // Text("2022-05-25",
                                                    //     style: TextStyle(
                                                    //       color: Colors.black38,
                                                    //       fontSize: 14 * textScale,
                                                    //       fontWeight: FontWeight.w500,
                                                    //     ))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Text("Created By:",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                                 gjhk.jblnkkjhg",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Text("Owned By:",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                                  gjhk.erfwegg",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Text("Category",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                                     1.",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Text("Edition",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                                         gjhk.",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Text("About",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                                           gjhk.",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Text("Token ID",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                                       4563462",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Text("Token Standard",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                         gjhk.",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Text("Blockchain",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                                  gjhk.",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                color: theme
                                                    .scaffoldBackgroundColor,
                                                height: 1,
                                                thickness: 3,
                                                indent: 0,
                                                endIndent: 0,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Text("Blockchain",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                                  gjhk.",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Text("Blockchain",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                                  gjhk.",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Text("Blockchain",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        )),
                                                    Text(
                                                        "                                  gjhk.",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize:
                                                              14 * textScale,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                      ]
                                      // },
                                      ))

                              // movie.actors
                              // ActorScroller(),
                            ],
                          )),
                    ))),
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: Container(
                        height: screenHeight * 0.0,
                        width: screenWidth * 0.880,
                        child: Column(children: [
                          SizedBox(
                            height: screenWidth * 0.020,
                          ),
                        ])))),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Container(
                  height: screenHeight,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: Container(
                        color: theme.backgroundColor,
                        height: screenHeight,
                        width: screenWidth * 0.880,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: screenHeight * 0.10,
                              ),
                              Row(children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 5),
                                  child: IconButton(
                                      iconSize: 20,
                                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                      icon: FaIcon(FontAwesomeIcons.heart),
                                      onPressed: () {
                                        print("Pressed");
                                      }),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0, right: 5),
                                  child: IconButton(
                                      iconSize: 20,
                                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                      icon: FaIcon(FontAwesomeIcons.share),
                                      onPressed: () {
                                        print("Pressed");
                                      }),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0, right: 15),
                                  child: GestureDetector(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth * 0.30,
                                      height: screenHeight * 0.055,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          color: theme.scaffoldBackgroundColor),
                                      child: const Padding(
                                        padding: EdgeInsets.all(0.0),
                                        child: InkWell(
                                          // onTap: _signUp,
                                          child: Center(
                                            child: Text(
                                              'Offer',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 0, right: 10),
                                  child: GestureDetector(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: screenWidth * 0.30,
                                      height: screenHeight * 0.055,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          color: theme.scaffoldBackgroundColor),
                                      child: const Padding(
                                        padding: EdgeInsets.all(0.0),
                                        child: InkWell(
                                          // onTap: _signUp,
                                          child: Center(
                                            child: Text(
                                              'Buy',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                              SizedBox(
                                height: screenWidth * 0.045,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    color: theme.backgroundColor,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, -15),
                                        blurRadius: 20,
                                        color:
                                            Color(0xFFDADADA).withOpacity(0.15),
                                      ),
                                    ],
                                  ),
                                  width: screenWidth,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 0.0),
                                        child: Text(
                                          'More from Artist',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16 * textScale),

                                          // style: textTheme.subhead.copyWith(fontSize: 18.0),
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: screenWidth * 0.020,
                              ),
                              Container(
                                color: theme.backgroundColor,
                                height: screenHeight * 0.300,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 8,
                                  padding: const EdgeInsets.all(5.0),
                                  itemBuilder: (context, index) {
                                    // var bean = _list[index];
                                    return Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Container(
                                          height: screenHeight * 0.180,
                                          // padding: const EdgeInsets.all(1),

                                          // child: Text('lorem'),
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .push(MaterialPageRoute(
                                                        builder: (context) {
                                                  return NftDetailsPage();
                                                }));
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: theme
                                                            .backgroundColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5.0))),
                                                    height:
                                                        screenHeight * 0.200,
                                                    width: screenWidth * 0.405,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      child: FadeInImage
                                                          .assetNetwork(
                                                              alignment: Alignment
                                                                  .topCenter, // add this
                                                              placeholder:
                                                                  'dummy image',
                                                              image:
                                                                  'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                                              fit: BoxFit.fill,
                                                              height:
                                                                  screenHeight *
                                                                      0.180,
                                                              width:
                                                                  screenWidth *
                                                                      0.405),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.0,
                                                                bottom: 1.0,
                                                                left: 1.0,
                                                                right: 1.0),
                                                        child: Text("MoonBirds",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                color: Colors
                                                                    .black)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.0,
                                                                bottom: 1.0,
                                                                left: 80.0,
                                                                right: 3.0),
                                                        child: Text(
                                                          "",
                                                          style: TextStyle(
                                                            // color: backgroundColor,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.0,
                                                                bottom: 1.0,
                                                                left: 0.0,
                                                                right: 3.0),
                                                        child: Text("Price",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12 *
                                                                    textScale,
                                                                color: Colors
                                                                    .black38)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.0,
                                                                bottom: 1.0,
                                                                left: 100.0,
                                                                right: 3.0),
                                                        child: Text("2",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12 *
                                                                    textScale,
                                                                color: Colors
                                                                    .black38)),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.0,
                                                                bottom: 1.0,
                                                                left: 0.0,
                                                                right: 3.0),
                                                        child: Text("Quantity",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12 *
                                                                    textScale,
                                                                color: Colors
                                                                    .black38)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.0,
                                                                bottom: 1.0,
                                                                left: 80.0,
                                                                right: 3.0),
                                                        child: Text("2",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12 *
                                                                    textScale,
                                                                color: Colors
                                                                    .black38)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),

                                          //color: Colors.grey,
                                        ));
                                  },
                                ),
                              ),
                            ])))),
          ],
        ),
      ),
    );
  }
}

class NftDetailsPageMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  NftDetailsPageMobile({Key? key, this.token, this.accounttype})
      : super(key: key);

  @override
  NftDetailsprotate createState() =>
      NftDetailsprotate(token: this.token, accounttype: this.accounttype);
}

class NftDetailsPageMobileState extends State<NftDetailsPageMobile> {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  NftDetailsPageMobileState({this.token, this.accounttype});

  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    // BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context);

    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  final ScrollController _controller = ScrollController();

// class NftDetailsPageMobile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    // Movie movie;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Container(
          height: screenHeight * 1.8,
          color: theme.scaffoldBackgroundColor,
          child:
              // BlocConsumer<TransactionBloc, TransactionState>(
              //     listener: (context, state) {
              //   // TODO: implement listener
              // },
              //  builder: (context, state) {

              // Transaction transaction = state.transaction;

              // return
              CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Container(
                        color: theme.backgroundColor,
                        height: screenHeight * 0.40,
                        width: screenWidth * 0.880,
                        child: NftDetailHeader(),
                      ))),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Container(
                          height: screenHeight * 0.8,
                          child:
                              //            (state is _ErrorAuthState)
                              // ?

                              //         Container(
                              //             color: theme.backgroundColor,
                              //             child: Column(
                              //               mainAxisAlignment: MainAxisAlignment.center,
                              //               crossAxisAlignment: CrossAxisAlignment.center,
                              //               children: [
                              //                 // const SizedBox(height: 0.50),
                              //                 Center(
                              //                   child: Text(
                              //                     "Network Error ",
                              //                     style: TextStyle(
                              //                         fontSize: 14 * textScale,
                              //                         fontWeight: FontWeight.w500,
                              //                         color: Colors.black38),
                              //                   ),
                              //                 ),
                              //                 Center(
                              //                   child: Text(
                              //                     "Please refresh the page and try again",
                              //                     style: TextStyle(
                              //                         fontSize: 12 * textScale,
                              //                         fontWeight: FontWeight.w500,
                              //                         color: Colors.black38),
                              //                   ),
                              //                 ),
                              //                 SizedBox(
                              //                   height: screenHeight * 0.01,
                              //                 ),
                              //                 Row(
                              //                   children: [
                              //                     // const Padding(
                              //                     // padding: EdgeInsets.only(
                              //                     //   left: 10,
                              //                     // ),
                              //                     // ),
                              //                     const Padding(
                              //                       padding: EdgeInsets.only(
                              //                         left: 50,
                              //                       ),
                              //                     ),
                              //                     Expanded(
                              //                       child: Container(
                              //                           child: Center(
                              //                               child: SizedBox(
                              //                                   width: screenWidth * 0.25,
                              //                                   child: TextButton(
                              //                                     style: ButtonStyle(
                              //                                         backgroundColor:
                              //                                             MaterialStateProperty
                              //                                                 .all<Color>(
                              //                                       const Color(0xFFf5f7fa),
                              //                                     )),
                              //                                     onPressed: () {
                              //                                       // Navigator.of(context,
                              //                                       //         rootNavigator:
                              //                                       //             true)
                              //                                       //     .push(MaterialPageRoute(
                              //                                       //         builder:
                              //                                       //             (context) {
                              //                                       //   return Buy();
                              //                                       // }));
                              //                                     },
                              //                                     child: Text(
                              //                                       'Refresh',
                              //                                       style: TextStyle(
                              //                                           fontSize:
                              //                                               14 * textScale,
                              //                                           fontWeight:
                              //                                               FontWeight.w600,
                              //                                           color:
                              //                                               Colors.black),
                              //                                     ),
                              //                                   )))),
                              //                     ),
                              //                     // const Padding(
                              //                     //   padding: EdgeInsets.only(
                              //                     //     left: 4,
                              //                     //   ),
                              //                     // ),

                              //                     const Padding(
                              //                       padding: EdgeInsets.only(
                              //                         left: 50,
                              //                       ),
                              //                     ),
                              //                   ],
                              //                 )

                              //               ],
                              //             ))

                              // //
                              // :

                              Container(
                            color: theme.backgroundColor,
                            height: screenHeight * 0.75,
                            width: screenWidth * 0.880,
                            child: Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // movie

                                    ExpandablePanel(
                                      header: Container(
                                          width: screenWidth * 0.700,

                                          // color: theme.backgroundColor,
                                          child: Column(children: [
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 32,
                                                          left: 15,
                                                          bottom: 0),
                                                      child: Text(
                                                        'Moon Bird',
                                                        style: TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )),
                                                  Expanded(child: Container()),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 18,
                                                          left: 10,
                                                          bottom: 0),
                                                      child: Row(
                                                        children: [
                                                          IconButton(
                                                              iconSize: 20,
                                                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                                              icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .instagram),
                                                              onPressed: () {
                                                                print(
                                                                    "Pressed");
                                                              }),
                                                          IconButton(
                                                              iconSize: 20,
                                                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                                              icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .twitter),
                                                              onPressed: () {
                                                                print(
                                                                    "Pressed");
                                                              }),
                                                          IconButton(
                                                              iconSize: 20,
                                                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                                              icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .globe),
                                                              onPressed: () {
                                                                print(
                                                                    "Pressed");
                                                              })
                                                        ],
                                                      )),
                                                ]),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15,
                                                          left: 15,
                                                          bottom: 0),
                                                      child: Text(
                                                        'Price',
                                                        style: TextStyle(
                                                            fontSize: 13.0,
                                                            color:
                                                                Colors.black38,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15,
                                                          left: 15,
                                                          bottom: 0),
                                                      child: Text(
                                                        '0.324 Matic',
                                                        style: TextStyle(
                                                            fontSize: 13.0,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15,
                                                          left: 15,
                                                          bottom: 0),
                                                      child: Text(
                                                        'Owners',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize: 13.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15,
                                                          left: 15,
                                                          bottom: 0),
                                                      child: Text(
                                                        '2.4k',
                                                        style: TextStyle(
                                                            fontSize: 13.0,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15,
                                                          left: 15,
                                                          bottom: 0),
                                                      child: Text(
                                                        'Last sale',
                                                        style: TextStyle(
                                                            fontSize: 13.0,
                                                            color:
                                                                Colors.black38,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      )),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 15,
                                                          left: 15,
                                                          bottom: 0),
                                                      child: Text(
                                                        '0.243',
                                                        style: TextStyle(
                                                            fontSize: 13.0,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      )),
                                                ])
                                          ])),
                                      collapsed: Container(
                                        color: theme.backgroundColor,
                                        child: Column(children: [
                                          Container(
                                              color: theme.backgroundColor,
                                              height: screenHeight * 0.06,
                                              child: ListView(
                                                  controller: _controller,

                                                  // itemCount: 8,
                                                  padding:
                                                      const EdgeInsets.all(1.0),
                                                  // itemBuilder: (context, index) {
                                                  //   var bean = _list[index]; return
                                                  children: [
                                                    Container(
                                                      color: Colors.white70,
                                                      // width: screenWidth * 0.880,
                                                      child: InkWell(
                                                        onTap: () {
                                                          // Navigator.of(context,rootNavigator: true)
                                                          //     .push(MaterialPageRoute(builder: (context) {
                                                          //   // return DetailPage(bean);
                                                          //   return NftDetailsPage();
                                                          // }));
                                                        },
                                                        child:
                                                            Column(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Text(
                                                              " Virgo is a sapphire rarity tier hoiscope of 12 hprpsope nfts collection....",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 13 *
                                                                      textScale,
                                                                  color: Colors
                                                                      .black38)
                                                              // storyline "
                                                              ,
                                                              // style: textTheme.body1.copyWith(
                                                              //   color: Colors.black45,
                                                              //   fontSize: 12.0,
                                                              // ),
                                                            ),
                                                          ),
                                                        ]),
                                                      ),
                                                    ),
                                                  ]
                                                  // },
                                                  )),
                                        ]),
                                      ),
                                      expanded: Container(
                                        color: theme.backgroundColor,
                                        child: Column(children: [
                                          Container(
                                              color: theme.backgroundColor,
                                              height: screenHeight * 0.09,
                                              child: ListView(
                                                  controller: _controller,

                                                  // itemCount: 8,
                                                  padding:
                                                      const EdgeInsets.all(1.0),
                                                  // itemBuilder: (context, index) {
                                                  //   var bean = _list[index]; return
                                                  children: [
                                                    Container(
                                                      color: Colors.white70,
                                                      // width: screenWidth * 0.880,
                                                      child: InkWell(
                                                        onTap: () {
                                                          // Navigator.of(context,rootNavigator: true)
                                                          //     .push(MaterialPageRoute(builder: (context) {
                                                          //   // return DetailPage(bean);
                                                          //   return NftDetailsPage();
                                                          // }));
                                                        },
                                                        child:
                                                            Column(children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Text(
                                                              " Virgo is a sapphire rarity tier hoiscope of 12 hprpsope nfts collection that will be released for the upcoming amazing pandaverse ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 14 *
                                                                      textScale,
                                                                  color: Colors
                                                                      .black38)
                                                              // storyline "
                                                              ,
                                                              // style: textTheme.body1.copyWith(
                                                              //   color: Colors.black45,
                                                              //   fontSize: 12.0,
                                                              // ),
                                                            ),
                                                          ),
                                                        ]),
                                                      ),
                                                    ),
                                                  ]
                                                  // },
                                                  )),
                                        ]),
                                      ),
                                    ),

                                    Container(
                                        color: theme.backgroundColor,
                                        height: screenHeight * 0.53,
                                        child: ListView(
                                            controller: _controller,

                                            // itemCount: 8,
                                            padding: const EdgeInsets.all(1.0),
                                            // itemBuilder: (context, index) {
                                            //   var bean = _list[index]; return
                                            children: [
                                              Container(
                                                color: Colors.white70,
                                                // width: screenWidth * 0.880,
                                                child: InkWell(
                                                  onTap: () {
                                                    // Navigator.of(context,rootNavigator: true)
                                                    //     .push(MaterialPageRoute(builder: (context) {
                                                    //   // return DetailPage(bean);
                                                    //   return NftDetailsPage();
                                                    // }));
                                                  },
                                                  child: Column(children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          Text(" About",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              )),
                                                          Expanded(
                                                              child: Container(
                                                                  width:
                                                                      screenWidth *
                                                                          0.08)),
                                                          // Text("2022-05-25",
                                                          //     style: TextStyle(
                                                          //       color: Colors.black38,
                                                          //       fontSize: 14 * textScale,
                                                          //       fontWeight: FontWeight.w500,
                                                          //     ))
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          Text("Created By:",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          Text(
                                                              "                                 gjhk.jblnkkjhg",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          Text("Owned By:",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          Text(
                                                              "                                  gjhk.erfwegg",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          Text("Category",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          Text(
                                                              "                                     1.",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          Text("Edition",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          Text(
                                                              "                                         gjhk.",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          Text("About",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          Text(
                                                              "                                           gjhk.",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          Text("Token ID",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          Text(
                                                              "                                       4563462",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          Text("Token Standard",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          Text(
                                                              "                         gjhk.",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          Text("Blockchain",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          Text(
                                                              "                                  gjhk.",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: theme
                                                          .scaffoldBackgroundColor,
                                                      height: 1,
                                                      thickness: 3,
                                                      indent: 0,
                                                      endIndent: 0,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          Text("Blockchain",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          Text(
                                                              "                                  gjhk.",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          Text("Blockchain",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          Text(
                                                              "                                  gjhk.",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Row(
                                                        children: [
                                                          Text("Blockchain",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          Text(
                                                              "                                  gjhk.",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: 14 *
                                                                    textScale,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              ),
                                            ]
                                            // },
                                            ))

                                    // movie.actors
                                    // ActorScroller(),
                                  ],
                                )),
                          )))),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: Container(
                          height: screenHeight * 0.0,
                          width: screenWidth * 0.880,
                          child: Column(children: [
                            SizedBox(
                              height: screenWidth * 0.020,
                            ),
                          ])))),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: Container(
                          color: theme.backgroundColor,
                          height: screenHeight * 0.46,
                          width: screenWidth * 0.880,
                          child: Column(children: [
                            SizedBox(
                              height: screenWidth * 0.020,
                            ),
                            Row(children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 5),
                                child: IconButton(
                                    iconSize: 20,
                                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                    icon: FaIcon(FontAwesomeIcons.heart),
                                    onPressed: () {
                                      print("Pressed");
                                    }),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0, right: 5),
                                child: IconButton(
                                    iconSize: 20,
                                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                    icon: FaIcon(FontAwesomeIcons.share),
                                    onPressed: () {
                                      print("Pressed");
                                    }),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0, right: 15),
                                child: GestureDetector(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: screenWidth * 0.30,
                                    height: screenHeight * 0.055,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        color: theme.scaffoldBackgroundColor),
                                    child: const Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: InkWell(
                                        // onTap: _signUp,
                                        child: Center(
                                          child: Text(
                                            'Offer',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0, right: 10),
                                child: GestureDetector(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: screenWidth * 0.30,
                                    height: screenHeight * 0.055,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        color: theme.scaffoldBackgroundColor),
                                    child: const Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: InkWell(
                                        // onTap: _signUp,
                                        child: Center(
                                          child: Text(
                                            'Buy',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                            SizedBox(
                              height: screenWidth * 0.045,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  color: theme.backgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, -15),
                                      blurRadius: 20,
                                      color:
                                          Color(0xFFDADADA).withOpacity(0.15),
                                    ),
                                  ],
                                ),
                                width: screenWidth,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 0.0),
                                      child: Text(
                                        'More from Artist',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16 * textScale),

                                        // style: textTheme.subhead.copyWith(fontSize: 18.0),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: screenWidth * 0.020,
                            ),
                            Container(
                                height: screenHeight * 0.300,
                                child:
                                    //            (state is _ErrorAuthState)
                                    // ?

                                    // Container(
                                    //     color: theme.backgroundColor,
                                    //     child: Column(
                                    //       mainAxisAlignment: MainAxisAlignment.center,
                                    //       crossAxisAlignment: CrossAxisAlignment.center,
                                    //       children: [
                                    //         // const SizedBox(height: 0.50),
                                    //         Center(
                                    //           child: Text(
                                    //             "Network Error ",
                                    //             style: TextStyle(
                                    //                 fontSize: 14 * textScale,
                                    //                 fontWeight: FontWeight.w500,
                                    //                 color: Colors.black38),
                                    //           ),
                                    //         ),
                                    //         Center(
                                    //           child: Text(
                                    //             "Please refresh the page and try again",
                                    //             style: TextStyle(
                                    //                 fontSize: 12 * textScale,
                                    //                 fontWeight: FontWeight.w500,
                                    //                 color: Colors.black38),
                                    //           ),
                                    //         ),
                                    //         SizedBox(
                                    //           height: screenHeight * 0.01,
                                    //         ),
                                    //         Row(
                                    //           children: [
                                    //             // const Padding(
                                    //             // padding: EdgeInsets.only(
                                    //             //   left: 10,
                                    //             // ),
                                    //             // ),
                                    //             const Padding(
                                    //               padding: EdgeInsets.only(
                                    //                 left: 50,
                                    //               ),
                                    //             ),
                                    //             Expanded(
                                    //               child: Container(
                                    //                   child: Center(
                                    //                       child: SizedBox(
                                    //                           width: screenWidth * 0.25,
                                    //                           child: TextButton(
                                    //                             style: ButtonStyle(
                                    //                                 backgroundColor:
                                    //                                     MaterialStateProperty
                                    //                                         .all<Color>(
                                    //                               const Color(0xFFf5f7fa),
                                    //                             )),
                                    //                             onPressed: () {
                                    //                               // Navigator.of(context,
                                    //                               //         rootNavigator:
                                    //                               //             true)
                                    //                               //     .push(MaterialPageRoute(
                                    //                               //         builder:
                                    //                               //             (context) {
                                    //                               //   return Buy();
                                    //                               // }));
                                    //                             },
                                    //                             child: Text(
                                    //                               'Refresh',
                                    //                               style: TextStyle(
                                    //                                   fontSize:
                                    //                                       14 * textScale,
                                    //                                   fontWeight:
                                    //                                       FontWeight.w600,
                                    //                                   color:
                                    //                                       Colors.black),
                                    //                             ),
                                    //                           )))),
                                    //             ),
                                    //             // const Padding(
                                    //             //   padding: EdgeInsets.only(
                                    //             //     left: 4,
                                    //             //   ),
                                    //             // ),

                                    //             const Padding(
                                    //               padding: EdgeInsets.only(
                                    //                 left: 50,
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         )

                                    //       ],
                                    //     )

                                    //
                                    // :

                                    Container(
                                  color: theme.backgroundColor,
                                  height: screenHeight * 0.300,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    // itemCount: state.groupnftbyid.length,
                                    padding: const EdgeInsets.all(5.0),
                                    itemBuilder: (context, index) {
                                      // var bean = _list[index];
                                      return Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Container(
                                            height: screenHeight * 0.180,
                                            // padding: const EdgeInsets.all(1),

                                            // child: Text('lorem'),
                                            child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .push(MaterialPageRoute(
                                                          builder: (context) {
                                                    return NftDetailsPage();
                                                  }));
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: theme
                                                              .backgroundColor,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          5.0),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          5.0))),
                                                      height:
                                                          screenHeight * 0.200,
                                                      width:
                                                          screenWidth * 0.405,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                        child: FadeInImage
                                                            .assetNetwork(
                                                                alignment: Alignment
                                                                    .topCenter, // add this
                                                                placeholder:
                                                                    'dummy image',
                                                                image:
                                                                    'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                                                fit:
                                                                    BoxFit.fill,
                                                                height:
                                                                    screenHeight *
                                                                        0.180,
                                                                width:
                                                                    screenWidth *
                                                                        0.405),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 1.0,
                                                                  right: 1.0),
                                                          child: Text(
                                                              "MoonBirds",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 14 *
                                                                      textScale,
                                                                  color: Colors
                                                                      .black)),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 80.0,
                                                                  right: 3.0),
                                                          child: Text(
                                                            "",
                                                            style: TextStyle(
                                                              // color: backgroundColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 0.0,
                                                                  right: 3.0),
                                                          child: Text("Price",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 12 *
                                                                      textScale,
                                                                  color: Colors
                                                                      .black38)),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 100.0,
                                                                  right: 3.0),
                                                          child: Text("2",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 12 *
                                                                      textScale,
                                                                  color: Colors
                                                                      .black38)),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 0.0,
                                                                  right: 3.0),
                                                          child: Text(
                                                              "Quantity",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 12 *
                                                                      textScale,
                                                                  color: Colors
                                                                      .black38)),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 80.0,
                                                                  right: 3.0),
                                                          child: Text("2",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 12 *
                                                                      textScale,
                                                                  color: Colors
                                                                      .black38)),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),

                                            //color: Colors.grey,
                                          ));
                                    },
                                  ),
                                ))
                          ])))),
            ],
          )

          // }

          // )
          ),
    );
  }
}
