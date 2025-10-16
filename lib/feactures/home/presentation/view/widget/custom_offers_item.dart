import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class CustomOffersItem extends StatelessWidget {
  const CustomOffersItem({super.key, required this.productEntity});
  final ProductsEntity productEntity;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Container(
          width: mediaQuery.width * 0.4,
          height: mediaQuery.height * 0.152,
          decoration: const BoxDecoration(
            color: AppColor.kMainColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                productEntity.name,
                textAlign: TextAlign.center,
                style: AppStyles.styleLeagueSpartanregular16(
                  context,
                ).copyWith(color: AppColor.kCultured),
              ),
              Text(
                '${(100 - ((productEntity.priceAfterDiscount! / productEntity.price) * 100)).toStringAsFixed(0)}% OFF',

                textAlign: TextAlign.center,
                style: AppStyles.styleLeagueSpartanBold32(context),
              ),
            ],
          ),
        ),
        Container(
          width: mediaQuery.width * 0.4,
          height: mediaQuery.height * 0.152,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: DecorationImage(
              image: NetworkImage(productEntity.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
