import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/favorite_widget.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class ProdactDetailsViewHeader extends StatelessWidget {
  const ProdactDetailsViewHeader({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.089),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: mediaQuery.height * 0.0551),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: SvgPicture.asset(
                  AppAssets.kBackIcon,
                  height: mediaQuery.height * 0.0304,
                  width: mediaQuery.width * 0.0508,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  productsEntity.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleLeagueSpartanMediem20(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
              ),
              SizedBox(width: mediaQuery.width * 0.0356),
              FavoriteWidget(productsEntity: productsEntity),
            ],
          ),
        ],
      ),
    );
  }
}
