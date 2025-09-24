import 'package:flutter/material.dart';
// import 'package:better_player/better_player.dart';

// class ArcBannerImage extends StatelessWidget {

// ArcBannerImage(this.imageUrl);
// final String imageUrl;

class ArcBannerImage extends StatelessWidget {
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
    
            // clipper: ArcClipper(),
            child: Container(
                height: screenHeight * 0.50,
                width: screenWidth * 9.0,
                child: Image.network("https://c4.wallpaperflare.com/wallpaper/906/71/649/uefa-champions-league-wallpaper-preview.jpg",
                  height: screenHeight * 0.10,
                  fit: BoxFit.cover,

                
                )));
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
