import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import '../../data/models/asset.dart';
import '../../data/models/coin.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'actor_scroller.dart';
import 'movie_detail_header.dart';
import 'photo_scroller.dart';
import 'story_line.dart';
import 'package:share/share.dart';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
// import 'package:video_viewer/video_viewer.dart';
import 'arc_banner_image.dart';

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

class ProfileArcBannerImage extends StatelessWidget {
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
            clipper: ArcClipper(),
            child: Container(
                height: screenHeight * 0.150,
                width: screenWidth * 9.0,
                child: Image.network(
                  "https://via.placeholder.com/400x300.png",
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

class ProfileDetailHeader extends StatelessWidget {
  final String _content =
      " Vixrgo is a sapphire rarity tier hoiscope of 12 hprpsope nfts collection that will be released for the upcoming amazing pandaverse ";

  void _shareContent() {
    Share.share(_content);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    var textTheme = Theme.of(context).textTheme;

    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'lorem ipsum dolor',
          // movie.title,
          // style: textTheme.title,
        ),
        SizedBox(height: screenHeight * 8.0),
        // movie
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
              // movie.bannerUrl
              ProfileArcBannerImage(),
        ),
        Positioned(
            bottom: 0.0,
            left: 16.0,
            right: 16.0,
            child: Container(
                color: theme.backgroundColor,
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Poster(
                        // movie.posterUrl,
                        height: screenHeight * 0.18,
                      ),
                      SizedBox(width: screenWidth * 0.16),
                      Expanded(child: movieInformation),
                      SizedBox(width: screenWidth * 0.16),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Container(
                        color: theme.backgroundColor,
                        height: screenHeight * 0.10,
                        width: screenWidth * 0.880,
                        child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // movie

                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Text(
                                      " Profile"
                                      // storyline "
                                      ,
                                      // style: textTheme.body1.copyWith(
                                      //   color: Colors.black45,
                                      //   fontSize: 12.0,
                                      // ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Text(
                                      " Vigrgo is a sapphire rarity tier hoiscope of 12 hprpsope nfts collection that will be released for the upcoming amazing pandaverse "
                                      // storyline "
                                      ,
                                      // style: textTheme.body1.copyWith(
                                      //   color: Colors.black45,
                                      //   fontSize: 12.0,
                                      // ),
                                    ),
                                  ),
                                ),
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

class Profile extends StatefulWidget {
  String? token;
  String? accounttype;
  Profile({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  ProfileState createState() =>
      ProfileState(token: this.token, accounttype: this.accounttype);
}

class ProfileState extends State<Profile> {
  String? token;
  String? accounttype;
  ProfileState({this.token, this.accounttype});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: ProfileMobile(token: token, accounttype: accounttype),
          tablet: ProfileTablet(),
        ),
      ),
    );
  }
}

class ProfileTablet extends StatefulWidget {
  @override
  ProfileTabletState createState() => new ProfileTabletState();

  ProfileTablet();
}

class ProfileTabletState extends State<ProfileTablet> {
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

// class ProfileMobile extends StatelessWidget {

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
        color: theme.scaffoldBackgroundColor,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Container(
                      color: theme.backgroundColor,
                      height: screenHeight * 0.45,
                      width: screenWidth * 0.880,
                      child: ProfileDetailHeader(),
                    ))),
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Container(
                      color: theme.backgroundColor,
                      height: screenHeight * 0.75,
                      width: screenWidth * 0.880,
                      child: DefaultTabController(
                        length: 2,
                        child: Container(
                          color: theme.backgroundColor,
                          child: Column(
                            children: <Widget>[
                              Container(
                                color: theme.backgroundColor,
                                constraints:
                                    const BoxConstraints.expand(height: 50),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: TabBar(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    indicatorColor: Colors.white,
                                    labelColor: Colors.black,
                                    unselectedLabelColor: Colors.black54,
                                    isScrollable: true,
                                    tabs: <Widget>[
                                      Tab(
                                          child: Text('All items',
                                              style: TextStyle(
                                                  fontSize: 14 * textScale))),
                                      Tab(
                                          child: Text("All Activity",
                                              style: TextStyle(
                                                  fontSize: 14 * textScale))),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: theme.backgroundColor,
                                  child: TabBarView(children: [
                                    GridView.count(
                                      mainAxisSpacing: 2,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 2,
                                      children: List.generate(50, (index) {
                                        return Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Container(
                                                height: 153.0,
                                                width: 160.0,
                                                // color: Colors.grey,

                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height:
                                                          screenHeight * 0.130,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return Profile();
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
                                                          height: 100,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 10.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "lorem ipsum",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 10.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "lorem ipsum",
                                                            style: TextStyle(
                                                              // color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 70.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "2",
                                                            style: TextStyle(
                                                              // color: primaryColor,
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
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 10.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "lorem ipsum",
                                                            style: TextStyle(
                                                              // color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 70.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "2",
                                                            style: TextStyle(
                                                              // color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )));
                                      }),
                                    ),
                                    GridView.count(
                                      mainAxisSpacing: 1,
                                      crossAxisSpacing: 1,
                                      crossAxisCount: 2,
                                      children: List.generate(50, (index) {
                                        return Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Container(
                                                height: 153.0,
                                                width: 160.0,
                                                // color: Colors.grey,

                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height:
                                                          screenHeight * 0.130,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return Profile();
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
                                                          height: 100,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 10.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "lorem ipsum",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 10.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "lorem ipsum",
                                                            style: TextStyle(
                                                              // color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 70.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "2",
                                                            style: TextStyle(
                                                              // color: primaryColor,
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
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 10.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "lorem ipsum",
                                                            style: TextStyle(
                                                              // color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 70.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "2",
                                                            style: TextStyle(
                                                              // color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )));
                                      }),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}

class ProfileMobile extends StatefulWidget {
  String? token;
  String? accounttype;

  ProfileMobile({Key? key, this.token, this.accounttype}) : super(key: key);

  @override
  ProfileState createState() =>
      ProfileState(token: this.token, accounttype: this.accounttype);
}

class ProfileMobileState extends State<ProfileMobile> {
  String? token;
  String? tokenlabel = 'Coin';

  String? accounttype;
  ProfileMobileState({this.token, this.accounttype});

  late List<Coin> nfts;

  void initState() {
    super.initState();

    late List<Coin> nftdata = [];
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

// class ProfileMobile extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    final sample = List.generate(30, (index) => index);
    // Movie movie;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Container(
        color: theme.scaffoldBackgroundColor,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Container(
                      color: theme.backgroundColor,
                      height: screenHeight * 0.45,
                      width: screenWidth * 0.880,
                      child: ProfileDetailHeader(),
                    ))),
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Container(
                      color: theme.backgroundColor,
                      height: screenHeight * 0.75,
                      width: screenWidth * 0.880,
                      child:
                          // BlocConsumer<TransactionBloc, TransactionState>(
                          //   listener: (context, state) {
                          // TODO: implement listener
                          //                   if (state is _SuccessTransactionState) {
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
                          DefaultTabController(
                        length: 2,
                        child: Container(
                          color: theme.backgroundColor,
                          child: Column(
                            children: <Widget>[
                              Container(
                                color: theme.backgroundColor,
                                constraints:
                                    const BoxConstraints.expand(height: 50),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: TabBar(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    indicatorColor: Colors.white,
                                    labelColor: Colors.black,
                                    unselectedLabelColor: Colors.black54,
                                    isScrollable: true,
                                    tabs: <Widget>[
                                      Tab(
                                          child: Text('All items',
                                              style: TextStyle(
                                                  fontSize: 14 * textScale))),
                                      Tab(
                                          child: Text("All Activity",
                                              style: TextStyle(
                                                  fontSize: 14 * textScale))),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: theme.backgroundColor,
                                  child: TabBarView(children: [
                                    GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 1.0,
                                        crossAxisSpacing: 1.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      physics: BouncingScrollPhysics(
                                          parent:
                                              AlwaysScrollableScrollPhysics()),
                                      scrollDirection: Axis.vertical,
                                      itemCount: sample.length,
                                      padding: EdgeInsets.all(1.0),
                                      itemBuilder: (context, index) {
                                        var nft = nfts[index];

                                        return Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Container(
                                                height: 153.0,
                                                width: 160.0,
                                                // color: Colors.grey,

                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height:
                                                          screenHeight * 0.130,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return Profile();
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
                                                          height: 100,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 10.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            '${sample[index]}',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 10.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "lorem ipsum",
                                                            style: TextStyle(
                                                              // color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 70.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "2",
                                                            style: TextStyle(
                                                              // color: primaryColor,
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
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 10.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "lorem ipsum",
                                                            style: TextStyle(
                                                              // color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 70.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "2",
                                                            style: TextStyle(
                                                              // color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )));
                                      },
                                    ),
                                    GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 1.0,
                                        crossAxisSpacing: 1.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      physics: const BouncingScrollPhysics(
                                          parent:
                                              AlwaysScrollableScrollPhysics()),
                                      scrollDirection: Axis.vertical,
                                      itemCount: 8,
                                      padding: EdgeInsets.all(1.0),
                                      itemBuilder: (context, index) {
                                        var nft = nfts[index];

                                        return Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Container(
                                                height: 153.0,
                                                width: 160.0,
                                                // color: Colors.grey,

                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height:
                                                          screenHeight * 0.130,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return Profile();
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
                                                          height: 100,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 10.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "lorem",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                                                  left: 10.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            '${sample[index]}',
                                                            style: TextStyle(
                                                              // color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 70.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "2",
                                                            style: TextStyle(
                                                              // color: primaryColor,
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
                                                      children: const [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 10.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "lorem ipsum",
                                                            style: TextStyle(
                                                              // color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.0,
                                                                  bottom: 1.0,
                                                                  left: 70.0,
                                                                  right: 0.0),
                                                          child: Text(
                                                            "2",
                                                            style: TextStyle(
                                                              // color: primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )));
                                      },
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // );
                        // },
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
