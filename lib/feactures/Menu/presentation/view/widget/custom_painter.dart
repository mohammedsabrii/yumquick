import 'package:flutter/material.dart';

class ArchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double archHeight = 80;
    double archRadius = 50;

    Path path = Path();
    path.moveTo(0, archHeight);
    path.quadraticBezierTo(0, 0, archRadius, 0);
    path.lineTo(size.width - archRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, archHeight);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class MyCustomPaint extends StatelessWidget {
  const MyCustomPaint({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ArchClipper(),
      child: Container(width: 200, height: 200, color: Colors.white),
    );
  }
}
