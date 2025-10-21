import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/manger/cubit/completed_orders_cubit/completed_orders_cubit.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/completed_orders_item.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/no_active_orders_view.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.087,
      ),
      child: BlocBuilder<CompletedOrdersCubit, CompletedOrdersState>(
        builder: (context, state) {
          if (state is CompletedOrdersFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppStyles.styleLeagueSpartanMediem16(
                  context,
                ).copyWith(color: AppColor.kMainColor),
              ),
            );
          } else if (state is CompletedOrdersSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Divider(thickness: 1, color: AppColor.kMainColor),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.completedOrders.length,
                    itemBuilder: (context, index) {
                      return CompletedOrdersItem(
                        ordersEntity: state.completedOrders[index],
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state is CompletedOrdersEmpty) {
            return const NoActiveOrderView(
              title: 'You don`t have any completed orders',
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: AppColor.kMainColor),
            );
          }
        },
      ),
    );
  }
}
