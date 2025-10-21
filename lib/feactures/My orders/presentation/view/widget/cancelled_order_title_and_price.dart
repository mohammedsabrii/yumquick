import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';

class CancelledOrderTitleAndPrice extends StatelessWidget {
  const CancelledOrderTitleAndPrice({super.key, required this.orderEntity});
  final OrdersEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            orderEntity.product.name,
            maxLines: 3,
            style: AppStyles.styleLeagueSpartanMediem20(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
        ),

        Text(
          '\$${orderEntity.totalAmount}',
          textAlign: TextAlign.right,
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: AppColor.kMainColor),
        ),
      ],
    );
  }
}
