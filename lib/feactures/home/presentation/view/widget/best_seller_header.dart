import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Best Seller ',
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        Row(
          children: [
            Text(
              'View All',
              style: AppStyles.styleLeagueSpartanregular12(context).copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.kMainColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 9),
            SvgPicture.asset(AppAssets.kNextIcon, height: 13),
          ],
        ),
      ],
    );
  }
}
