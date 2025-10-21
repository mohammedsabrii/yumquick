import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';

class FetchOnTrackOrdersService {
  final supabase = Supabase.instance.client;
  Future<List<OrdersEntity>> fetchOnTrackOrders() async {
    final userId = supabase.auth.currentUser?.id;
    final response = await supabase
        .from('on_track_orders')
        .select('''
      id,
      user_id,               
      quantity,
      total_amount,
      customer_name,
      customer_address,
      products (
        id,
        category_id,
        name,
        subtitle,
        image,
        price,
        categories,
        price_after_discount
      )
    ''')
        .eq('user_id', userId!);

    final orders =
        (response as List).map((json) => OrdersEntity.fromJson(json)).toList();
    return orders;
  }
}
