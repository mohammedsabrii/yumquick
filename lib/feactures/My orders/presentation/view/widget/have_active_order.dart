import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/have_active_order_item.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/no_active_orders_view.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/manger/cubit/active_orders_cubit/active_orders_cubit.dart';

class HaveActiveOrder extends StatelessWidget {
  const HaveActiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.087,
      ),
      child: BlocBuilder<ActiveOrdersCubit, ActiveOrdersState>(
        builder: (context, state) {
          if (state is ActiveOrdersEmpty) {
            return const NoActiveOrderView();
          } else if (state is ActiveOrdersFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppStyles.styleLeagueSpartanMediem16(
                  context,
                ).copyWith(color: Colors.red),
              ),
            );
          } else if (state is ActiveOrdersSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Divider(thickness: 1, color: AppColor.kMainColor),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      return HaveActiveOrderItem(
                        activeOrderEntity: state.orders[index],
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kMainColor),
          );
        },
      ),
    );
  }
}
