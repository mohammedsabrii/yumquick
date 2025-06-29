import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
        HomeViewHeader(
          onOpenCartDrawer: onOpenCartDrawer,
          onOpenNotificationDrawer: onOpenNotificationDrawer,
          onOpenUserDrawer: onOpenUserDrawer,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.018),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.089,
          ),
          child: Text(
            'Good Morning',
            style: AppStyles.styleLeagueSpartanBold30(context),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.034),
        const HomeViewDetiles(),
      ],
    );
  }
}
