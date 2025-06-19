import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_drawer_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_drawer_item.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_logout_widget.dart';

class DrawerDetails extends StatelessWidget {
  const DrawerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDrawerHeader(),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0550),
        CustomDrawerItem(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMyOrders);
          },
          title: 'My Orders',
          icon: AppAssets.kMyOrderDrawer,
        ),
        CustomDrawerItem(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMyProfileView);
          },
          title: 'My Profile',
          icon: AppAssets.kUserDrawrIcon,
        ),
        CustomDrawerItem(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kDeliveryAddress);
          },
          title: 'Delivery Address',
          icon: AppAssets.kDeliveryAdress,
        ),
        const CustomDrawerItem(
          title: 'Payment Methods',
          icon: AppAssets.kPaymentMethodsDrawer,
        ),
        const CustomDrawerItem(title: 'Contact Us', icon: AppAssets.kContactUs),
        const CustomDrawerItem(
          title: 'Help & FAQs',
          icon: AppAssets.kHelpDrowerIcon,
        ),
        const CustomDrawerItem(
          title: 'Settings',
          icon: AppAssets.kSettingsIcon,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0585),
        const CustomLogoutWidget(),
      ],
    );
  }
}
