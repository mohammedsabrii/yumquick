import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Favorites/presentation/view/widget/favorite_item_image.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class FavoriteViewItem extends StatelessWidget {
  final ProductsEntity productsEntity;

  const FavoriteViewItem({super.key, required this.productsEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.kProdactDetailsView, extra: productsEntity);
      },
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                productsEntity.image,
                height: MediaQuery.sizeOf(context).height * 0.15,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.error, size: 50),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              productsEntity.name,
              textAlign: TextAlign.center,
              style: AppStyles.styleLeagueSpartanMediem16(
                context,
              ).copyWith(color: AppColor.kMainColor),
            ),
            Text(
              productsEntity.description ?? 'No description available',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppStyles.styleLeagueSpartanLight12(context),
            ),
          ],
        ),
      ),
    );
  }
}
