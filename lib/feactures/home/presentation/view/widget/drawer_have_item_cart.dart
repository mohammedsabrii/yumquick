import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/calculate_total_price.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_cart_item.dart';

class DrawerHaveItemCart extends StatelessWidget {
  const DrawerHaveItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, state) {
        if (state is CartsSuccess) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppAssets.kDrawerCartIcon),
                  const SizedBox(width: 10),
                  Text(
                    'Cart',
                    style: AppStyles.styleLeagueSpartanBold24(
                      context,
                    ).copyWith(color: AppColor.kCultured),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.048),
              const Divider(thickness: 2, color: AppColor.kYellowBase),
              const SizedBox(height: 15),
              Text(
                'You have ${state.cartProducts.length} items in the cart',
                style: AppStyles.styleLeagueSpartanregular20(
                  context,
                ).copyWith(color: AppColor.kCultured),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.3434,
                child: ListView.builder(
                  itemCount: state.cartProducts.length,
                  itemBuilder: (context, index) {
                    return DrawerCartItem(
                      cartEntity: state.cartProducts[index],
                    );
                  },
                ),
              ),
              const CalculateTotalPrice(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.045),
              CustomButton(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kConfirmOrderView);
                },
                color: AppColor.kYellowBase,
                title: 'Checkout',
                width: 131,
                textStyle: AppStyles.styleLeagueSpartanBold24(context).copyWith(
                  color: AppColor.kMainColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        } else if (state is CartsFailure) {
          return Text(
            state.errorMessage,
            style: AppStyles.styleLeagueSpartanMediem16(
              context,
            ).copyWith(color: AppColor.kCultured),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kCultured),
          );
        }
      },
    );
  }
}
