import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class ProdactDetailsImage extends StatelessWidget {
  const ProdactDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(AppAssets.kProdactDetailsTest),
        Positioned(
          top: MediaQuery.sizeOf(context).height * -0.02699,
          right: MediaQuery.sizeOf(context).width * -0.0585,
          child: SvgPicture.asset(AppAssets.kOffarStar),
        ),
        Positioned(
          top: 0,
          right: -9,
          child: Text(
            '-30%',
            textAlign: TextAlign.center,
            style: AppStyles.styleLeagueSpartanBold20(
              context,
            ).copyWith(color: AppColor.kCultured),
          ),
        ),
      ],
    );
  }
}
