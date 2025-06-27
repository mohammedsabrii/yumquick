import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kDeliveryAddress),
      child: Container(
        width: double.infinity,
        height: 35,
        decoration: BoxDecoration(
          color: AppColor.kYellowBase,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            '778 Locust View Drive Oaklanda, CA',
            style: AppStyles.styleLeagueSpartanMediem16(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
        ),
      ),
    );
  }
}
