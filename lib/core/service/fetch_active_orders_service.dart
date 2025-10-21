import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';

class FetchActiveOrdersService {
  final supabase = Supabase.instance.client;
  Future<List<OrdersEntity>> fetchActiveOrders() async {
    final userId = supabase.auth.currentUser?.id;
    final response = await supabase
        .from('active_orders')
        .select('''
      id,               
      quantity,
      total_amount,
      payment_intent_id,
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
