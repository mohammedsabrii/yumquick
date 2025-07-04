import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class ProdactSizeItem extends StatelessWidget {
  const ProdactSizeItem({
    super.key,
    required this.size,
    required this.price,
    required this.chackPoint,
  });
  final String size, price, chackPoint;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          size,
          textAlign: TextAlign.center,
          style: AppStyles.styleLeagueSpartanLight14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        const Spacer(),
        Text('\$$price', style: AppStyles.styleLeagueSpartanLight12(context)),
        const SizedBox(width: 8),
        SvgPicture.asset(chackPoint),
      ],
    );
  }
}
