import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:yumquick/core/service/fetch_on_track_orders_service.dart';
import 'package:yumquick/feactures/My%20orders/entity/order_entity.dart';

part 'on_track_orders_state.dart';

class OnTrackOrdersCubit extends Cubit<OnTrackOrdersState> {
  OnTrackOrdersCubit() : super(OnTrackOrdersInitial());
  final FetchOnTrackOrdersService fetchOnTrackOrdersService =
      FetchOnTrackOrdersService();
  Future<void> fetchOnTrackOrders() async {
    emit(OnTrackOrdersLoading());
    try {
      final onTrakOrders = await fetchOnTrackOrdersService.fetchOnTrackOrders();
      if (onTrakOrders.isEmpty) {
        emit(OnTrackOrdersEmpty());
      } else {
        emit(OnTrackOrdersSuccess(onTrakOrders: onTrakOrders));
      }
    } catch (e) {
      emit(OnTrackOrdersFailure(errorMessage: e.toString()));
    }
  }
}
