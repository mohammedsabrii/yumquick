import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/settings/presentation/view/widget/password_settings_detailes.dart';

class PasswordSettingsViewBody extends StatelessWidget {
  const PasswordSettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0492),

        CustomPageHeader(
          title: 'Password Settings',
          space: MediaQuery.sizeOf(context).width * 0.122,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.034),
        PasswordSettingsDetailes(),
      ],
    );
  }
}
