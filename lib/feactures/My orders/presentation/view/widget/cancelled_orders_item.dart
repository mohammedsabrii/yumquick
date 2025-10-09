import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/manger/cubit/cancelled_orders_cubit/cancelled_orders_cubit.dart';
import 'package:yumquick/feactures/My%20orders/presentation/view/widget/cancelled_orders_details.dart';

class CancelledOrdersItem extends StatelessWidget {
  const CancelledOrdersItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CancelledOrdersCubit, CancelledOrdersState>(
      builder: (context, state) {
        if (state is CanclledOrdersSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const Divider(thickness: 1, color: AppColor.kMainColor),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.sizeOf(context).height * 0.13,
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    state.orders[index].product.image,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.033,
                            ),
                            Expanded(
                              child: CancelledOrdersDetails(
                                cancelledOrdersEntity: state.orders[index],
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
