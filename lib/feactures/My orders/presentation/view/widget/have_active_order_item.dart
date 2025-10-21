import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/active_order_item_detiles.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';

class HaveActiveOrderItem extends StatelessWidget {
  const HaveActiveOrderItem({super.key, required this.activeOrderEntity});
  final OrdersEntity activeOrderEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(activeOrderEntity.product.image),
                ),
              ),
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.033),
            Expanded(
              child: HaveActiveOrderItemDetiles(
                activeOrderEntity: activeOrderEntity,
              ),
            ),
          ],
        ),
        const Divider(thickness: 1, color: AppColor.kMainColor),
      ],
    );
  }
}
