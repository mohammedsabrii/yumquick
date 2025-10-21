import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/service/cancelled_orders_service.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';

part 'cancelled_orders_state.dart';

class CancelledOrdersCubit extends Cubit<CancelledOrdersState> {
  CancelledOrdersCubit() : super(CanclledOrdersInitial());
  final cancelledOrdersService = CancelledOrdersService();
  Future<void> fetchCancelledOrders() async {
    emit(CanclledOrdersLoading());
    try {
      final cancelledOrders =
          await cancelledOrdersService.fetchCancelledOrders();
      if (cancelledOrders.isEmpty) {
        emit(CanclledOrdersEmpty());
      } else {
        emit(CanclledOrdersSuccess(cancelledOrders: cancelledOrders));
      }
    } catch (e) {
      emit(CanclledOrdersFailure(e.toString()));
    }
  }

  Future<void> addToCancelledOrders(
    OrdersEntity product,
    String customerName,
    String customerAddress,
  ) async {
    emit(CanclledOrdersLoading());
    try {
      await cancelledOrdersService.addToCancelledOrders(
        product,
        customerName,
        customerAddress,
      );
      final cancelledOrders =
          await cancelledOrdersService.fetchCancelledOrders();
      emit(CanclledOrdersSuccess(cancelledOrders: cancelledOrders));
    } catch (e) {
      emit(CanclledOrdersFailure(e.toString()));
    }
  }
}
