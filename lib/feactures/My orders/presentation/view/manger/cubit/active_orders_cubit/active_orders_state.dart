part of 'active_orders_cubit.dart';

@immutable
abstract class ActiveOrdersState {}

class ActiveOrdersInitial extends ActiveOrdersState {}

class ActiveOrdersLoading extends ActiveOrdersState {}

class ActiveOrdersEmpty extends ActiveOrdersState {}

class ActiveOrdersSuccess extends ActiveOrdersState {
  final List<OrdersEntity> orders;

  ActiveOrdersSuccess(this.orders);
}

class ActiveOrdersFailure extends ActiveOrdersState {
  final String errorMessage;

  ActiveOrdersFailure(this.errorMessage);
}
