import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/widget/custom_circle_widget.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_offers_item.dart';

class CustomOffersWidget extends StatelessWidget {
  const CustomOffersWidget({super.key, required this.productEntity});
  final ProductsEntity productEntity;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.kOfferDetailsView, extra: productEntity);
      },
      child: Stack(
        children: [
          CustomOffersItem(productEntity: productEntity),
          Positioned(
            top: -mediaQuery.height * 0.04268,
            left: mediaQuery.width * 0.29,
            child: const CustomCircleWidget(),
          ),
          Positioned(
            left: -mediaQuery.height * 0.0335,
            bottom: -mediaQuery.height * 0.0335,
            child: const CustomCircleWidget(),
          ),
        ],
      ),
    );
  }
}
