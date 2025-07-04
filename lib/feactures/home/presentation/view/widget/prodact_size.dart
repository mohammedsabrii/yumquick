import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/prodact_size_item.dart';

class ProdactSize extends StatelessWidget {
  const ProdactSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          'Prodact Size',
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        const ProdactSizeItem(
          size: 'Personal (4 Slides)',
          price: '5',
          chackPoint: AppAssets.kcheckPointIcon,
        ),
        const ProdactSizeItem(
          size: 'Medium (8 Slides)',
          price: '8',
          chackPoint: AppAssets.kcheckPointIcon,
        ),
        const ProdactSizeItem(
          size: 'Familiar (10 Slides)',
          price: '12',
          chackPoint: AppAssets.kcheckPointIcon,
        ),
        const ProdactSizeItem(
          size: 'Jumbo (12 Slides)',
          price: '15',
          chackPoint: AppAssets.kSelectedCheckedPointIcon,
        ),
      ],
    );
  }
}
