import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 16),
      child: Row(
        children: [
          Text('Sort by', style: AppStyles.styleLeagueSpartanLight12(context)),
          const SizedBox(width: 6),
          Text(
            'Popular',
            style: AppStyles.styleLeagueSpartanLight12(
              context,
            ).copyWith(color: AppColor.kMainColor),
          ),
          const Spacer(),
          SvgPicture.asset(AppAssets.kSuffixSearchIcon),
        ],
      ),
    );
  }
}
