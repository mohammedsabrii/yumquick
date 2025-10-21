part of 'on_track_orders_cubit.dart';

@immutable
sealed class OnTrackOrdersState {}

final class OnTrackOrdersInitial extends OnTrackOrdersState {}

final class OnTrackOrdersSuccess extends OnTrackOrdersState {
  final List<OrdersEntity> onTrakOrders;

  OnTrackOrdersSuccess({required this.onTrakOrders});
}

final class OnTrackOrdersLoading extends OnTrackOrdersState {}

final class OnTrackOrdersFailure extends OnTrackOrdersState {
  final String errorMessage;

  OnTrackOrdersFailure({required this.errorMessage});
}

final class OnTrackOrdersEmpty extends OnTrackOrdersState {}
