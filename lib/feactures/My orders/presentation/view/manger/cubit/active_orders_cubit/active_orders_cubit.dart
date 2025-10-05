import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/home/entity/active_order_entity.dart';

part 'active_orders_state.dart';

class ActiveOrdersCubit extends Cubit<ActiveOrdersState> {
  ActiveOrdersCubit() : super(ActiveOrdersInitial());

  final supabase = Supabase.instance.client;
  String? get userId => supabase.auth.currentUser?.id;
  Future<void> fetchActiveOrders() async {
    emit(ActiveOrdersLoading());

    try {
      final response = await supabase
          .from('active_orders')
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
              .map((json) => ActiveOrderEntity.fromJson(json))
              .toList();
      if (orders.isEmpty) {
        emit(ActiveOrdersEmpty());
      } else {
        emit(ActiveOrdersSuccess(orders));
      }
    } catch (e) {
      emit(ActiveOrdersFailure(e.toString()));
    }
  }

  Future<void> insertCartOrders(List<ActiveOrderEntity> cartItems) async {
    try {
      final data =
          cartItems.map((item) {
            return {
              'user_id': supabase.auth.currentUser?.id,
              'product_id': item.product.id,
              'quantity': item.quantity,
              'total_amount': item.totalAmount,
              'customer_name': item.customerName,
              'customer_address': item.customerAddress,
            };
          }).toList();

      await supabase.from('active_orders').insert(data);

      await fetchActiveOrders();
    } catch (e) {
      emit(ActiveOrdersFailure("Bulk insert failed: ${e.toString()}"));
    }
  }

  Future<void> deleteActiveOrder(String orderId) async {
    emit(ActiveOrdersLoading());
    try {
      await supabase.from('active_orders').delete().eq('id', orderId);

      await fetchActiveOrders();
    } catch (e) {
      emit(ActiveOrdersFailure("Delete failed: ${e.toString()}"));
    }
  }
}
