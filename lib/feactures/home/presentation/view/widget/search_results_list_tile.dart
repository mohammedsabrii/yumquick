import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class SearchResultsListTile extends StatelessWidget {
  const SearchResultsListTile({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.kProdactDetailsView, extra: productsEntity);
      },
      leading: Container(
        width: MediaQuery.sizeOf(context).width * 0.096,
        height: MediaQuery.sizeOf(context).height * 0.048,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(productsEntity.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        productsEntity.name,
        style: AppStyles.styleLeagueSpartanMediem14(
          context,
        ).copyWith(color: AppColor.kDarkRed),
      ),
      trailing: Text(
        "\$${productsEntity.price}",
        style: AppStyles.styleLeagueSpartanMediem14(
          context,
        ).copyWith(color: AppColor.kMainColor),
      ),
    );
  }
}
