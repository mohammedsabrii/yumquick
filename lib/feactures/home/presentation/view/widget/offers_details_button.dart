import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class OffersDetailsButton extends StatelessWidget {
  const OffersDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.only(left: mediaQuery.width * 0.02544),
      width: mediaQuery.width * 0.4605,
      height: mediaQuery.height * 0.0402,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44.79),
        color: AppColor.kMainColor,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.kAddProdactToCart),
          SizedBox(width: mediaQuery.width * 0.0178),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              'Add to Cart',

              style: AppStyles.styleLeagueSpartanMediem20(
                context,
              ).copyWith(color: AppColor.kCultured),
            ),
          ),
        ],
      ),
    );
  }
}
