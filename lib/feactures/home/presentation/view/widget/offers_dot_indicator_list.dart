import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_dot_indicator.dart';
import 'package:yumquick/feactures/home/presentation/view/data/offers_list.dart';

class OffersDotIndicatorList extends StatelessWidget {
  const OffersDotIndicatorList({super.key, required this.cruntPageIndex});
  final int cruntPageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: List.generate(
        offersList.length,
        (index) => CustomDotIndicator(isActive: index == cruntPageIndex),
      ),
    );
  }
}
