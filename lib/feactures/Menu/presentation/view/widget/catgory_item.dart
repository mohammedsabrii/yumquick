import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/rate_widget.dart';
import 'package:yumquick/feactures/Menu/presentation/view/manger/catgory_item_model.dart';

class CatgoryItem extends StatelessWidget {
  const CatgoryItem({super.key, required this.catgoryItemModel});
  final CatgoryItemModel catgoryItemModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.204,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            image: DecorationImage(
              image: AssetImage(catgoryItemModel.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              catgoryItemModel.title,
              style: AppStyles.styleLeagueSpartanSemiBold18(context),
            ),
            const SizedBox(width: 24),
            const RateWidget(
              color: AppColor.kMainColor,
              textColor: AppColor.kCultured,
            ),
            const Spacer(),
            Text(
              '\$${catgoryItemModel.price}',
              style: AppStyles.styleLeagueSpartanregular18(
                context,
              ).copyWith(color: AppColor.kMainColor),
            ),
          ],
        ),
        Text(
          catgoryItemModel.subTitle,
          style: AppStyles.styleLeagueSpartanLight12(context),
        ),
        const Divider(thickness: 2, color: AppColor.kPinkishOrange),
        const SizedBox(height: 24),
      ],
    );
  }
}
