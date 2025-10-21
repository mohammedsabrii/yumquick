import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';

class CancelledOrderMetaData extends StatelessWidget {
  const CancelledOrderMetaData({super.key, required this.orderEntity});
  final OrdersEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${orderEntity.quantity} items',
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(fontWeight: FontWeight.w300, color: AppColor.kDarkRed),
        ),
      ],
    );
  }
}
