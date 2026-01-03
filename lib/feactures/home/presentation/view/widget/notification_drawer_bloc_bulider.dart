import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/notifications_cubit/notifications_cubit.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_drawer.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/empty_notifications.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/notifications_drawer_details.dart';

class NotificationDrawerBlocBulider extends StatelessWidget {
  const NotificationDrawerBlocBulider({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      child: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          if (state is NotificationsEmpty) {
            return const EmptyNotifications();
          } else if (state is NotificationsSuccess) {
            return NotificationDrawerDetails(
              notifications: state.notifications,
            );
          } else if (state is NotificationsFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppStyles.styleLeagueSpartanMediem16(
                  context,
                ).copyWith(color: AppColor.kCultured),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: AppColor.kCultured),
            );
          }
        },
      ),
    );
  }
}
