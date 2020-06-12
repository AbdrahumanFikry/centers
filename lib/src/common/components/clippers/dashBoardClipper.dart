import 'package:flutter/material.dart';

class DashBoardClipper extends CustomClipper<Path> {
  var radius = 10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.37);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.5, size.width, size.height * 0.45);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
