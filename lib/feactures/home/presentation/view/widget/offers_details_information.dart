import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class OffersDetailsInformation extends StatelessWidget {
  const OffersDetailsInformation({super.key, required this.productEntity});
  final ProductsEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productEntity.name,
          style: AppStyles.styleLeagueSpartanMediem20(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        Text(
          productEntity.description,
          style: AppStyles.styleLeagueSpartanLight16(context),
        ),
      ],
    );
  }
}
