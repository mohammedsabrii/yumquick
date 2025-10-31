import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/home/entity/notification_entity.dart';

class FetchNotificationService {
  final supabase = Supabase.instance.client;
  Future<List<NotificationsEntity>> fetchOnTrackOrders() async {
    final userId = supabase.auth.currentUser?.id;
    final response = await supabase
        .from('notifications')
        .select()
        .eq('user_id', userId!);

    final orders =
        (response as List)
            .map((json) => NotificationsEntity.fromJson(json))
            .toList();
    return orders;
  }
}
