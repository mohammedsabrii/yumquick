import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class OffersDetailsImage extends StatelessWidget {
  const OffersDetailsImage({super.key, required this.productEntity});
  final ProductsEntity productEntity;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: mediaQuery.height * 0.27,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(productEntity.image),
              fit: BoxFit.fill,
            ),
          ),
        ),

        productEntity.priceAfterDiscount != null
            ? Positioned(
              top: mediaQuery.height * -0.02699,
              right: mediaQuery.width * -0.0585,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(AppAssets.kOffarStar),
                  Positioned(
                    top: mediaQuery.height * 0.0243,
                    right: mediaQuery.width * 0.0305,
                    child: Text(
                      '${((productEntity.priceAfterDiscount! / productEntity.price) * 100 - 100).toStringAsFixed(0)}%',
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
