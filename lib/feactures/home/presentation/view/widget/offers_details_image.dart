import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';

class OffersDetailsImage extends StatelessWidget {
  const OffersDetailsImage({super.key, required this.offersEntity});
  final OffersEntity offersEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.27,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(offersEntity.image),
              fit: BoxFit.fill,
            ),
          ),
        ),

        offersEntity.priceAfterDiscount != 0.0
            ? Positioned(
              top: MediaQuery.sizeOf(context).height * -0.02699,
              right: MediaQuery.sizeOf(context).width * -0.0585,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(AppAssets.kOffarStar),
                  Positioned(
                    top: 20,
                    right: 12,
                    child: Text(
                      '${((offersEntity.priceAfterDiscount / offersEntity.price) * 100 - 100).toStringAsFixed(0)}%',
                      textAlign: TextAlign.center,
                      style: AppStyles.styleLeagueSpartanBold20(
                        context,
                      ).copyWith(color: AppColor.kCultured),
                    ),
                  ),
                ],
              ),
            )
            : const SizedBox(),
      ],
    );
  }
}
