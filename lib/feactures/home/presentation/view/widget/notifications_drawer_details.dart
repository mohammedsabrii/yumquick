import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_drawer.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/notification_drawer_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/notification_drawer_item.dart';

class NotificationDrawerDetails extends StatelessWidget {
  const NotificationDrawerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
          const NotificationDrawerHeader(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
          const NotificationsDrawerItem(
            icon: AppAssets.kProdactYoyMightBeLike,
            title: 'We have added a product you might like.',
          ),
          const NotificationsDrawerItem(
            icon: AppAssets.kNotificationFavoriteIcon,
            title: 'One of your favorite is on promotion.',
          ),
          const NotificationsDrawerItem(
            icon: AppAssets.kOrderDeliveredIcon,
            title: 'Your order has been delivered',
          ),
          const NotificationsDrawerItem(
            icon: AppAssets.kDeliveryManIcon,
            title: 'The delivery is on his way',
          ),
        ],
      ),
    );
  }
}
