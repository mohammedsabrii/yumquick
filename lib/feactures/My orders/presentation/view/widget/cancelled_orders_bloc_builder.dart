import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/manger/cubit/cancelled_orders_cubit/cancelled_orders_cubit.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/cancelled_orders_item.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/no_active_orders_view.dart';

class CancelledOrdersBlocBuilder extends StatelessWidget {
  const CancelledOrdersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CancelledOrdersCubit, CancelledOrdersState>(
      builder: (context, state) {
        if (state is CanclledOrdersSuccess) {
          return CancelledOrdersItem(cancelldOrders: state.cancelledOrders);
        } else if (state is CanclledOrdersEmpty) {
          return const NoActiveOrderView(
            title: 'You don`t have any cancelled orders',
          );
        } else if (state is CanclledOrdersFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: AppStyles.styleLeagueSpartanMediem16(
                context,
              ).copyWith(color: Colors.red),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kMainColor),
          );
        }
      },
    );
  }
}
