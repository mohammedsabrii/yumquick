import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/feactures/settings/presentation/view/widget/settings_item.dart';

class SettingsViewDetailes extends StatelessWidget {
  const SettingsViewDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0656),
            SettingsItem(
              space: MediaQuery.sizeOf(context).width * 0.06183,
              onTap:
                  () => GoRouter.of(
                    context,
                  ).push(AppRouter.kNotificationSettings),
              width: 24.50,
              height: 35.06,
              icon: AppAssets.kNotificationSettingIcon,
              title: 'Notification Settings',
            ),
            SettingsItem(
              onTap:
                  () => GoRouter.of(context).push(AppRouter.kPasswordSettings),
              space: MediaQuery.sizeOf(context).width * 0.044,
              width: 35.32,
              height: 34.45,
              icon: AppAssets.kPasswordSettingIcon,
              title: 'Password Settings',
            ),
            SettingsItem(
              space: MediaQuery.sizeOf(context).width * 0.06712,
              width: 23.47,
              height: 34.91,
              icon: AppAssets.kDeleteAccountIcon,
              title: 'Delete Account',
            ),
          ],
        ),
      ),
    );
  }
}
