import 'package:flutter/widgets.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/settings/presentation/view/widget/settings_view_detailes.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0492),
        CustomPageHeader(
          title: 'Settings',
          space: MediaQuery.sizeOf(context).width * 0.262,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.034),
        const SettingsViewDetailes(),
      ],
    );
  }
}
