import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/rate_widget.dart';
import 'package:yumquick/feactures/Menu/presentation/view/manger/catgory_item_model.dart';

class CategoryProdact extends StatelessWidget {
  const CategoryProdact({super.key, required this.categoryItemModel});
  final CategoryItemModel categoryItemModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kProdactDetailsView);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.204,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              image: DecorationImage(
                image: AssetImage(categoryItemModel.image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                categoryItemModel.title,
                style: AppStyles.styleLeagueSpartanSemiBold18(context),
              ),
              const SizedBox(width: 24),
              const RateWidget(
                color: AppColor.kMainColor,
                textColor: AppColor.kCultured,
              ),
              const Spacer(),
              Text(
                '\$${categoryItemModel.price}',
                style: AppStyles.styleLeagueSpartanregular18(
                  context,
                ).copyWith(color: AppColor.kMainColor),
              ),
            ],
          ),
          Text(
            categoryItemModel.subTitle,
            style: AppStyles.styleLeagueSpartanLight12(context),
          ),
          const Divider(thickness: 2, color: AppColor.kPinkishOrange),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
