import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/drawer_details.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(100),
        bottomLeft: Radius.circular(100),
      ),
      child: Drawer(
        backgroundColor: AppColor.kMainColor,
        width: MediaQuery.sizeOf(context).width * 0.839,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height * 0.0766,
            left: MediaQuery.sizeOf(context).width * 0.0839,
            right: MediaQuery.sizeOf(context).width * 0.0839,
          ),
          child: const DrawerDetails(),
        ),
      ),
    );
  }
}
