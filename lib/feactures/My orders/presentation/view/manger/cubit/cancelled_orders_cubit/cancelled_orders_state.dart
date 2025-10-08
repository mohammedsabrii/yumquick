part of 'cancelled_orders_cubit.dart';

@immutable
abstract class CancelledOrdersState {}

class CanclledOrdersInitial extends CancelledOrdersState {}

class CanclledOrdersLoading extends CancelledOrdersState {}

class CanclledOrdersSuccess extends CancelledOrdersState {
  final List<CancelledOrdersEntity> orders;
  CanclledOrdersSuccess(this.orders);
}

class CanclledOrdersFailure extends CancelledOrdersState {
  final String errorMessage;
  CanclledOrdersFailure(this.errorMessage);
}
