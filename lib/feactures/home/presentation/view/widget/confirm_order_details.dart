import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/address_container.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/calculate_total_price.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/confirm_order_item.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/shipping_and_edit_address.dart';

class ConfirmOrderDetails extends StatelessWidget {
  const ConfirmOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.046),
            const ShippingAndEditAddress(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.018),
            const AddressContainer(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0586),
            Text(
              'Order Summary',
              style: AppStyles.styleLeagueSpartanMediem20(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            const Divider(color: AppColor.kPinkishOrange, thickness: 2),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<CartsCubit, CartsState>(
                builder: (context, state) {
                  if (state is CartsSuccess) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.cartProducts.length,
                            itemBuilder: (context, index) {
                              return ConfirmOrderItem(
                                cartEntity: state.cartProducts[index],
                              );
                            },
                          ),
                          const CalculateTotalPrice(
                            color: AppColor.kDarkRed,
                            dividerColor: AppColor.kPinkishOrange,
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                            onTap: () {},
                            width: 150,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 5,
                            ),
                            color: AppColor.kPinkishOrange,
                            title: 'Place Order',
                            textStyle: AppStyles.styleLeagueSpartanregular23(
                              context,
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    );
                  } else if (state is CartsFailure) {
                    return Text(
                      state.errorMessage,
                      style: AppStyles.styleLeagueSpartanMediem16(
                        context,
                      ).copyWith(color: Colors.red),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.kMainColor,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
