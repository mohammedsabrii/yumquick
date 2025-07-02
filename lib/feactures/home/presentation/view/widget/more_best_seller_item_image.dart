import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/widget/price_item.dart';

class MoreBestSellerItemImage extends StatelessWidget {
  const MoreBestSellerItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.402,
          height: MediaQuery.sizeOf(context).height * 0.167,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AppAssets.kTestImage),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const Positioned(bottom: 25, right: 0, child: PriceItem()),
      ],
    );
  }
}
