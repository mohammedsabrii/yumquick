import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/manger/cubit/on_track_orders_cubit/on_track_orders_cubit.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/no_active_orders_view.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/on_track_orders_item.dart';

class OnTrackOrders extends StatelessWidget {
  const OnTrackOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.087,
      ),
      child: BlocBuilder<OnTrackOrdersCubit, OnTrackOrdersState>(
        builder: (context, state) {
          if (state is OnTrackOrdersEmpty) {
            return const NoActiveOrderView(
              title: 'You don`t have any on track orders at this time',
            );
          } else if (state is OnTrackOrdersFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppStyles.styleLeagueSpartanMediem16(
                  context,
                ).copyWith(color: Colors.red),
              ),
            );
          } else if (state is OnTrackOrdersSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Divider(thickness: 1, color: AppColor.kMainColor),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.onTrakOrders.length,
                    itemBuilder: (context, index) {
                      return OnTrackOrdersItem(
                        ordersEntity: state.onTrakOrders[index],
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
