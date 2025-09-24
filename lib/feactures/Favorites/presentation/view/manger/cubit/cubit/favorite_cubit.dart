import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

part 'favorite_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  final supabase = Supabase.instance.client;

  Future<void> fetchFavorites() async {
    emit(FavoritesLoading());
    final userId = supabase.auth.currentUser?.id;

    if (userId == null) {
      emit(FavoritesEmpty());
      return;
    }

    try {
      final response = await supabase
          .from('favorites')
          .select('''
            product_id,
            products!inner (
              id,
              name,
              image,
              subtitle,
              price,
              price_after_discount,
              categories
            )
          ''')
          .eq('user_id', userId);

      final favorites =
          (response as List)
              .map(
                (fav) => ProductsEntity.fromJson(
                  fav['products'] as Map<String, dynamic>,
                ),
              )
              .toList();

      if (favorites.isEmpty) {
        emit(FavoritesEmpty());
      } else {
        emit(FavoritesSuccess(favorites));
      }
    } catch (e) {
      emit(FavoritesFailure(e.toString()));
    }
  }

  Future<void> toggleFavorite(ProductsEntity product) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      emit(FavoritesFailure('Please log in to add favorites'));
      return;
    }

    try {
      final response =
          await supabase
              .from('favorites')
              .select()
              .eq('user_id', userId)
              .eq('product_id', product.id)
              .maybeSingle();

      if (response != null) {
        await supabase
            .from('favorites')
            .delete()
            .eq('user_id', userId)
            .eq('product_id', product.id);
      } else {
        await supabase.from('favorites').insert({
          'user_id': userId,
          'product_id': product.id,
        });
      }

      await fetchFavorites();
    } catch (e) {
      emit(FavoritesFailure(e.toString()));
    }
  }
}
