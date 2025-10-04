import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/home/entity/cart_entity.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class CartsService {
  final supabase = Supabase.instance.client;

  Future<List<CartEntity>> fetchFromCarts(String userId) async {
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
        .eq('user_id', userId);

    return (response as List).map((cart) => CartEntity.fromJson(cart)).toList();
  }

  Future<void> addToCart(
    String userId,
    ProductsEntity product,
    int quantity,
  ) async {
    await supabase.from('carts').insert({
      'user_id': userId,
      'product_id': product.id,
      'quantity': quantity,
    });
  }

  Future<void> updateQuantity(
    String userId,
    ProductsEntity product,
    int newQuantity,
  ) async {
    await supabase
        .from('carts')
        .update({"quantity": newQuantity})
        .eq('user_id', userId)
        .eq('product_id', product.id);
  }

  Future<void> removeFromCart(String userId, String productId) async {
    await supabase
        .from('carts')
        .delete()
        .eq('user_id', userId)
        .eq('product_id', productId);
  }
}
