import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/feactures/settings/presentation/view/widget/settings_item.dart';

class SettingsViewDetailes extends StatelessWidget {
  const SettingsViewDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.089),
        child: Column(
          children: [
            SizedBox(height: mq.height * 0.0656),
            SettingsItem(
              space: mq.width * 0.06183,
              onTap:
                  () => GoRouter.of(
                    context,
                  ).push(AppRouter.kNotificationSettings),
              width: mq.width * 0.06234,
              height: mq.height * 0.042756,
              icon: AppAssets.kNotificationSettingIcon,
              title: 'Notification Settings',
            ),
            SettingsItem(
              onTap:
                  () => GoRouter.of(context).push(AppRouter.kPasswordSettings),
              space: MediaQuery.sizeOf(context).width * 0.044,
              width: mq.width * 0.07633587786259541984732824427481,
              height: mq.height * 0.03658536585365853658536585365854,
              icon: AppAssets.kPasswordSettingIcon,
              title: 'Password Settings',
            ),
            SettingsItem(
              onTap: () => GoRouter.of(context).push(AppRouter.kMyProfileView),
              space: MediaQuery.sizeOf(context).width * 0.044,

              icon: AppAssets.kEditProfileIcon,
              title: 'Profile Settings',
            ),
          ],
        ),
      ),
    );
  }
}
