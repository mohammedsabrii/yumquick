part of 'cancelled_orders_cubit.dart';

@immutable
abstract class CancelledOrdersState {}

class CanclledOrdersInitial extends CancelledOrdersState {}

class CanclledOrdersLoading extends CancelledOrdersState {}

class CanclledOrdersSuccess extends CancelledOrdersState {
  final List<OrdersEntity> cancelledOrders;

  CanclledOrdersSuccess({required this.cancelledOrders});
}

class CanclledOrdersEmpty extends CancelledOrdersState {}

class CanclledOrdersFailure extends CancelledOrdersState {
  final String errorMessage;
  CanclledOrdersFailure(this.errorMessage);
}
