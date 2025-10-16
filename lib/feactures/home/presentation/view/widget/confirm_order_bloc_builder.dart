import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/confirm_order_empty.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/confirm_order_have_items.dart';

class ConfirmOrderBlocBuilder extends StatelessWidget {
  const ConfirmOrderBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CartsCubit, CartsState>(
        builder: (context, state) {
          if (state is CartsSuccess) {
            return ConfirmOrderHaveItems(cartEntity: state.cartProducts);
          } else if (state is CartsFailure) {
            return Text(
              state.errorMessage,
              style: AppStyles.styleLeagueSpartanMediem16(
                context,
              ).copyWith(color: Colors.red),
            );
          } else if (state is CartsEmpty) {
            return const ConfirmOrderEmpty();
          }
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kMainColor),
          );
        },
      ),
    );
  }
}
