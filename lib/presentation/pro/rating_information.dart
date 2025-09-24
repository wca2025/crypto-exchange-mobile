// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:share/share.dart';

class RatingInformation extends StatelessWidget {
  // RatingInformation(this.nft);
  // final Nft nft;

  Widget _buildRatingBar(ThemeData theme) {
    var stars = <Widget>[];

    // for (var i = 1; i <= 5; i++) {
    //   var color = i <= nft.starRating ? theme.accentColor : Colors.black12;
    //   var star = Icon(
    //     Icons.star,
    //     color: Colors.grey,
    //   );

    //   stars.add(star);
    // }

    return Row(children: stars);
  }

  final String _content =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';

  void _shareContent() {
    Share.share(_content);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var ratingCaptionStyle = textTheme.caption!.copyWith(color: Colors.black45);
    final textScale = MediaQuery.of(context).textScaleFactor;

    var numericRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Text(
        //   '5 stars',
        //   // nft.rating.toString(),
        //   style: textTheme.title.copyWith(
        //     fontWeight: FontWeight.w400,
        //     color: theme.accentColor,
        //   ),
        // ),
        SizedBox(height: 4.0),
        // Text(
        //   'Ratings',
        //   style: ratingCaptionStyle,
        // ),
      ],
    );

    var starRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        // _buildRatingBar(theme),
      ],
    );

    return Column(children: []);
  }
}
