import 'package:flutter/widgets.dart';
import 'package:yumquick/feactures/onPording/presentation/views/data/onpording_list.dart';
import 'package:yumquick/feactures/onPording/presentation/views/widget/custom_dot_indicator.dart';

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
