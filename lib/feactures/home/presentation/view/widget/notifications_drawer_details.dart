import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/home/entity/notification_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/notification_drawer_header.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/notification_drawer_item.dart';

class NotificationDrawerDetails extends StatelessWidget {
  const NotificationDrawerDetails({super.key, required this.notifications});
  final List<NotificationsEntity> notifications;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return Column(
      children: [
        SizedBox(height: mediaQuery.height * 0.05),
        const NotificationDrawerHeader(),
        SizedBox(height: mediaQuery.height * 0.015),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationsDrawerItem(
              icon:
                  notifications[index].title == 'Your order has been delivered!'
                      ? AppAssets.kOrderDeliveredIcon
                      : notifications[index].title == 'Your order is on the way'
                      ? AppAssets.kDeliveryManIcon
                      : AppAssets.kProdactYoyMightBeLike,

              title: notifications[index].title,
            );
          },
        ),
      ],
    );
  }
}
