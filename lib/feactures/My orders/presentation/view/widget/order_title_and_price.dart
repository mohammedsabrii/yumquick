import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/active_order_entity.dart';

class OrderTitleAndPrice extends StatelessWidget {
  const OrderTitleAndPrice({super.key, required this.activeOrderEntity});
  final ActiveOrderEntity activeOrderEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            activeOrderEntity.product.name,
            maxLines: 3,
            style: AppStyles.styleLeagueSpartanMediem20(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
        ),

        Text(
          '\$${activeOrderEntity.totalAmount}',
          textAlign: TextAlign.right,
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: AppColor.kMainColor),
        ),
      ],
    );
  }
}
