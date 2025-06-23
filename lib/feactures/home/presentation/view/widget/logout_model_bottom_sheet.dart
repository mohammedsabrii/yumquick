import 'package:flutter/widgets.dart';

import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_show_model_botton_sheet_bottom.dart';

class LogoutModelBottomSheet extends StatelessWidget {
  const LogoutModelBottomSheet({super.key});

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
              'Are you sure you want to log out?',
              textAlign: TextAlign.center,
              style: AppStyles.syleInterExtraBold24(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.028),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomShowModalBottomSheetBottom(
                  text: 'Cancel',
                  color: AppColor.kPinkishOrange,
                  textColor: AppColor.kMainColor,
                ),
                CustomShowModalBottomSheetBottom(
                  color: AppColor.kMainColor,
                  text: 'Yes, logout',
                  textColor: AppColor.kCultured,
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
