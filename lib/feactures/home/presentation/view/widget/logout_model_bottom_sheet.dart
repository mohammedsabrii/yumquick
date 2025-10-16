import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/utils/app_router.dart';

import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_show_model_botton_sheet_bottom.dart';

class LogoutModelBottomSheet extends StatelessWidget {
  const LogoutModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.089),
      child: SizedBox(
        width: double.infinity,
        height: mediaQuery.height * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: mediaQuery.height * 0.058),

            Text(
              'Are you sure you want to log out?',
              textAlign: TextAlign.center,
              style: AppStyles.syleInterExtraBold24(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: mediaQuery.height * 0.028),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomShowModalBottomSheetBottom(
                  text: 'Cancel',
                  color: AppColor.kPinkishOrange,
                  textColor: AppColor.kMainColor,
                ),
                CustomShowModalBottomSheetBottom(
                  onTap: () async {
                    await Supabase.instance.client.auth.signOut();
                    GoRouter.of(context).pushReplacement(AppRouter.kLogInView);
                  },
                  color: AppColor.kMainColor,
                  text: 'Yes, logout',
                  textColor: AppColor.kCultured,
                ),
              ],
            ),
            SizedBox(height: mediaQuery.height * 0.0243),
          ],
        ),
      ),
    );
  }
}
