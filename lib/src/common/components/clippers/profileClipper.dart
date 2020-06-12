import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path> {
  var roundnessFactor = 35.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.57);
    path.lineTo(size.width * 0.15, size.height * 0.85);
    path.quadraticBezierTo(
      size.width * 0.15 + roundnessFactor * 0.6,
      size.height * 0.85 + roundnessFactor * 0.88,
      size.width * 0.20 + roundnessFactor * 1.55,
      size.height * 0.86,
    );
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
