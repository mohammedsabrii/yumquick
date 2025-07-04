import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class ProdactDetailsButton extends StatelessWidget {
  const ProdactDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: 180.32,
      height: 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44.79),
        color: AppColor.kMainColor,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.kAddProdactToCart),
          const SizedBox(width: 7),
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
