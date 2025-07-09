import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_button.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/feactures/Payment%20Methods/presentation/view/widget/payment_methods_item.dart';

class PaymentMethodsDetailes extends StatelessWidget {
  const PaymentMethodsDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.089,
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).width * 0.0515),
              const PaymentMethodsItem(
                icon: AppAssets.kPaymentIcon,
                title: '0000000000000',
              ),
              const PaymentMethodsItem(
                icon: AppAssets.kApplePayIcon,
                title: 'Apple Pay',
              ),
              const PaymentMethodsItem(
                icon: AppAssets.kPaypalIcon,
                title: 'PayPal',
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.178),
              CustomButton(
                width: MediaQuery.sizeOf(context).width * 0.325,
                color: AppColor.kPinkishOrange,
                title: 'Add New Card',
                textStyle: AppStyles.styleLeagueSpartanMediem17(
                  context,
                ).copyWith(color: AppColor.kMainColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
