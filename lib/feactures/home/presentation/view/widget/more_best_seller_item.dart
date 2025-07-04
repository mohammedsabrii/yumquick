import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/rate_widget.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/more_best_seller_item_image.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/more_best_seller_item_name_and_suptitle.dart';

class MoreBestSellerItem extends StatelessWidget {
  const MoreBestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 7),
      width: MediaQuery.sizeOf(context).width * 0.402,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kProdactDetailsView);
          },
          child: Stack(
            children: [
              Column(
                children: [
                  const MoreBestSellerItemImage(),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.0152),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: Stack(
                      children: [
                        MoreBestSelleritemNameAndSupTitle(),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: RateWidget(
                              color: AppColor.kMainColor,
                              textColor: AppColor.kCultured,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 12,
                left: 15,
                child: SvgPicture.asset(AppAssets.kVeganCatgoryIcon),
              ),
              Positioned(
                top: 12,
                right: 15,
                child: SvgPicture.asset(AppAssets.kFavoritesIconActive),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
