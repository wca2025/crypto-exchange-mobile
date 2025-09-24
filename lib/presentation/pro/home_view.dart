import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/category/category_bloc.dart';
import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import 'coustom_bottom_nav_bar.dart';
import 'homepage.dart';
import 'profile.dart';
import 'sign_in.dart';
import 'collection.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'travel_bean.dart';

import 'sign_up.dart';
// import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'nft_details_page.dart';
import '../widgets/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'dart:math' as math;
// import 'package:flutter_responsive/flutter_responsive.dart';
import 'package:flutter/material.dart';

import 'package:universal_platform/universal_platform.dart';

class _HomeScreenMobile extends StatefulWidget {
  @override
  __HomeScreenMobileState createState() => __HomeScreenMobileState();

  _HomeScreenMobile();
}

class __HomeScreenMobileState extends State<_HomeScreenMobile> {
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  Widget buildCategoryList() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Container(
        child:
            //    BlocConsumer<CategoryBloc, CategoryState>(
            // listener: (context, state) {
            //   // TODO: implement listener
            // },
            // builder: (context, state) {

            // return
            Padding(
                padding: EdgeInsets.all(4),
                child: Container(
                  height: screenHeight * 0.040,
                  // padding: const EdgeInsets.all(1),

                  // child: Text('lorem'),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) {
                          return NftDetailsPage();
                        }));
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: theme.backgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0))),
                            height: screenHeight * 0.150,
                            width: screenWidth * 0.380,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: FadeInImage.assetNetwork(
                                  alignment: Alignment.topCenter, // add this
                                  placeholder: 'dummy image',
                                  image:
                                      'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                  fit: BoxFit.fill,
                                  height: screenHeight * 0.150,
                                  width: screenWidth * 0.400),
                            ),
                          ),
                        ],
                      )),

                  //color: Colors.grey,
                ))
        // ;

        //   },
        // )
        );
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
          automaticallyImplyLeading: false,

          title: Text(
            'Nfts  ',
            style: TextStyle(color: Colors.black),
          ),
  
          elevation: 0.2,
          bottomOpacity: 1.0,
          shadowColor: theme.scaffoldBackgroundColor,
          backgroundColor: theme.scaffoldBackgroundColor,
        ),
        body:
            // BlocConsumer<TransactionBloc, TransactionState>(
            //   listener: (context, state) {
            // TODO: implement listener
            //     if (state is SuccessTransactionState) {
            //   ScaffoldMessenger.of(context).showSnackBar((
            //     const SnackBar(
            //       duration: Duration(seconds: 2),
            //       content: Text(' succeess ', textScaleFactor: 1.5),
            //     ),
            //   );
            // }         else if (state is ErrorTransactionState) {

            // ScaffoldMessenger.of(context).showSnackBar((
            //   const SnackBar(
            //     duration: Duration(seconds: 2),
            //     content: Text(' error ', textScaleFactor: 1.5),
            //   ),
            // );
            // }
            // },
            // builder: (context, state) {
            //              if (state is _InitialNftState) {
            //           context.read<TransactionBloc>().add(const FetchTodos());
            //          context.read<TransactionBloc>().add(const   _FetchLiveNfts());
            // context.read<TransactionBloc>().add(const _FetchLiveUpcomimgAuctions());
            // context.read<TransactionBloc>().add(const _FetchLiveUpcomingDrops());
            // context.read<TransactionBloc>().add(const _FetchTopCollectors())
            // context.read<TransactionBloc>().add(const _FetchFeaturedCreations())
            // context.read<TransactionBloc>().add(const _FetchFeaturedCreators())
            // context.read<TransactionBloc>().add(const _FetchRecentSales())
            // context.read<TransactionBloc>().add(const _FetchRecentCreations())
            //         }

            //         if  (state is _ErrorTransactionState){

            //              return  Container(
            //             color: theme.backgroundColor,
            //             child:
            //             Column(
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
            //             )
            //             );

            // }
            // if (state is _DisplayNftsState) {
            //   return
            Container(
          height: screenHeight * 1.0,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.325,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount: state.nft.length,
                    padding: const EdgeInsets.all(5.0),
                    itemBuilder: (context, index) {
                      var bean = _list[index];
                      return Padding(
                        padding: EdgeInsets.all(4),
                        child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: theme.backgroundColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0))),
                              height: screenHeight * 0.200,
                              width: screenWidth * 0.800,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: FadeInImage.assetNetwork(
                                  alignment: Alignment.topCenter, // add this
                                  placeholder: 'dummy image',
                                  image:
                                      'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                  fit: BoxFit.fill,
                                  height: screenHeight * 0.300,
                                ),
                              ),
                            )),
                      );
                    },
                  ),
                ),
              ),
              SliverStickyHeader(
                header: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.030,
                  width: screenWidth * 0.070,
                  // color: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: const [
                        Text(
                          'Category',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                      ],
                    ),
                  ),
                ),
              ),
              //       SliverToBoxAdapter(
              //         child: Container(
              //             color: theme.backgroundColor,
              //             height: screenHeight * 0.180,
              //             child: ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   itemCount: state.category.length,
              //   padding: const EdgeInsets.all(5.0),
              //   itemBuilder: buildCategoryList
              // )
              // )
              // ,),
              SliverStickyHeader(
                header: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.030,
                  width: screenWidth * 0.070,
                  // color: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Collection();
                      }));
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Live and Upcoming Auctions',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount: state.liveupcomimgauctionsnft.length,
                    padding: const EdgeInsets.all(5.0),
                    itemBuilder: (context, index) {
                      var bean = _list[index];
                      return Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            height: screenHeight * 0.180,
                            // padding: const EdgeInsets.all(1),

                            // child: Text('lorem'),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return NftDetailsPage();
                                  }));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: theme.backgroundColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5.0),
                                              bottomLeft:
                                                  Radius.circular(5.0))),
                                      height: screenHeight * 0.200,
                                      width: screenWidth * 0.405,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: FadeInImage.assetNetwork(
                                            alignment:
                                                Alignment.topCenter, // add this
                                            placeholder: 'dummy image',
                                            image:
                                                'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                            fit: BoxFit.fill,
                                            height: screenHeight * 0.180,
                                            width: screenWidth * 0.405),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 2.0,
                                              right: 1.0),
                                          child: Text("MoonBirds",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14 * textScale,
                                                  color: Colors.black)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              // color: primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Price",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 100.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Quantity",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
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
              ),
              SliverStickyHeader(
                header: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.030,
                  width: screenWidth * 0.070,
                  // color: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Profile();
                      }));
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Live and Upcoming Drops',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount: state.fetchliveupcomingdropsnft.length,
                    padding: const EdgeInsets.all(5.0),
                    itemBuilder: (context, index) {
                      var bean = _list[index];
                      return Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            height: screenHeight * 0.180,
                            // padding: const EdgeInsets.all(1),

                            // child: Text('lorem'),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return NftDetailsPage();
                                  }));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: theme.backgroundColor,
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(5.0),
                                              bottomLeft:
                                                  Radius.circular(5.0))),
                                      height: screenHeight * 0.200,
                                      width: screenWidth * 0.405,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: FadeInImage.assetNetwork(
                                            alignment:
                                                Alignment.topCenter, // add this
                                            placeholder: 'dummy image',
                                            image:
                                                'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                            fit: BoxFit.fill,
                                            height: screenHeight * 0.180,
                                            width: screenWidth * 0.405),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 2.0,
                                              right: 1.0),
                                          child: Text("MoonBirds",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14 * textScale,
                                                  color: Colors.black)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              // color: primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Price",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 100.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Quantity",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
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
              ),
              SliverStickyHeader(
                header: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.030,
                  width: screenWidth * 0.070,
                  // color: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Collection();
                      }));
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Top Collectors',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount: state.fetchliveupcomingdropsnft.length,
                    padding: const EdgeInsets.all(5.0),
                    itemBuilder: (context, index) {
                      var bean = _list[index];
                      return Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            height: screenHeight * 0.180,
                            // padding: const EdgeInsets.all(1),

                            // child: Text('lorem'),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return NftDetailsPage();
                                  }));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: theme.backgroundColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5.0),
                                              bottomLeft:
                                                  Radius.circular(5.0))),
                                      height: screenHeight * 0.200,
                                      width: screenWidth * 0.405,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: FadeInImage.assetNetwork(
                                            alignment:
                                                Alignment.topCenter, // add this
                                            placeholder: 'dummy image',
                                            image:
                                                'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                            fit: BoxFit.fill,
                                            height: screenHeight * 0.180,
                                            width: screenWidth * 0.405),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 2.0,
                                              right: 1.0),
                                          child: Text("MoonBirds",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14 * textScale,
                                                  color: Colors.black)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              // color: primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Price",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 100.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Quantity",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
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
              ),
              SliverStickyHeader(
                header: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.030,
                  width: screenWidth * 0.070,
                  // color: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Collection();
                      }));
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Featured Creations',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount: state.featuredcreationsnft.length,
                    padding: const EdgeInsets.all(5.0),
                    itemBuilder: (context, index) {
                      var bean = _list[index];
                      return Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            height: screenHeight * 0.180,
                            // padding: const EdgeInsets.all(1),

                            // child: Text('lorem'),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return NftDetailsPage();
                                  }));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: theme.backgroundColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5.0),
                                              bottomLeft:
                                                  Radius.circular(5.0))),
                                      height: screenHeight * 0.200,
                                      width: screenWidth * 0.405,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: FadeInImage.assetNetwork(
                                            alignment:
                                                Alignment.topCenter, // add this
                                            placeholder: 'dummy image',
                                            image:
                                                'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                            fit: BoxFit.fill,
                                            height: screenHeight * 0.180,
                                            width: screenWidth * 0.405),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 2.0,
                                              right: 1.0),
                                          child: Text("MoonBirds",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14 * textScale,
                                                  color: Colors.black)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              // color: primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Price",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 100.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Quantity",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
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
              ),
              SliverStickyHeader(
                header: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.030,
                  width: screenWidth * 0.070,
                  // color: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Collection();
                      }));
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Featured Creations',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount: state.featuredcreationsnft.length,
                    padding: const EdgeInsets.all(5.0),
                    itemBuilder: (context, index) {
                      var bean = _list[index];
                      return Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            height: screenHeight * 0.180,
                            // padding: const EdgeInsets.all(1),

                            // child: Text('lorem'),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return NftDetailsPage();
                                  }));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: theme.backgroundColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5.0),
                                              bottomLeft:
                                                  Radius.circular(5.0))),
                                      height: screenHeight * 0.200,
                                      width: screenWidth * 0.405,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: FadeInImage.assetNetwork(
                                            alignment:
                                                Alignment.topCenter, // add this
                                            placeholder: 'dummy image',
                                            image:
                                                'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                            fit: BoxFit.fill,
                                            height: screenHeight * 0.180,
                                            width: screenWidth * 0.405),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 2.0,
                                              right: 1.0),
                                          child: Text("MoonBirds",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14 * textScale,
                                                  color: Colors.black)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              // color: primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Price",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 100.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Quantity",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
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
              ),
              SliverStickyHeader(
                header: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.030,
                  width: screenWidth * 0.070,
                  // color: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Collection();
                      }));
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Recent Sales',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    padding: const EdgeInsets.all(5.0),
                    itemBuilder: (context, index) {
                      var bean = _list[index];
                      return Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            height: screenHeight * 0.180,
                            // padding: const EdgeInsets.all(1),

                            // child: Text('lorem'),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return NftDetailsPage();
                                  }));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: theme.backgroundColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5.0),
                                              bottomLeft:
                                                  Radius.circular(5.0))),
                                      height: screenHeight * 0.200,
                                      width: screenWidth * 0.405,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: FadeInImage.assetNetwork(
                                            alignment:
                                                Alignment.topCenter, // add this
                                            placeholder: 'dummy image',
                                            image:
                                                'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                            fit: BoxFit.fill,
                                            height: screenHeight * 0.180,
                                            width: screenWidth * 0.405),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 2.0,
                                              right: 1.0),
                                          child: Text("MoonBirds",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14 * textScale,
                                                  color: Colors.black)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              // color: primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Price",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 100.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Quantity",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
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
              ),
              SliverStickyHeader(
                header: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.030,
                  width: screenWidth * 0.070,
                  // color: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (context) {
                        return Collection();
                      }));
                    },
                    child: Row(
                      children: const [
                        Text(
                          'Recent Creations',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: theme.backgroundColor,
                  height: screenHeight * 0.300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount: state.recentcreationsnft.length,
                    padding: const EdgeInsets.all(5.0),
                    itemBuilder: (context, index) {
                      var bean = _list[index];
                      return Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            height: screenHeight * 0.180,
                            // padding: const EdgeInsets.all(1),

                            // child: Text('lorem'),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return NftDetailsPage();
                                  }));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: theme.backgroundColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5.0),
                                              bottomLeft:
                                                  Radius.circular(5.0))),
                                      height: screenHeight * 0.200,
                                      width: screenWidth * 0.405,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: FadeInImage.assetNetwork(
                                            alignment:
                                                Alignment.topCenter, // add this
                                            placeholder: 'dummy image',
                                            image:
                                                'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                            fit: BoxFit.fill,
                                            height: screenHeight * 0.180,
                                            width: screenWidth * 0.405),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 2.0,
                                              right: 1.0),
                                          child: Text("MoonBirds",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14 * textScale,
                                                  color: Colors.black)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              // color: primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Price",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 100.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 0.0,
                                              right: 3.0),
                                          child: Text("Quantity",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 80.0,
                                              right: 3.0),
                                          child: Text("2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12 * textScale,
                                                  color: Colors.black38)),
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
              ),
            ],
          ),
        )
        // }

        );
  }
}

class _HomeScreenTablet extends StatefulWidget {
  @override
  __HomeScreenTabletState createState() => __HomeScreenTabletState();
}

class __HomeScreenTabletState extends State<_HomeScreenTablet> {
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: theme.backgroundColor,

      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text(
          'Nfts  ',
          style: TextStyle(color: Colors.black),
        ),
        // actions: [Icon(Icons.search_outlined),],
        elevation: 0.2,
        bottomOpacity: 1.0,
        shadowColor: theme.scaffoldBackgroundColor,
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar(
          //   automaticallyImplyLeading: false,
          //   backgroundColor: Colors.grey,
          //   //pinned: true,
          //   floating: false,
          //   expandedHeight: screenHeight * 0.050,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text('Nfts'),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     // color: Colors.grey,
          //     height: screenHeight * 0.050,
          //     child: Row(children: [],),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.325,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  var bean = _list[index];
                  return Padding(
                    padding: EdgeInsets.all(4),
                    child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: theme.backgroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0))),
                          height: screenHeight * 0.200,
                          width: screenWidth * 0.800,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: FadeInImage.assetNetwork(
                              alignment: Alignment.topCenter, // add this
                              placeholder: 'dummy image',
                              image:
                                  'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                              fit: BoxFit.fill,
                              height: screenHeight * 0.300,
                            ),
                          ),
                        )),
                  );
                },
              ),
            ),
          ),

          SliverStickyHeader(
            header: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.030,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: const [
                    Text(
                      'Category',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  var bean = _list[index];
                  return Padding(
                      padding: EdgeInsets.all(4),
                      child: Container(
                        height: screenHeight * 0.040,
                        // padding: const EdgeInsets.all(1),

                        // child: Text('lorem'),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                return NftDetailsPage();
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: theme.backgroundColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.0),
                                          bottomLeft: Radius.circular(5.0))),
                                  height: screenHeight * 0.150,
                                  width: screenWidth * 0.380,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: FadeInImage.assetNetwork(
                                        alignment:
                                            Alignment.topCenter, // add this
                                        placeholder: 'dummy image',
                                        image:
                                            'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                        fit: BoxFit.fill,
                                        height: screenHeight * 0.150,
                                        width: screenWidth * 0.400),
                                  ),
                                ),
                              ],
                            )),

                        //color: Colors.grey,
                      ));
                },
              ),
            ),
          ),

          SliverStickyHeader(
            header: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.030,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Live and Upcoming Auctions',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // itemCount: state.liveupcomingauctionsnft.length,
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  var bean = _list[index];
                  return Padding(
                      padding: EdgeInsets.all(4),
                      child: Container(
                        height: screenHeight * 0.180,
                        // padding: const EdgeInsets.all(1),

                        // child: Text('lorem'),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                return NftDetailsPage();
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: theme.backgroundColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.0),
                                          bottomLeft: Radius.circular(5.0))),
                                  height: screenHeight * 0.200,
                                  width: screenWidth * 0.405,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: FadeInImage.assetNetwork(
                                        alignment:
                                            Alignment.topCenter, // add this
                                        placeholder: 'dummy image',
                                        image:
                                            'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                        fit: BoxFit.fill,
                                        height: screenHeight * 0.180,
                                        width: screenWidth * 0.405),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 2.0,
                                          right: 1.0),
                                      child: Text("MoonBirds",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14 * textScale,
                                              color: Colors.black)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          // color: primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 100.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Quantity",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
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
          ),

          SliverStickyHeader(
            header: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.030,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Live and Upcoming Drops',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // itemCount: state.liveupcomingdropsnft.length,
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  var bean = _list[index];
                  return Padding(
                      padding: EdgeInsets.all(4),
                      child: Container(
                        height: screenHeight * 0.180,
                        // padding: const EdgeInsets.all(1),

                        // child: Text('lorem'),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                return NftDetailsPage();
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: theme.backgroundColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.0),
                                          bottomLeft: Radius.circular(5.0))),
                                  height: screenHeight * 0.200,
                                  width: screenWidth * 0.405,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: FadeInImage.assetNetwork(
                                        alignment:
                                            Alignment.topCenter, // add this
                                        placeholder: 'dummy image',
                                        image:
                                            'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                        fit: BoxFit.fill,
                                        height: screenHeight * 0.180,
                                        width: screenWidth * 0.405),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 2.0,
                                          right: 1.0),
                                      child: Text("MoonBirds",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14 * textScale,
                                              color: Colors.black)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          // color: primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 100.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Quantity",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
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
          ),

          SliverStickyHeader(
            header: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.030,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Top Collectors',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // itemCount: state.topcollectorsnft.length,
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  var bean = _list[index];
                  return Padding(
                      padding: EdgeInsets.all(4),
                      child: Container(
                        height: screenHeight * 0.180,
                        // padding: const EdgeInsets.all(1),

                        // child: Text('lorem'),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                return NftDetailsPage();
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: theme.backgroundColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.0),
                                          bottomLeft: Radius.circular(5.0))),
                                  height: screenHeight * 0.200,
                                  width: screenWidth * 0.405,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: FadeInImage.assetNetwork(
                                        alignment:
                                            Alignment.topCenter, // add this
                                        placeholder: 'dummy image',
                                        image:
                                            'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                        fit: BoxFit.fill,
                                        height: screenHeight * 0.180,
                                        width: screenWidth * 0.405),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 2.0,
                                          right: 1.0),
                                      child: Text("MoonBirds",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14 * textScale,
                                              color: Colors.black)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          // color: primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 100.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Quantity",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
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
          ),

          SliverStickyHeader(
            header: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.030,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Featured Creations',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // itemCount: state.featuredcreationsnft.length,
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  var bean = _list[index];
                  return Padding(
                      padding: EdgeInsets.all(4),
                      child: Container(
                        height: screenHeight * 0.180,
                        // padding: const EdgeInsets.all(1),

                        // child: Text('lorem'),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                return NftDetailsPage();
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: theme.backgroundColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.0),
                                          bottomLeft: Radius.circular(5.0))),
                                  height: screenHeight * 0.200,
                                  width: screenWidth * 0.405,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: FadeInImage.assetNetwork(
                                        alignment:
                                            Alignment.topCenter, // add this
                                        placeholder: 'dummy image',
                                        image:
                                            'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                        fit: BoxFit.fill,
                                        height: screenHeight * 0.180,
                                        width: screenWidth * 0.405),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 2.0,
                                          right: 1.0),
                                      child: Text("MoonBirds",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14 * textScale,
                                              color: Colors.black)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          // color: primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 100.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Quantity",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
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
          ),

          SliverStickyHeader(
            header: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.030,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Featured Creators',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // itemCount: state.featuredcreatorsnft.length,
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  var bean = _list[index];
                  return Padding(
                      padding: EdgeInsets.all(4),
                      child: Container(
                        height: screenHeight * 0.180,
                        // padding: const EdgeInsets.all(1),

                        // child: Text('lorem'),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                return NftDetailsPage();
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: theme.backgroundColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.0),
                                          bottomLeft: Radius.circular(5.0))),
                                  height: screenHeight * 0.200,
                                  width: screenWidth * 0.405,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: FadeInImage.assetNetwork(
                                        alignment:
                                            Alignment.topCenter, // add this
                                        placeholder: 'dummy image',
                                        image:
                                            'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                        fit: BoxFit.fill,
                                        height: screenHeight * 0.180,
                                        width: screenWidth * 0.405),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 2.0,
                                          right: 1.0),
                                      child: Text("MoonBirds",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14 * textScale,
                                              color: Colors.black)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          // color: primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 100.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Quantity",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
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
          ),

          SliverStickyHeader(
            header: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.030,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Recent Sales',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // itemCount: state.recentsalesnft.length,
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  var bean = _list[index];
                  return Padding(
                      padding: EdgeInsets.all(4),
                      child: Container(
                        height: screenHeight * 0.180,
                        // padding: const EdgeInsets.all(1),

                        // child: Text('lorem'),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                return NftDetailsPage();
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: theme.backgroundColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.0),
                                          bottomLeft: Radius.circular(5.0))),
                                  height: screenHeight * 0.200,
                                  width: screenWidth * 0.405,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: FadeInImage.assetNetwork(
                                        alignment:
                                            Alignment.topCenter, // add this
                                        placeholder: 'dummy image',
                                        image:
                                            'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                        fit: BoxFit.fill,
                                        height: screenHeight * 0.180,
                                        width: screenWidth * 0.405),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 2.0,
                                          right: 1.0),
                                      child: Text("MoonBirds",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14 * textScale,
                                              color: Colors.black)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          // color: primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 100.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Quantity",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
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
          ),

          SliverStickyHeader(
            header: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.030,
              width: screenWidth * 0.070,
              // color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) {
                    return Collection();
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      'Recent Creations',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    // Padding(padding:const EdgeInsets.symmetric(horizontal: 70.0),),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: theme.backgroundColor,
              height: screenHeight * 0.300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // itemCount: state.recentcreationsnft.length,
                padding: const EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  var bean = _list[index];
                  return Padding(
                      padding: EdgeInsets.all(4),
                      child: Container(
                        height: screenHeight * 0.180,
                        // padding: const EdgeInsets.all(1),

                        // child: Text('lorem'),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) {
                                return NftDetailsPage();
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: theme.backgroundColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.0),
                                          bottomLeft: Radius.circular(5.0))),
                                  height: screenHeight * 0.200,
                                  width: screenWidth * 0.405,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: FadeInImage.assetNetwork(
                                        alignment:
                                            Alignment.topCenter, // add this
                                        placeholder: 'dummy image',
                                        image:
                                            'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                        fit: BoxFit.fill,
                                        height: screenHeight * 0.180,
                                        width: screenWidth * 0.405),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 2.0,
                                          right: 1.0),
                                      child: Text("MoonBirds",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14 * textScale,
                                              color: Colors.black)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          // color: primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 100.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 0.0,
                                          right: 3.0),
                                      child: Text("Quantity",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.0,
                                          bottom: 1.0,
                                          left: 80.0,
                                          right: 3.0),
                                      child: Text("2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12 * textScale,
                                              color: Colors.black38)),
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
          ),
        ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: const <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.grey,
      //         ),
      //         child: Text(
      //           'Drawer Header',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       NestedTabBar2()
      //     ],
      //   ),
      // ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: Container(
            child: Responsive(
              mobile: _HomeScreenMobile(),
              tablet: _HomeScreenTablet(),
            ),
          ),
        ));
  }
}
