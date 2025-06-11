import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';

class BestSellerItemImage extends StatelessWidget {
  const BestSellerItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.113,
      width: MediaQuery.sizeOf(context).width * 0.183,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(image: AssetImage(AppAssets.kTestImage)),
      ),
    );
  }
}
