import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/on_track_order_details.dart';

class OnTrackOrdersItem extends StatelessWidget {
  const OnTrackOrdersItem({super.key, required this.ordersEntity});
  final OrdersEntity ordersEntity;
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
                  image: NetworkImage(ordersEntity.product.image),
                ),
              ),
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.033),
            Expanded(child: OnTrackOrderDetails(ordersEntity: ordersEntity)),
          ],
        ),
        const Divider(thickness: 1, color: AppColor.kMainColor),
      ],
    );
  }
}
