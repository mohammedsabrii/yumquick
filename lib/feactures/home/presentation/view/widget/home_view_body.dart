import 'package:flutter/material.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/home_view_details.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/home_view_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.onOpenCartDrawer,
    required this.onOpenNotificationDrawer,
    required this.onOpenUserDrawer,
  });
  final VoidCallback onOpenCartDrawer;
  final VoidCallback onOpenNotificationDrawer;
  final VoidCallback onOpenUserDrawer;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: mediaQuery.height * 0.037),
        HomeViewHeader(
          onOpenCartDrawer: onOpenCartDrawer,
          onOpenNotificationDrawer: onOpenNotificationDrawer,
          onOpenUserDrawer: onOpenUserDrawer,
        ),

        SizedBox(height: mediaQuery.height * 0.034),
        const HomeViewDetiles(),
      ],
    );
  }
}
