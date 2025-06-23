import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/logout_model_bottom_sheet.dart';

class CustomLogoutWidget extends StatelessWidget {
  const CustomLogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => showModalBottomSheet(
            context: context,
            builder: (context) {
              return const LogoutModelBottomSheet();
            },
          ),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.kLogOutIcon),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.0585),
          Text(
            'Log Out',
            style: AppStyles.styleLeagueSpartanBold24(
              context,
            ).copyWith(color: AppColor.kCultured, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
