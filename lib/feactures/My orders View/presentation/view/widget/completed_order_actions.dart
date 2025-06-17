import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders%20View/presentation/view/widget/custom_order_container.dart';

class CompletedOrderActions extends StatelessWidget {
  const CompletedOrderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomOrderContainer(
          onTap: () {},
          title: 'Leave a review',
          color: AppColor.kMainColor,
          textColor: AppColor.kCultured,
        ),

        const CustomOrderContainer(
          title: 'Order Again',
          color: AppColor.kPinkishOrange,
          textColor: AppColor.kMainColor,
        ),
      ],
    );
  }
}
