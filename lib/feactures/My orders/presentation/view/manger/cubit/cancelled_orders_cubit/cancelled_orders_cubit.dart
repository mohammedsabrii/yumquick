import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/service/cancelled_orders_service.dart';
import 'package:yumquick/feactures/My%20orders/entity/cancelled_orders_entity.dart';

part 'cancelled_orders_state.dart';

class CanclledOrdersCubit extends Cubit<CancelledOrdersState> {
  CanclledOrdersCubit() : super(CanclledOrdersInitial());
  final cancelledOrdersService = CancelledOrdersService();
  Future<void> fetchCancelledOrders() async {
    emit(CanclledOrdersLoading());
    try {
      final orders = await cancelledOrdersService.fetchCancelledOrders();
      emit(CanclledOrdersSuccess(orders));
    } catch (e) {
      emit(CanclledOrdersFailure(e.toString()));
    }
  }

  Future<void> addToCancelledOrders(CancelledOrdersEntity product) async {
    emit(CanclledOrdersLoading());
    try {
      await cancelledOrdersService.addToCancelledOrders(product);
      final cancelledOrders =
          await cancelledOrdersService.fetchCancelledOrders();
      emit(CanclledOrdersSuccess(cancelledOrders));
    } catch (e) {
      emit(CanclledOrdersFailure(e.toString()));
    }
  }
}
