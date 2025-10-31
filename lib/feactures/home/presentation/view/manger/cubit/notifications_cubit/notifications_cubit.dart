import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:yumquick/core/service/fetch_notification_service.dart';
import 'package:yumquick/feactures/home/entity/notification_entity.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());
  final FetchNotificationService fetchNotificationService =
      FetchNotificationService();
  Future<void> fetchNotifications() async {
    emit(NotificationsLoading());
    try {
      final notifications = await fetchNotificationService.fetchOnTrackOrders();
      if (notifications.isEmpty) {
        emit(NotificationsEmpty());
      } else {
        emit(NotificationsSuccess(notifications: notifications));
      }
    } catch (e) {
      emit(NotificationsFailure(errorMessage: e.toString()));
    }
  }
}
