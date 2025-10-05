import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/active_order_entity.dart';

class OrderMetaData extends StatelessWidget {
  const OrderMetaData({super.key, required this.activeOrderEntity});
  final ActiveOrderEntity activeOrderEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${activeOrderEntity.quantity} items',
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(fontWeight: FontWeight.w300, color: AppColor.kDarkRed),
        ),
      ],
    );
  }
}
