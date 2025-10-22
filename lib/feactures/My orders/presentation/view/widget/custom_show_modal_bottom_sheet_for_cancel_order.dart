import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_show_model_botton_sheet_bottom.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/custom_cancel_order_button.dart';

class CustomShowModalBottomSheetForCancelOrder extends StatelessWidget {
  const CustomShowModalBottomSheetForCancelOrder({
    super.key,
    required this.orderEntity,
  });
  final OrdersEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.089,
      ),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.058),

            Text(
              'Are you sure about canceling order?',
              textAlign: TextAlign.center,
              style: AppStyles.syleInterExtraBold24(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.028),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCancelOrderButton(orderEntity: orderEntity),
                CustomShowModalBottomSheetBottom(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  title: 'Keep order',
                  color: AppColor.kPinkishOrange,
                  textColor: AppColor.kMainColor,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
