import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/home/entity/cart_entity.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

part 'cart_state.dart';

class CartsCubit extends Cubit<CartsState> {
  CartsCubit() : super(CartsInitial());

  final supabase = Supabase.instance.client;

  Future<void> fetchFromCarts() async {
    emit(CartsLoading());
    final userId = supabase.auth.currentUser?.id;

    try {
      final response = await supabase
          .from('carts')
          .select('''
          quantity,
          products!inner (
            id,
            name,
            image,
            subtitle,
            price,
            price_after_discount,
            categories,
            created_at
          )
        ''')
          .eq('user_id', userId!);

      final cartItems =
          (response as List).map((cart) => CartEntity.fromJson(cart)).toList();

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
    final userId = supabase.auth.currentUser?.id;

    try {
      if (state is CartsSuccess) {
        final current = List<CartEntity>.from(
          (state as CartsSuccess).cartProducts,
        );
        final index = current.indexWhere((c) => c.product.id == product.id);

        if (index != -1) {
          final newQuantity = current[index].quantity + 1;
          await supabase
              .from('carts')
              .update({"quantity": newQuantity})
              .eq('user_id', userId!)
              .eq('product_id', product.id);

          current[index] = CartEntity(product: product, quantity: newQuantity);
          emit(CartsSuccess(current));
          return;
        }
      }

      await supabase.from('carts').insert({
        'user_id': userId,
        'product_id': product.id,
        'quantity': 1,
      });

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

  Future<void> updateQuantity(ProductsEntity product, int newQuantity) async {
    final userId = supabase.auth.currentUser?.id;

    try {
      if (newQuantity < 1) newQuantity = 1;

      await supabase
          .from('carts')
          .update({"quantity": newQuantity})
          .eq('user_id', userId!)
          .eq('product_id', product.id);

      if (state is CartsSuccess) {
        final current = List<CartEntity>.from(
          (state as CartsSuccess).cartProducts,
        );
        final index = current.indexWhere((c) => c.product.id == product.id);
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
    final userId = supabase.auth.currentUser?.id;

    try {
      await supabase
          .from('carts')
          .delete()
          .eq('user_id', userId!)
          .eq('product_id', product.product.id);

      if (state is CartsSuccess) {
        final current = List<CartEntity>.from(
          (state as CartsSuccess).cartProducts,
        );
        current.removeWhere((p) => p.product.id == product.product.id);

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
    return (state as CartsSuccess).cartProducts.fold(
      0,
      (sum, c) => sum + (c.product.price * c.quantity),
    );
  }

  double get taxAndFees => subtotal * 0.02;
  double get delivery => 3;
  double get total => subtotal + taxAndFees + delivery;
}
