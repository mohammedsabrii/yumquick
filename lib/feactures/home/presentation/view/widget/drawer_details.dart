import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_router.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_drawer_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_drawer_item.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_logout_widget.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_drawer.dart';

class DrawerDetails extends StatelessWidget {
  const DrawerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return CustomDrawer(
      child: Column(
        children: [
          const CustomDrawerHeader(),
          SizedBox(height: mediaQuery.height * 0.0550),
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
          CustomDrawerItem(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kPaymentMethods);
            },
            title: 'Payment Methods',
            icon: AppAssets.kPaymentMethodsDrawer,
          ),
          CustomDrawerItem(
            onTap: () => GoRouter.of(context).push(AppRouter.kContactUs),
            title: 'Contact Us',
            icon: AppAssets.kContactUs,
          ),
          CustomDrawerItem(
            onTap: () => GoRouter.of(context).push(AppRouter.kSettings),
            title: 'Settings',
            icon: AppAssets.kSettingsIcon,
          ),
          SizedBox(height: mediaQuery.height * 0.0585),
          const CustomLogoutWidget(),
        ],
      ),
    );
  }
}
