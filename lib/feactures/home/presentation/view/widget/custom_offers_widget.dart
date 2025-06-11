import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_circle_widget.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/offers_model.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_offers_item.dart';

class CustomOffersWidget extends StatelessWidget {
  const CustomOffersWidget({super.key, required this.model});
  final OffersModel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomOffersItem(
          image: model.image,
          offer: model.offer,
          title: model.title,
        ),
        Positioned(
          top: -35,
          left: MediaQuery.sizeOf(context).width * 0.29,
          child: const CustomCircleWidget(),
        ),
        const Positioned(
          left: -27.5,
          bottom: -27.5,
          child: CustomCircleWidget(),
        ),
      ],
    );
  }
}
