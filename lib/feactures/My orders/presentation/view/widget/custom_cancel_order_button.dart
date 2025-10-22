import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_show_model_botton_sheet_bottom.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/manger/cubit/active_orders_cubit/active_orders_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_profile_info_cubit/fetch_profile_info_cubit.dart';

class CustomCancelOrderButton extends StatelessWidget {
  const CustomCancelOrderButton({super.key, required this.orderEntity});

  final OrdersEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProfileInfoCubit, FetchProfileInfoState>(
      builder: (context, state) {
        if (state is FetchProfileInfoSuccess) {
          return CustomShowModalBottomSheetBottom(
            onTap: () {
              final userState = context.read<FetchProfileInfoCubit>().state;
              if (userState is FetchProfileInfoSuccess) {
                context.read<ActiveOrdersCubit>().deleteAndCancelOrder(
                  orderEntity,
                  userState,
                );
                GoRouter.of(context).pop();
                GoRouter.of(context).push(AppRouter.kCancelOrderView);
              }
            },
            color: AppColor.kMainColor,
            title: 'Cancel Order',
            textColor: AppColor.kCultured,
          );
        } else if (state is FetchProfileInfoFaliure) {
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
