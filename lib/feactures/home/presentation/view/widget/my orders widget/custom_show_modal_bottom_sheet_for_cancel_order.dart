import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/my%20orders%20widget/custom_show_model_botton_sheet_container.dart';

class CustomShowModalBottomSheetForCancelOrder extends StatelessWidget {
  const CustomShowModalBottomSheetForCancelOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.089,
      ),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.058),

            Text(
              'Are you sure about canceling order?',
              textAlign: TextAlign.center,
              style: AppStyles.syleInterExtraBold24(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.028),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomShowModalBottomSheetContainer(
                  onTap: () {
                    GoRouter.of(context).pop();
                    GoRouter.of(context).push(AppRouter.kCancelOrderView);
                  },
                  color: AppColor.kMainColor,
                  text: 'Cancel Order',
                  textColor: AppColor.kCultured,
                ),
                const CustomShowModalBottomSheetContainer(
                  text: 'Keep order',
                  color: AppColor.kPinkishOrange,
                  textColor: AppColor.kMainColor,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
