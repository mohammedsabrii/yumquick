import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/colors.dart';

class CategoryContiner extends StatelessWidget {
  const CategoryContiner({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.865,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: AppColor.kMainColor,
        ),
        child: child,
      ),
    );
  }
}
