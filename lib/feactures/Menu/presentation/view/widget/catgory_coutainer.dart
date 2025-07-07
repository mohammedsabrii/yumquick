import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/colors.dart';

class CatgoryContiner extends StatelessWidget {
  const CatgoryContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.865,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: AppColor.kMainColor,
      ),
    );
  }
}
