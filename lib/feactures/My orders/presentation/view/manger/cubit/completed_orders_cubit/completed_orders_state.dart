part of 'completed_orders_cubit.dart';

@immutable
sealed class CompletedOrdersState {}

final class CompletedOrdersInitial extends CompletedOrdersState {}

final class CompletedOrdersSuccess extends CompletedOrdersState {
  final List<OrdersEntity> completedOrders;

  CompletedOrdersSuccess({required this.completedOrders});
}

final class CompletedOrdersLoading extends CompletedOrdersState {}

final class CompletedOrdersFailure extends CompletedOrdersState {
  final String errorMessage;

  CompletedOrdersFailure({required this.errorMessage});
}

final class CompletedOrdersEmpty extends CompletedOrdersState {}
