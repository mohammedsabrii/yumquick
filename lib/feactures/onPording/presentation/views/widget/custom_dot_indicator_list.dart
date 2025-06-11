import 'package:flutter/widgets.dart';
import 'package:yumquick/feactures/home/presentation/view/data/offers_list.dart';
import 'package:yumquick/core/widget/custom_dot_indicator.dart';

class CustomDotIdctorList extends StatelessWidget {
  const CustomDotIdctorList({super.key, required this.cruntPageIndex});
  final int cruntPageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(offersList.length, (index) {
        return CustomDotIndicator(isActive: index == cruntPageIndex);
      }),
    );
  }
}
