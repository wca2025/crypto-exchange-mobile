import 'package:flutter/material.dart';
import 'movie_detail_header.dart';

class Poster extends StatelessWidget {
  static const POSTER_RATIO = 0.7;

  Poster(
    // this.posterUrl,
     {
    this.height = 100.0,
  });

  // final String posterUrl;
   final double height;

  @override
  Widget build(BuildContext context) {
    // var width = POSTER_RATIO * height;
  final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Material(
      borderRadius: BorderRadius.circular(100.0),
      elevation: 0.5,
      child:
        Container(
            
                                              decoration: BoxDecoration( 
                             color: theme.backgroundColor
                                            
,borderRadius:BorderRadius.only(topLeft: Radius.circular(8.0),bottomLeft: Radius.circular(8.0))),
                                              height: screenHeight * 0.150,
                                              width: screenWidth * 0.310,
                                              child:ClipRRect(
                                                borderRadius: BorderRadius.circular(15.0),
                                                child: FadeInImage.assetNetwork(
                                                  alignment: Alignment
                                                      .topCenter, // add this
                                                  placeholder: 'dummy image',
                                                  image:
                                                      'https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg',
                                                  fit:BoxFit.fill,
                                                  height: screenHeight * 0.130,
                                                  width: screenWidth * 0.410),),
                                            ),


     
    );
  }
}

