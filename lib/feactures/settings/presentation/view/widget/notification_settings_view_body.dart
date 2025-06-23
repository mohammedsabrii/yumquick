import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/settings/presentation/view/widget/notification_settings_detailes.dart';

class NotificationSettingsViewBody extends StatelessWidget {
  const NotificationSettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0492),

        CustomPageHeader(
          title: 'Notification Setting',
          space: MediaQuery.sizeOf(context).width * 0.0839,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.034),
        const NotificationSettingsDetailes(),
      ],
    );
  }
}
