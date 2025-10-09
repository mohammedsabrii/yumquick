import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/My%20orders/entity/cancelled_orders_entity.dart';

class CancelledOrdersService {
  final supabase = Supabase.instance.client;
  Future<List<CancelledOrdersEntity>> fetchCancelledOrders() async {
    final userId = supabase.auth.currentUser?.id;

    final response = await supabase
        .from('cancelled_orders')
        .select('''
            quantity,
            total_amount,
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
        (response as List)
            .map((json) => CancelledOrdersEntity.fromJson(json))
            .toList();
    return orders;
  }

  Future<void> addToCancelledOrders(
    CancelledOrdersEntity product,
    String customerName,
    String customerAddress,
  ) async {
    final userId = supabase.auth.currentUser?.id;

    await supabase.from('cancelled_orders').insert({
      'user_id': userId,
      'product_id': product.product.id,
      'quantity': product.quantity,
      'total_amount': product.totalAmount,
      'customer_name': customerName,
      'customer_address': customerAddress,
    });
  }
}
