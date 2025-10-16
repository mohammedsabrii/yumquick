import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/profile_entity.dart';

class CustomDrawerHeaderDetails extends StatelessWidget {
  const CustomDrawerHeaderDetails({super.key, required this.profileEntity});
  final ProfileEntity profileEntity;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Row(
      children: [
        profileEntity.profileImage!.isNotEmpty
            ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                profileEntity.profileImage ?? AppAssets.kNullProfileImage,
                height: mediaQuery.height * 0.0853,
                width: mediaQuery.width * 0.0178,
                fit: BoxFit.fill,
              ),
            )
            : ClipRRect(
              borderRadius: BorderRadius.circular(100),

              child: Image.asset(
                AppAssets.kNullProfileImage,
                height: mediaQuery.height * 0.0853,
                width: mediaQuery.width * 0.0178,
                fit: BoxFit.fill,
              ),
            ),
        SizedBox(width: mediaQuery.width * 0.0585),
        SizedBox(
          width: mediaQuery.width * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                profileEntity.name ?? 'No Nmae Set',
                style: AppStyles.styleLeagueSpartanBold20(
                  context,
                ).copyWith(color: AppColor.kCultured, fontSize: 18),
              ),
              Text(
                profileEntity.email ?? 'No Email Set',
                maxLines: 2,
                style: AppStyles.styleLeagueSpartanMediem14(
                  context,
                ).copyWith(color: AppColor.kCultured),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
