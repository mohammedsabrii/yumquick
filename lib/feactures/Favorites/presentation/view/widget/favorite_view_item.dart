import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/favorite_widget.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class FavoriteViewItem extends StatelessWidget {
  const FavoriteViewItem({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).push(AppRouter.kProdactDetailsView, extra: productsEntity);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  image: DecorationImage(
                    image: NetworkImage(productsEntity.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    productsEntity.name,
                    style: AppStyles.styleLeagueSpartanSemiBold18(context),
                  ),
                  const Spacer(),
                  Text(
                    '\$${productsEntity.price}',
                    style: AppStyles.styleLeagueSpartanregular18(
                      context,
                    ).copyWith(color: AppColor.kMainColor),
                  ),
                ],
              ),
              Text(
                productsEntity.description,
                style: AppStyles.styleLeagueSpartanLight12(context),
              ),
              const Divider(thickness: 2, color: AppColor.kPinkishOrange),
              const SizedBox(height: 24),
            ],
          ),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: FavoriteWidget(productsEntity: productsEntity),
        ),
      ],
    );
  }
}
