import 'package:flutter/material.dart';

class ArcBannerImage extends StatelessWidget {
  final String imageUrl;

  const ArcBannerImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      child: Image.asset(
        imageUrl,
        width: screenWidth,
        height: 230.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 30);

    var firstCP = Offset(size.width * .25, size.height);
    var firstEP = Offset(size.width * .5, size.height);

    path.quadraticBezierTo(firstCP.dx, firstCP.dy, firstEP.dx, firstEP.dy);

    var secondCP = Offset(size.width * .75, size.height);
    var secondEP = Offset(size.width, size.height - 30);

    path.quadraticBezierTo(secondCP.dx, secondCP.dy, secondEP.dx, secondEP.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
