import 'nft_details_page.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import '../../data/models/asset.dart';
import '../../data/models/coin.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'actor_scroller.dart';

import 'nft_detail_header.dart';
import 'photo_scroller.dart';
import 'story_line.dart';
import 'package:share/share.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
// import 'package:video_viewer/video_viewer.dart';

import 'poster.dart';
import 'rating_information.dart';
import 'package:share/share.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:amplify_auth_cognito_example/chewie_list_item.dart';
// import 'package:video_player/video_player.dart';
// import 'package:better_player/better_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:device_preview/device_preview.dart';

class CollectionArcBannerImage extends StatelessWidget {
  // late BetterPlayerController _betterPlayerController;

  @override
  Widget build(BuildContext context) {
    // color: theme.scaffoldBackgroundColor,
    final theme = Theme.of(context);

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    // return AspectRatio(
    //   aspectRatio: 16 / 9,
    //   child: Text('player'),
    //   // BetterPlayer(
    //   //   controller: _betterPlayerController,
    //   // ),
    // );
    return Container(
        // color: theme.scaffoldBackgroundColor,
        child: ClipPath(
            child: Container(
                height: screenHeight * 0.370,
                width: screenWidth * 9.0,
                child: Image.network(
                  "https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg",
                  height: screenHeight * 0.10,
                  fit: BoxFit.cover,

                  //   // Image.asset(
                  //     // imageUrl,

                  //     // width: screenWidth,
                  //     // height: 230.0,
                  //     // fit: BoxFit.cover,
                  //   // ),
                ))));
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CollectionDetailHeader extends StatelessWidget {
  final String _content =
      " Virgo is a sapphire rarity tier hoiscope of 12 hprpsope nfts Collection that will be released for the upcoming amazing pandaverse ";

  void _shareContent() {
    Share.share(_content);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    var textTheme = Theme.of(context).textTheme;

    var nftInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'lorem ipsum dolor',
          // nft.title,
          // style: textTheme.title,
        ),
        SizedBox(height: screenHeight * 8.0),
        // nft
        // FlatButton
        //  .icon(
        //         onPressed: _shareContent,
        //         icon: Icon(Icons.share),
        //         label: Text('')
        //         ),
        //  RatingInformation(),
        SizedBox(height: screenHeight * 0.12),
        // Row(children: _buildCategoryChips(textTheme)),
      ],
    );

    return Container(
        child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child:
              // nft.bannerUrl
              CollectionArcBannerImage(),
        ),
        Positioned(
            top: 130,
            bottom: 0.0,
            left: 16.0,
            right: 16.0,
            child: Container(
                child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Poster(
                    // nft.posterUrl,
                    height: screenHeight * 0.25,
                  ),
                  SizedBox(width: screenWidth * 0.36),
                  Expanded(child: RatingInformation()),
                  SizedBox(width: screenWidth * 0.16),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  child: Container(
                    // height: screenHeight * 0.10,
                    width: screenWidth * 0.880,
                    child: Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // nft
                          ],
                        )),
                  ))
            ]))),
      ],
    ));
  }
}

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

class Collection extends StatefulWidget {
  String? token;
  String? accounttype;
  Collection({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  CollectionState createState() =>
      CollectionState(token: this.token, accounttype: this.accounttype);
}

class CollectionState extends State<Collection> {
  String? token;
  String? accounttype;
  CollectionState({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: CollectionMobile(token: token, accounttype: accounttype),
          tablet: CollectionTablet(),
        ),
      ),
    );
  }
}

class CollectionTablet extends StatefulWidget {
  @override
  CollectionTabletState createState() => new CollectionTabletState();

  CollectionTablet();
}

class CollectionTabletState extends State<CollectionTablet> {
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

// class CollectionMobile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    // Nft nft;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Container(),
    );
  }
}

class CollectionMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  CollectionMobile({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  _CollectionMobileState createState() =>
      _CollectionMobileState(token: this.token, accounttype: this.accounttype);
}

class _CollectionMobileState extends State<CollectionMobile> {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  _CollectionMobileState({this.token, this.accounttype});

  late List<Coin> nfts;

  late List<Coin> nftdata = [];
  void initState() {
    super.initState();

    nfts = nftdata;
    // init();

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

// class CollectionMobile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    // Nft nft;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: Column(children: [
              Container(
                color: theme.backgroundColor,
                height: screenHeight * 0.32,
                width: screenWidth * 0.960,
                child: CollectionDetailHeader(),
              ),
              ExpandablePanel(
                header: Container(
                    width: screenWidth * 0.700,

                    // color: theme.backgroundColor,
                    child: Column(children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 50, left: 15, bottom: 0),
                                child: Text(
                                  'Moon Bird *',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600),
                                )),
                            Expanded(child: Container()),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 30, left: 10, bottom: 0),
                                child: Row(
                                  children: [
                                    IconButton(
                                        iconSize: 20,
                                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                        icon:
                                            FaIcon(FontAwesomeIcons.instagram),
                                        onPressed: () {
                                          print("Pressed");
                                        }),
                                    IconButton(
                                        iconSize: 20,
                                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                        icon: FaIcon(FontAwesomeIcons.twitter),
                                        onPressed: () {
                                          print("Pressed");
                                        }),
                                    IconButton(
                                        iconSize: 20,
                                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                        icon: FaIcon(FontAwesomeIcons.globe),
                                        onPressed: () {
                                          print("Pressed");
                                        })
                                  ],
                                )),
                          ]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 15, left: 15, bottom: 0),
                                child: Text(
                                  'Items',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w400),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 15, left: 15, bottom: 0),
                                child: Text(
                                  '10k',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 15, left: 15, bottom: 0),
                                child: Text(
                                  'Owners',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w400),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 15, left: 15, bottom: 0),
                                child: Text(
                                  '2.4k',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 15, left: 15, bottom: 0),
                                child: Text(
                                  'Last sale',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w400),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 15, left: 15, bottom: 0),
                                child: Text(
                                  '0.243',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
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
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        " Virgo is a sapphire rarity tier hoiscope of 12 hprpsope nfts Collection....",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13 * textScale,
                                            color: Colors.black38)
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
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        " Virgo is a sapphire rarity tier hoiscope of 12 hprpsope nfts Collection that will be released for the upcoming amazing pandaverse ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14 * textScale,
                                            color: Colors.black38)
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
                height: screenHeight * 0.99,
                width: screenWidth * 0.960,
                child: DefaultTabController(
                  length: 2,
                  child: Container(
                     height: screenHeight * 0.99,
                    color: theme.backgroundColor,
                    child: Column(
                      children: <Widget>[
                        Container(
                           height: screenHeight * 1.99,
                          color: theme.backgroundColor,
                          constraints: const BoxConstraints.expand(height: 50),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TabBar(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              indicatorColor: Colors.white,
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.black54,
                              isScrollable: true,
                              tabs: <Widget>[
                                Tab(
                                    child: Text('All items',
                                        style: TextStyle(
                                            fontSize: 12 * textScale,
                                            fontWeight: FontWeight.w500))),
                                Tab(
                                    child: Text("All Activity",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12 * textScale))),
                              ],
                            ),
                          ),
                        ),
                        Container(
 height: screenHeight * 1.99,                            color: theme.backgroundColor,
                            child:
                                // BlocConsumer<TransactionBloc, TransactionState>(
                                //   listener: (context, state) {
                                //     // TODO: implement listener
                                //   },
                                //   builder: (context, state) {
                                //     return
                                TabBarView(children: [
                              GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 1,
                                          crossAxisSpacing: 2,
                                          mainAxisSpacing: 2),
                                  itemCount: 8,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Container(
                                            height: 10.0,
                                            width: 160.0,
                                            // color: Colors.grey,

                                            child: Column(
                                              children: [
                                                Container(
                                                  height: screenHeight * 0.150,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                        return NftDetailsPage();
                                                      }));
                                                    },
                                                    child: FadeInImage
                                                        .assetNetwork(
                                                      alignment: Alignment
                                                          .topCenter, // add this
                                                      placeholder:
                                                          'dummy image',
                                                      image:
                                                          'https://via.placeholder.com/500x300.png',
                                                      fit: BoxFit.fitWidth,
                                                      width: screenWidth * 0.9,
                                                      height:
                                                          screenHeight * 2.5,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.0,
                                                          bottom: 1.0,
                                                          left: 10.0,
                                                          right: 0.0),
                                                      child: Text(
                                                        "lorem ipsum",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.0,
                                                          bottom: 1.0,
                                                          left: 10.0,
                                                          right: 0.0),
                                                      child: Text(
                                                        "lorem ipsum",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.0,
                                                          bottom: 1.0,
                                                          left: 70.0,
                                                          right: 0.0),
                                                      child: Text(
                                                        "2",
                                                        style: TextStyle(
                                                         color: Colors.black38,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.0,
                                                          bottom: 1.0,
                                                          left: 10.0,
                                                          right: 0.0),
                                                      child: Text(
                                                        "lorem ipsum",
                                                        style: TextStyle(
  color: Colors.black38,                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.0,
                                                          bottom: 1.0,
                                                          left: 70.0,
                                                          right: 0.0),
                                                      child: Text(
                                                        "2",
                                                        style: TextStyle(
  color: Colors.black38,                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )));
                                  }),
                          
                          
                              GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 1,
                                          crossAxisSpacing: 2,
                                          mainAxisSpacing: 2),
                                  itemCount: 8,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Container(
                                            height: 10.0,
                                            width: 160.0,
                                            // color: Colors.grey,

                                            child: Column(
                                              children: [
                                                Container(
                                                  height: screenHeight * 0.150,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                        return NftDetailsPage();
                                                      }));
                                                    },
                                                    child: FadeInImage
                                                        .assetNetwork(
                                                      alignment: Alignment
                                                          .topCenter, // add this
                                                      placeholder:
                                                          'dummy image',
                                                      image:
                                                          'https://via.placeholder.com/500x300.png',
                                                      fit: BoxFit.fitWidth,
                                                      width: screenWidth * 0.9,
                                                      height:
                                                          screenHeight * 2.5,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.0,
                                                          bottom: 1.0,
                                                          left: 10.0,
                                                          right: 0.0),
                                                      child: Text(
                                                        "lorem ipsum",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.0,
                                                          bottom: 1.0,
                                                          left: 10.0,
                                                          right: 0.0),
                                                      child: Text(
                                                        "lorem ipsum",
                                                        style: TextStyle(
                                                          color: Colors.black38,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.0,
                                                          bottom: 1.0,
                                                          left: 70.0,
                                                          right: 0.0),
                                                      child: Text(
                                                        "2",
                                                        style: TextStyle(
                                                         color: Colors.black38,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: const [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.0,
                                                          bottom: 1.0,
                                                          left: 10.0,
                                                          right: 0.0),
                                                      child: Text(
                                                        "lorem ipsum",
                                                        style: TextStyle(
  color: Colors.black38,                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 1.0,
                                                          bottom: 1.0,
                                                          left: 70.0,
                                                          right: 0.0),
                                                      child: Text(
                                                        "2",
                                                        style: TextStyle(
  color: Colors.black38,                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )));
                                  }),
                          
                          
                          
                          
                            ])
                            //   },
                            // ),
                            ),
                      ],
                    ),
                  ),
                ),
              )
            ])),
          ],
        ),
      ),
    );
  }
}
