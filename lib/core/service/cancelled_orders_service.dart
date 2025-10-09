import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/My%20orders/entity/cancelled_orders_entity.dart';

class CancelledOrdersService {
  final supabase = Supabase.instance.client;
  Future<List<CancelledOrdersEntity>> fetchCancelledOrders() async {
    String? userId = supabase.auth.currentUser?.id;
    final response = await supabase
        .from('cancelled_orders')
        .select(''' active_orders (
            quantity,
            total_amount, 
            customer_name,
            customer_address,
             ) ,
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
    return (response as List)
        .map((e) => CancelledOrdersEntity.fromJson(e))
        .toList();
  }

  Future<void> addToCancelledOrders(
    CancelledOrdersEntity product,
    String customerName,
    String customerAddress,
  ) async {
    final userId = supabase.auth.currentUser?.id;

    await supabase.from('cancelled_orders').insert({
      'user_id': userId,
      'product_id': product.product.product.id,
      'quantity': product.product.quantity,
      'total_amount': product.product.totalAmount,
      'customer_name': customerName,
      'customer_address': customerAddress,
    });
  }
}
