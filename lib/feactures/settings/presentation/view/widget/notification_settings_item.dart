import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class NotificationSettingsItem extends StatelessWidget {
  const NotificationSettingsItem({
    super.key,
    required this.title,
    required this.isActive,
  });
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.013),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.styleLeagueSpartanMediem20(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
          Expanded(
            child: Transform.scale(
              scale: 0.7,

              alignment: Alignment.centerRight,
              child: SwitchListTile(
                activeTrackColor: AppColor.kMainColor,
                inactiveTrackColor: AppColor.kPinkishOrange,
                trackOutlineColor: WidgetStateProperty.all<Color>(
                  Colors.transparent,
                ),
                activeColor: AppColor.kCultured,
                inactiveThumbColor: AppColor.kCultured,
                value: isActive,

                onChanged: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
