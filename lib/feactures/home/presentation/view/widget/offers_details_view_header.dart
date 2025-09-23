import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/rate_widget.dart';
import 'package:yumquick/feactures/home/entity/offer_entity.dart';

class OffersDetailsViewHeader extends StatelessWidget {
  const OffersDetailsViewHeader({super.key, required this.offersEntity});
  final OffersEntity offersEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.089,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.0551),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: SvgPicture.asset(AppAssets.kBackIcon),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  offersEntity.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleLeagueSpartanMediem20(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.0356),
              SvgPicture.asset(AppAssets.kFavoritesIconUnActive),
            ],
          ),
          const RateWidget(),
        ],
      ),
    );
  }
}
