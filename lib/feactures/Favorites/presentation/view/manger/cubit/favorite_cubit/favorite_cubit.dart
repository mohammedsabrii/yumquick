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
          .eq('user_id', userId!);

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

  Future<void> addFavorite(ProductsEntity product) async {
    final userId = supabase.auth.currentUser?.id;

    try {
      await supabase.from('favorites').insert({
        'user_id': userId,
        'product_id': product.id,
      });

      if (state is FavoritesSuccess) {
        final current = List<ProductsEntity>.from(
          (state as FavoritesSuccess).favorites,
        );
        current.add(product);
        emit(FavoritesSuccess(current));
      } else {
        emit(FavoritesSuccess([product]));
      }
    } catch (e) {
      emit(FavoritesFailure(e.toString()));
    }
  }

  Future<void> removeFavorite(ProductsEntity product) async {
    final userId = supabase.auth.currentUser?.id;

    try {
      await supabase
          .from('favorites')
          .delete()
          .eq('user_id', userId!)
          .eq('product_id', product.id);

      if (state is FavoritesSuccess) {
        final current = List<ProductsEntity>.from(
          (state as FavoritesSuccess).favorites,
        );
        current.removeWhere((p) => p.id == product.id);

        if (current.isEmpty) {
          emit(FavoritesEmpty());
        } else {
          emit(FavoritesSuccess(current));
        }
      }
    } catch (e) {
      emit(FavoritesFailure(e.toString()));
    }
  }
}
