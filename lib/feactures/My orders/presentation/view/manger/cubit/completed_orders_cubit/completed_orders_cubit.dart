import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:yumquick/core/service/fetch_completed_orders_service.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';

part 'completed_orders_state.dart';

class CompletedOrdersCubit extends Cubit<CompletedOrdersState> {
  CompletedOrdersCubit() : super(CompletedOrdersInitial());
  final FetchCompletedOrdersService fetchCompletedOrdersService =
      FetchCompletedOrdersService();
  Future<void> fetchCompletedOrders() async {
    emit(CompletedOrdersLoading());
    try {
      final completedOrders =
          await fetchCompletedOrdersService.fetchCompletedOrders();
      if (completedOrders.isEmpty) {
        emit(CompletedOrdersEmpty());
      } else {
        emit(CompletedOrdersSuccess(completedOrders: completedOrders));
      }
    } catch (e) {
      emit(CompletedOrdersFailure(errorMessage: e.toString()));
    }
  }
}
