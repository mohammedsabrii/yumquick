import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.0164,
      width: 14,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Icon(Icons.favorite, color: Colors.red, size: 10),
    );
  }
}
