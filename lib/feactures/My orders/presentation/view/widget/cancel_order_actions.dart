import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/custom_order_container.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/custom_show_modal_bottom_sheet_for_cancel_order.dart';

class CancelOrderActions extends StatelessWidget {
  const CancelOrderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomOrderContainer(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => CustomShowModalBottomSheetForCancelOrder(),
            );
          },
          title: 'Cancel Order',
          color: AppColor.kMainColor,
          textColor: AppColor.kCultured,
        ),

        const CustomOrderContainer(
          title: 'Track Driver',
          color: AppColor.kPinkishOrange,
          textColor: AppColor.kMainColor,
        ),
      ],
    );
  }
}
