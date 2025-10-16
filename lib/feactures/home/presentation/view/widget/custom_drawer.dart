import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(100),
        bottomLeft: Radius.circular(100),
      ),
      child: Drawer(
        backgroundColor: AppColor.kMainColor,
        width: mediaQuery.width * 0.839,
        child: Padding(
          padding: EdgeInsets.only(
            top: mediaQuery.height * 0.0766,
            left: mediaQuery.width * 0.0839,
            right: mediaQuery.width * 0.0839,
          ),
          child: child,
        ),
      ),
    );
  }
}
