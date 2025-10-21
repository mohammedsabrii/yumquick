import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/cancelled_orders_details.dart';

class CancelledOrdersItem extends StatelessWidget {
  const CancelledOrdersItem({super.key, required this.cancelldOrders});
  final List<OrdersEntity> cancelldOrders;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Divider(thickness: 1, color: AppColor.kMainColor),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cancelldOrders.length,
            itemBuilder: (context, index) {
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
                            image: NetworkImage(
                              cancelldOrders[index].product.image,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.sizeOf(context).width * 0.033),
                      Expanded(
                        child: CancelledOrdersDetails(
                          ordersEntity: cancelldOrders[index],
                        ),
                      ),
                    ],
                  ),

                  const Divider(thickness: 1, color: AppColor.kMainColor),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
