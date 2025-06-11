import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: AnimatedContainer(
        height: 4,
        width: 20,
        duration: const Duration(milliseconds: 600),
        decoration: BoxDecoration(
          color: isActive ? AppColor.kMainColor : AppColor.kYellow,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
