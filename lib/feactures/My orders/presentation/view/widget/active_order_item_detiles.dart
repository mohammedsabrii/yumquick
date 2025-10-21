import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/cancel_order_actions.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_title_and_price.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';

class HaveActiveOrderItemDetiles extends StatelessWidget {
  const HaveActiveOrderItemDetiles({
    super.key,
    required this.activeOrderEntity,
  });
  final OrdersEntity activeOrderEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        OrderTitleAndPrice(activeOrderEntity: activeOrderEntity),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${activeOrderEntity.quantity} item',
              style: AppStyles.styleLeagueSpartanMediem16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            CancelOrderActions(orderEntity: activeOrderEntity),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
