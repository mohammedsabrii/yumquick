import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class ProdactDetailsImage extends StatelessWidget {
  const ProdactDetailsImage({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;
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
              image: NetworkImage(productsEntity.image),
              fit: BoxFit.fill,
            ),
          ),
        ),

        productsEntity.priceAfterDiscount != null
            ? Stack(
              children: [
                Positioned(
                  top: mediaQuery.height * -0.02699,
                  right: mediaQuery.width * -0.0585,
                  child: SvgPicture.asset(AppAssets.kOffarStar),
                ),
                Positioned(
                  top: 0,
                  right: -9,
                  child: Text(
                    '${(productsEntity.priceAfterDiscount! / productsEntity.price) * 100 - 100}%',
                    textAlign: TextAlign.center,
                    style: AppStyles.styleLeagueSpartanBold20(
                      context,
                    ).copyWith(color: AppColor.kCultured),
                  ),
                ),
              ],
            )
            : const SizedBox(),
      ],
    );
  }
}
