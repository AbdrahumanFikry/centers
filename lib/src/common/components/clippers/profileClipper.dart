import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path> {
  var roundnessFactor = 35.0;

  @override
  Path getClip(Size size) {
    roundnessFactor = size.width > 400 ? 15.0 : 35.0;
    Path path = Path();
    path.lineTo(0, size.height * 0.57);
    path.lineTo(size.width * 0.14, size.height * 0.90);
    path.quadraticBezierTo(
      size.width * 0.15 + roundnessFactor * 0.6,
      size.height * 0.90 + roundnessFactor * 0.88,
      size.width * 0.20 + roundnessFactor * 1.75,
      size.height * 0.90,
    );
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
