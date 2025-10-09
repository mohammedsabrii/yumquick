import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/entity/cancelled_orders_entity.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/order_status.dart';

class CancelledOrdersDetails extends StatelessWidget {
  const CancelledOrdersDetails({
    super.key,
    required this.cancelledOrdersEntity,
  });
  final CancelledOrdersEntity cancelledOrdersEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        CancelledOrderTitleAndPrice(activeOrderEntity: cancelledOrdersEntity),
        CancelledOrderMetaData(activeOrderEntity: cancelledOrdersEntity),
        const OrderStatus(
          icon: AppAssets.kCancelledOrderIcon,
          title: 'Order cancelled',
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

class CancelledOrderTitleAndPrice extends StatelessWidget {
  const CancelledOrderTitleAndPrice({
    super.key,
    required this.activeOrderEntity,
  });
  final CancelledOrdersEntity activeOrderEntity;
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

class CancelledOrderMetaData extends StatelessWidget {
  const CancelledOrderMetaData({super.key, required this.activeOrderEntity});
  final CancelledOrdersEntity activeOrderEntity;
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
