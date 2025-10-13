import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/service/stripe_service.dart';
import 'package:yumquick/feactures/My%20orders/entity/active_order_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/fetch_profile_info_cubit/fetch_profile_info_cubit.dart';

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
              'payment_intent_id': item.paymentIntentId,
            };
          }).toList();

      await supabase.from('active_orders').insert(data);
      await fetchActiveOrders();
    } catch (e) {
      emit(ActiveOrdersFailure("Bulk insert failed: ${e.toString()}"));
    }
  }

  Future<void> deleteAndCancelOrder(
    ActiveOrderEntity activeOrder,
    FetchProfileInfoSuccess userProfileState,
  ) async {
    emit(ActiveOrdersLoading());
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser?.id;
    final stripeService = StripeService();

    try {
      // Refund the payment
      await stripeService.refundPayment(activeOrder.paymentIntentId);

      // Add to cancelled_orders
      await supabase.from('cancelled_orders').insert({
        'user_id': userId,
        'product_id': activeOrder.product.id,
        'quantity': activeOrder.quantity,
        'total_amount': activeOrder.totalAmount,
        'customer_name': userProfileState.profile.name ?? '',
        'customer_address': userProfileState.profile.address ?? '',
      });

      // Delete from active_orders using row id
      await supabase.from('active_orders').delete().eq('id', activeOrder.id!);

      await fetchActiveOrders();
    } catch (e) {
      emit(ActiveOrdersFailure("Cancel order failed: ${e.toString()}"));
    }
  }

  // Future<void> deleteActiveOrder(
  //   String orderId,
  //   ActiveOrderEntity order,
  // ) async {
  //   emit(ActiveOrdersLoading());
  //   try {
  //     final stripeService = StripeService();
  //     await stripeService.refundPayment(order.paymentIntentId);
  //     await supabase.from('active_orders').delete().eq('id', orderId);

  //     await fetchActiveOrders();
  //   } catch (e) {
  //     emit(ActiveOrdersFailure("Delete failed: ${e.toString()}"));
  //   }
  // }
}
