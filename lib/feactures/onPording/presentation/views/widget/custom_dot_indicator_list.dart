import 'package:flutter/widgets.dart';
import 'package:yumquick/core/widget/custom_dot_indicator.dart';
import 'package:yumquick/feactures/onPording/data/onpording_list.dart';

class CustomDotIdctorList extends StatelessWidget {
  const CustomDotIdctorList({super.key, required this.cruntPageIndex});
  final int cruntPageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(onpordingList.length, (index) {
        return CustomDotIndicator(isActive: index == cruntPageIndex);
      }),
    );
  }
}
