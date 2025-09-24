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

class NftDetailHeader extends StatelessWidget {
  final String _content =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';

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
              ArcBannerImage(),
        ),
        // Positioned(
        //   bottom: 0.0,
        //   left: 16.0,
        //   right: 16.0,
        //   child:Container(

        //     child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       Poster(
        //         // movie.posterUrl,
        //         height: screenHeight * 0.18,
        //       ),
        //       SizedBox(width: screenWidth * 0.16),
        //       Expanded(child: movieInformation),
        //     ],
        //   ),)
        // ),
      ],
    ));
  }
}
