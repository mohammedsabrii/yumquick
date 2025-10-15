import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/core/service/carts_service.dart';
import 'package:yumquick/feactures/home/entity/cart_entity.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

part 'cart_state.dart';

class CartsCubit extends Cubit<CartsState> {
  CartsCubit() : super(CartsInitial());
  final supabase = Supabase.instance.client;
  String? get userId => supabase.auth.currentUser?.id;
  final cartsService = CartsService();
  Future<void> fetchFromCarts() async {
    emit(CartsLoading());
    try {
      final cartItems = await cartsService.fetchFromCarts(userId!);

      if (cartItems.isEmpty) {
        emit(CartsEmpty());
      } else {
        emit(CartsSuccess(cartItems));
      }
    } catch (e) {
      emit(CartsFailure(e.toString()));
    }
  }

  Future<void> addToCart(ProductsEntity product) async {
    try {
      if (state is CartsSuccess) {
        final current = List<CartEntity>.from(
          (state as CartsSuccess).cartProducts,
        );
        final index = current.indexWhere(
          (cartEntity) => cartEntity.product.id == product.id,
        );

        if (index != -1) {
          final newQuantity = current[index].quantity + 1;
          await cartsService.updateQuantity(userId!, product, newQuantity);

          current[index] = CartEntity(product: product, quantity: newQuantity);
          emit(CartsSuccess(current));
          return;
        }
      }

      await cartsService.addToCart(userId!, product, 1);

      if (state is CartsSuccess) {
        final current = List<CartEntity>.from(
          (state as CartsSuccess).cartProducts,
        );
        current.add(CartEntity(product: product, quantity: 1));
        emit(CartsSuccess(current));
      } else {
        emit(CartsSuccess([CartEntity(product: product, quantity: 1)]));
      }
    } catch (e) {
      emit(CartsFailure(e.toString()));
    }
  }

  Future<void> addToCartWithQuantity(
    ProductsEntity product,
    int quantity,
  ) async {
    try {
      if (quantity < 1) quantity = 1;

      if (state is CartsSuccess) {
        final current = List<CartEntity>.from(
          (state as CartsSuccess).cartProducts,
        );
        final index = current.indexWhere(
          (cartEntity) => cartEntity.product.id == product.id,
        );
        if (index != -1) {
          final newQuantity = current[index].quantity + quantity;
          await cartsService.updateQuantity(userId!, product, newQuantity);
          current[index] = CartEntity(product: product, quantity: newQuantity);
          emit(CartsSuccess(current));
          return;
        }
      }

      await cartsService.addToCart(userId!, product, quantity);

      if (state is CartsSuccess) {
        final current = List<CartEntity>.from(
          (state as CartsSuccess).cartProducts,
        );
        current.add(CartEntity(product: product, quantity: quantity));
        emit(CartsSuccess(current));
      } else {
        emit(CartsSuccess([CartEntity(product: product, quantity: quantity)]));
      }
    } catch (e) {
      emit(CartsFailure(e.toString()));
    }
  }

  Future<void> updateQuantity(ProductsEntity product, int newQuantity) async {
    try {
      if (newQuantity < 1) newQuantity = 1;

      await cartsService.updateQuantity(userId!, product, newQuantity);

      if (state is CartsSuccess) {
        final current = List<CartEntity>.from(
          (state as CartsSuccess).cartProducts,
        );
        final index = current.indexWhere(
          (cartEntity) => cartEntity.product.id == product.id,
        );
        if (index != -1) {
          current[index] = CartEntity(product: product, quantity: newQuantity);
          emit(CartsSuccess(current));
        }
      }
    } catch (e) {
      emit(CartsFailure(e.toString()));
    }
  }

  Future<void> removeFromCart(CartEntity product) async {
    try {
      await cartsService.removeFromCart(userId!, product.product.id);

      if (state is CartsSuccess) {
        final current = List<CartEntity>.from(
          (state as CartsSuccess).cartProducts,
        );
        current.removeWhere(
          (cartEntity) => cartEntity.product.id == product.product.id,
        );

        if (current.isEmpty) {
          emit(CartsEmpty());
        } else {
          emit(CartsSuccess(current));
        }
      }
    } catch (e) {
      emit(CartsFailure(e.toString()));
    }
  }

  double get subtotal {
    if (state is! CartsSuccess) return 0;

    return (state as CartsSuccess).cartProducts.fold(0, (sum, cartEntity) {
      final product = cartEntity.product;
      final effectivePrice = product.priceAfterDiscount ?? product.price;
      return sum + (effectivePrice * cartEntity.quantity);
    });
  }

  double get taxAndFees => subtotal * 0.02;
  double get delivery => 3;
  double get total => subtotal + taxAndFees + delivery;
}
