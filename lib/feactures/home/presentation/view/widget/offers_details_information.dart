import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';

class OffersDetailsInformation extends StatelessWidget {
  const OffersDetailsInformation({super.key, required this.offersEntity});
  final OffersEntity offersEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          offersEntity.name,
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        Text(
          offersEntity.description,
          style: AppStyles.styleLeagueSpartanLight16(context),
        ),
      ],
    );
  }
}
