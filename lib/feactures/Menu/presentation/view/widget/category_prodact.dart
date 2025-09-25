import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/favorite_widget.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class CategoryProdact extends StatelessWidget {
  const CategoryProdact({super.key, required this.prodactsEntity});
  final ProductsEntity prodactsEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).push(AppRouter.kProdactDetailsView, extra: prodactsEntity);
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
                    image: NetworkImage(prodactsEntity.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    prodactsEntity.name,
                    style: AppStyles.styleLeagueSpartanSemiBold18(context),
                  ),
                  const Spacer(),
                  Text(
                    '\$${prodactsEntity.price}',
                    style: AppStyles.styleLeagueSpartanregular18(
                      context,
                    ).copyWith(color: AppColor.kMainColor),
                  ),
                ],
              ),
              Text(
                prodactsEntity.description,
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
          child: FavoriteWidget(productsEntity: prodactsEntity),
        ),
      ],
    );
  }
}
