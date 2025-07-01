import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';

class GridViewItemBackGroundImage extends StatelessWidget {
  const GridViewItemBackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.175,
      width: MediaQuery.sizeOf(context).width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(image: AssetImage(AppAssets.kTestImage2)),
      ),
    );
  }
}
