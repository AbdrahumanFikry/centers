import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
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

class LoginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 35.0;
    var path = Path();
    path.moveTo(0, size.height * 0.75);
    path.lineTo(size.width, size.height - roundnessFactor * 1.4);
    path.lineTo(size.width, roundnessFactor);
    path.quadraticBezierTo(size.width, 0, size.width - roundnessFactor, 0);
    path.lineTo(roundnessFactor, 0);
    path.quadraticBezierTo(0, 0, 0, roundnessFactor);
    path.lineTo(0, size.height * 0.75 - roundnessFactor);
    path.quadraticBezierTo(
        0, size.height * 0.75, 0, size.height * 0.75 - roundnessFactor);
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(0, size.height * 0.75 + roundnessFactor,
        roundnessFactor, size.height * 0.75 + roundnessFactor * 1.3);
    path.lineTo(size.width - roundnessFactor * 1.3,
        size.height - roundnessFactor * 0.3);
    path.quadraticBezierTo(size.width, size.height, size.width,
        size.height - roundnessFactor * 1.4);
    path.lineTo(size.width, 50);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
