import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/feactures/settings/presentation/view/widget/notification_settings_item.dart';

class NotificationSettingsDetailes extends StatelessWidget {
  const NotificationSettingsDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0609),
            const NotificationSettingsItem(
              title: 'General Notification',
              isActive: true,
            ),
            const NotificationSettingsItem(title: 'Sound', isActive: true),
            const NotificationSettingsItem(title: 'Sound Call', isActive: true),
            const NotificationSettingsItem(title: 'Vibrate', isActive: true),
            const NotificationSettingsItem(
              title: 'Special Offers',
              isActive: false,
            ),
            const NotificationSettingsItem(title: 'Payments', isActive: false),
            const NotificationSettingsItem(
              title: 'Promo and discount',
              isActive: false,
            ),
            const NotificationSettingsItem(title: 'Cashback', isActive: false),
          ],
        ),
      ),
    );
  }
}
