import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';

class CustomOffersItem extends StatelessWidget {
  const CustomOffersItem({super.key, required this.offerEntity});
  final OffersEntity offerEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.4,
          height: MediaQuery.sizeOf(context).height * 0.152,
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
                offerEntity.offerName,
                textAlign: TextAlign.center,
                style: AppStyles.styleLeagueSpartanregular16(
                  context,
                ).copyWith(color: AppColor.kCultured),
              ),
              Text(
                '${(100 - ((offerEntity.priceAfterDiscount / offerEntity.price) * 100)).toStringAsFixed(0)}% OFF',

                textAlign: TextAlign.center,
                style: AppStyles.styleLeagueSpartanBold32(context),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.4,
          height: MediaQuery.sizeOf(context).height * 0.152,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: DecorationImage(
              image: NetworkImage(offerEntity.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
