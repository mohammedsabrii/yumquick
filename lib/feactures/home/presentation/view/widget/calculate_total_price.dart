import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/get_price_model.dart';

class CalculateTotalPrice extends StatelessWidget {
  const CalculateTotalPrice({super.key, this.color, this.dividerColor});
  final Color? color, dividerColor;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Column(
          children: [
            CalculateTotalPriceItem(
              color: color ?? AppColor.kCultured,
              title: 'Subtotal',
              price: '\$${cart.subtotal.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 10),
            CalculateTotalPriceItem(
              color: color ?? AppColor.kCultured,
              title: 'Tax and Fees',
              price: '\$${cart.taxAndFees.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 10),
            CalculateTotalPriceItem(
              color: color ?? AppColor.kCultured,
              title: 'Delivery',
              price: '\$${cart.delivery.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 10),
            Divider(thickness: 2, color: dividerColor ?? AppColor.kCultured),
            const SizedBox(height: 10),
            CalculateTotalPriceItem(
              color: color ?? AppColor.kCultured,
              title: 'Total',
              price: '\$${cart.total.toStringAsFixed(2)}',
            ),
          ],
        );
      },
    );
  }
}

class CalculateTotalPriceItem extends StatelessWidget {
  const CalculateTotalPriceItem({
    super.key,
    required this.title,
    required this.price,
    required this.color,
  });
  final String title;
  final String price;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: color),
        ),
        Text(
          price,
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: color),
        ),
      ],
    );
  }
}
