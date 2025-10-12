import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_profile_info_cubit/fetch_profile_info_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/stripe_cubit/stripe_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/methods/confirmed_order_handle_payment.dart';

class ConfirmedOrderButton extends StatelessWidget {
  const ConfirmedOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProfileInfoCubit, FetchProfileInfoState>(
      builder: (context, profileState) {
        if (profileState is! FetchProfileInfoSuccess) {
          return const CircularProgressIndicator(color: AppColor.kMainColor);
        }

        return BlocConsumer<StripeCubit, StripeState>(
          listener: (context, state) async {
            if (state is StripeSuccess) {
              await handlePaymentSuccess(
                context,
                profileState,
                state.paymentIntentModel,
              );
            } else if (state is StripeFailure) {
              handlePaymentFailure(context, state.errorMessage);
            }
          },
          builder: (context, stripeState) {
            final isLoading = stripeState is StripeLoading;

            return CustomButton(
              onTap: isLoading ? null : () => onConfirmPressed(context),
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              isLodaing: isLoading,
              color: AppColor.kPinkishOrange,
              title: 'Confirm Order',
              textStyle: AppStyles.styleLeagueSpartanregular18(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            );
          },
        );
      },
    );
  }
}
