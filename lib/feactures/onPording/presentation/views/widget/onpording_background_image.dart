import 'package:flutter/widgets.dart';

class OnProdingBackGroundImage extends StatelessWidget {
  const OnProdingBackGroundImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
