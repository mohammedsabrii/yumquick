import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/calculate_total_price_item.dart';

class CalculateTotalPrice extends StatelessWidget {
  const CalculateTotalPrice({super.key, this.color, this.dividerColor});
  final Color? color, dividerColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, state) {
        if (state is! CartsSuccess) return const SizedBox();
        final cubit = BlocProvider.of<CartsCubit>(context);

        return Column(
          children: [
            CalculateTotalPriceItem(
              color: color ?? AppColor.kCultured,
              title: 'Subtotal',
              price: '\$${cubit.subtotal.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 10),
            CalculateTotalPriceItem(
              color: color ?? AppColor.kCultured,
              title: 'Tax and Fees',
              price: '\$${cubit.taxAndFees.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 10),
            CalculateTotalPriceItem(
              color: color ?? AppColor.kCultured,
              title: 'Delivery',
              price: '\$${cubit.delivery.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 10),
            Divider(thickness: 2, color: dividerColor ?? AppColor.kCultured),
            const SizedBox(height: 10),
            CalculateTotalPriceItem(
              color: color ?? AppColor.kCultured,
              title: 'Total',
              price: '\$${cubit.total.toStringAsFixed(2)}',
            ),
          ],
        );
      },
    );
  }
}
