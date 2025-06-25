import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_drawer.dart';

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

class NotificationDrawerHeader extends StatelessWidget {
  const NotificationDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.kNotificationDrawerIcon,
              width: 22,
              height: 31,
            ),
            const SizedBox(width: 20),
            Text(
              'Notifications',
              style: AppStyles.styleLeagueSpartanBold24(
                context,
              ).copyWith(color: AppColor.kCultured),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.048),

        const Divider(thickness: 1, color: AppColor.kCultured),
      ],
    );
  }
}

class NotificationsDrawerItem extends StatelessWidget {
  const NotificationsDrawerItem({
    super.key,
    required this.icon,
    required this.title,
  });
  final String icon, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
        Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 20),
            Flexible(
              child: Text(
                title,
                style: AppStyles.styleLeagueSpartanMediem16(
                  context,
                ).copyWith(color: AppColor.kCultured),
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
        const Divider(thickness: 1, color: AppColor.kCultured),
      ],
    );
  }
}
