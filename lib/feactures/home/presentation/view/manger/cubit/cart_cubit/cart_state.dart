part of 'cart_cubit.dart';

@immutable
abstract class CartsState {}

class CartsInitial extends CartsState {}

class CartsLoading extends CartsState {}

class CartsSuccess extends CartsState {
  final List<CartEntity> cartProducts;
  CartsSuccess(this.cartProducts);
}

class CartsEmpty extends CartsState {}

class CartsFailure extends CartsState {
  final String errorMessage;
  CartsFailure(this.errorMessage);
}
