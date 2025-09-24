import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/auth/auth_bloc.dart';
import 'travel_bean.dart';

import '../widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class UserB {
  final String name;
  final String UserBname;
  final String image;
  bool isFollowedByMe;

  UserB(this.name, this.UserBname, this.image, this.isFollowedByMe);
}

class CountryCode extends StatefulWidget {
  const CountryCode({Key? key}) : super(key: key);

  @override
  _CountryCodeState createState() => _CountryCodeState();
}

class _CountryCodeState extends State<CountryCode>
    with TickerProviderStateMixin {
  List<UserB> _UserBs = [
    UserB(
        'Elliana Palacios',
        '@elliana',
        'https://images.unsplash.com/photo-1504735217152-b768bcab5ebc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=0ec8291c3fd2f774a365c8651210a18b',
        false),
    UserB(
        'Kayley Dwyer',
        '@kayley',
        'https://images.unsplash.com/photo-1503467913725-8484b65b0715?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=cf7f82093012c4789841f570933f88e3',
        false),
    UserB(
        'Kathleen Mcdonough',
        '@kathleen',
        'https://images.unsplash.com/photo-1507081323647-4d250478b919?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=b717a6d0469694bbe6400e6bfe45a1da',
        false),
    UserB(
        'Kathleen Dyer',
        '@kathleen',
        'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=ddcb7ec744fc63472f2d9e19362aa387',
        false),
    UserB(
        'Mikayla Marquez',
        '@mikayla',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    UserB(
        'Kiersten Lange',
        '@kiersten',
        'https://images.unsplash.com/photo-1542534759-05f6c34a9e63?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    UserB(
        'Carys Metz',
        '@metz',
        'https://images.unsplash.com/photo-1516239482977-b550ba7253f2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    UserB(
        'Ignacio Schmidt',
        '@schmidt',
        'https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    UserB(
        'Clyde Lucas',
        '@clyde',
        'https://images.unsplash.com/photo-1569443693539-175ea9f007e8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    UserB(
        'Mikayla Marquez',
        '@mikayla',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false)
  ];

  List<UserB> _foundedUserBs = [];
  late TabController _nestedTabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nestedTabController = new TabController(length: 1, vsync: this);

    setState(() {
      _foundedUserBs = _UserBs;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUserBs =
          _UserBs.where((UserB) => UserB.name.toLowerCase().contains(search))
              .toList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    List<TravelBean> _list = TravelBean.generateMostPopularBean();

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.2,
            bottomOpacity: 1.0,
            shadowColor: theme.scaffoldBackgroundColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            title: Container(
              height: 38,
              child: TextField(
                onChanged: (value) => onSearch(value),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.scaffoldBackgroundColor,
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade500,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none),
                    hintStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    hintText: "Search code"),
              ),
            ),
          ),
          body: Scaffold(
              backgroundColor: theme.backgroundColor,
              // appBar:
              //  AppBar(

              //   backgroundColor: theme.primaryColor,
              //   automaticallyImplyLeading: false,
              //   elevation: 0.20,

              // ),
              body:
                  // BlocConsumer<AuthBloc, AuthState>(
                  //   listener: (context, state) {
                  // TODO: implement listener
                  //          if (state is SuccessAuthState) {
                  //   ScaffoldMessenger.of(context).showSnackBar((
                  //     const SnackBar(
                  //       duration: Duration(seconds: 2),
                  //       content: Text(' succeess ', textScaleFactor: 1.5),
                  //     ),
                  //   );
                  // } else if (state is ErrorAuthState) {
                  //   ScaffoldMessenger.of(context).showSnackBar((
                  //     const SnackBar(
                  //       duration: Duration(seconds: 2),
                  //       content: Text(' error ', textScaleFactor: 1.5),
                  //     ),
                  //   );
                  // }
                  // },
                  // builder: (context, state) {
                  // return
                  Container(
                color: theme.backgroundColor,
                child: _foundedUserBs.length > 0
                    ? TabBarView(
                        controller: _nestedTabController,
                        children: <Widget>[
                            ListView.builder(
                              controller: _controller,
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              scrollDirection: Axis.vertical,
                              // itemCount: state.countrycode.length,
                              padding: const EdgeInsets.all(1.0),
                              itemBuilder: (context, index) {
                                // var bean = _list[index]; return
                                return Container(
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
                                      ListTile(
                                        title: Row(
                                          children: [
                                            Text("china",
                                                style: TextStyle(
                                                  fontSize: 14 * textScale,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Expanded(
                                                child: Container(
                                                    width: screenWidth * 0.08)),
                                            Text("+86",
                                                style: TextStyle(
                                                  fontSize: 14 * textScale,
                                                  fontWeight: FontWeight.w500,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                );
                              },
                            ),

                            // ListView.builder(
                            //   controller: _controller,
                            //   physics: const BouncingScrollPhysics(
                            //       parent: AlwaysScrollableScrollPhysics()),
                            //   scrollDirection: Axis.vertical,
                            //   itemCount: 8,
                            //   padding: const EdgeInsets.all(1.0),
                            //   itemBuilder: (context, index) {
                            //     var bean = _list[index];
                            //     return Container(
                            //       color: Colors.white70,
                            //       // width: screenWidth * 0.880,
                            //       child: InkWell(
                            //         onTap: () {
                            //           // Navigator.of(context,rootNavigator: true)
                            //           //     .push(MaterialPageRoute(builder: (context) {
                            //           //   // return DetailPage(bean);
                            //           //   return NftDetailsPage();
                            //           // }));
                            //         },
                            //         child: Column(children: [
                            //           ListTile(
                            //             leading: Container(
                            //                 color: theme.scaffoldBackgroundColor,
                            //                 width: screenWidth * 0.05,
                            //                 height: screenHeight * 0.025,
                            //                 child: ClipRRect(
                            //                   borderRadius:
                            //                       BorderRadius.circular(10),
                            //                 )),
                            //             title: Row(
                            //               children: [
                            //                 Text("lorem"),
                            //                 Expanded(
                            //                     child: Container(
                            //                         width: screenWidth * 0.08)),
                            //                 Text("lorem")
                            //               ],
                            //             ),
                            //             // subtitle: Row(
                            //             //   children: [
                            //             //     Text("lorem"),
                            //             //     Expanded(child: Container(width: screenWidth * 0.08)),
                            //             //     Text("lorem")
                            //             //   ],
                            //             // ),
                            //             // trailing: Container(
                            //             //   height: screenHeight * 0.050,
                            //             //   width: screenWidth * 0.200,
                            //             //   color: Colors.grey[200],
                            //             //   child: Center(
                            //             //     child: Text('Text'),
                            //             //   ),
                            //             // ),
                            //           ),
                            //         ]),
                            //       ),
                            //     );
                            //   },
                            // ),
                          ])
                    : Center(
                        child: Text(
                        "No country codes found",
                        style: TextStyle(color: Colors.white),
                      )),
              )),
        ));
  }

  UserBComponent({required UserB UserB}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(UserB.image),
                )),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(UserB.name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              Text(UserB.UserBname, style: TextStyle(color: Colors.grey[500])),
            ])
          ]),
          GestureDetector(
            onTap: () {
              setState(() {
                UserB.isFollowedByMe = !UserB.isFollowedByMe;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: UserB.isFollowedByMe
                        ? Colors.blue[700]
                        : Color(0xffffff),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: UserB.isFollowedByMe
                          ? Colors.transparent
                          : Colors.grey.shade700,
                    )),
                child: Center(
                    child: Text(UserB.isFollowedByMe ? 'Unfollow' : 'Follow',
                        style: TextStyle(
                            color: UserB.isFollowedByMe
                                ? Colors.white
                                : Colors.white)))),
          )
        ],
      ),
    );
  }
}
