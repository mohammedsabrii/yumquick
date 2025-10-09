import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/entity/active_order_entity.dart';
import 'package:yumquick/feactures/My%20orders/entity/cancelled_orders_entity.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/custom_order_container.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/custom_show_modal_bottom_sheet_for_cancel_order.dart';

class CancelOrderActions extends StatelessWidget {
  const CancelOrderActions({super.key, required this.activeOrderEntity});
  final ActiveOrderEntity activeOrderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomOrderContainer(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder:
                  (context) => CustomShowModalBottomSheetForCancelOrder(
                    cancelledOrderEntity: CancelledOrdersEntity(
                      quantity: activeOrderEntity.quantity,
                      totalAmount: activeOrderEntity.totalAmount,
                      product: activeOrderEntity.product,
                    ),
                    activeOrderEntity: activeOrderEntity,
                  ),
            );
          },
          width: MediaQuery.sizeOf(context).width * 0.2,
          style: AppStyles.styleLeagueSpartanMediem14(
            context,
          ).copyWith(color: AppColor.kCultured),
          title: 'Cancel',
          color: AppColor.kMainColor,
          textColor: AppColor.kCultured,
        ),
      ],
    );
  }
}
