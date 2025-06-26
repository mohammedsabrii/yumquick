import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class CartTotalItem extends StatefulWidget {
  const CartTotalItem({super.key});

  @override
  State<CartTotalItem> createState() => _CartTotalItemState();
}

class _CartTotalItemState extends State<CartTotalItem> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (itemCount > 1) {
              setState(() {
                itemCount--;
              });
            }
          },
          child: SvgPicture.asset(AppAssets.kLessIcon),
        ),
        const SizedBox(width: 5),
        Text(
          '$itemCount',
          textAlign: TextAlign.center,
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(fontSize: 13, color: AppColor.kCultured),
        ),
        const SizedBox(width: 5),

        GestureDetector(
          onTap: () {
            setState(() {
              itemCount++;
            });
          },
          child: SvgPicture.asset(AppAssets.kAddIcon),
        ),
      ],
    );
  }
}
