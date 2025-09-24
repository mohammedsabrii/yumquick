import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquick/feactures/Favorites/presentation/view/manger/cubit/cubit/favorite_cubit.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class FavoriteWidget extends StatelessWidget {
  final ProductsEntity productsEntity;

  const FavoriteWidget({super.key, required this.productsEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<FavoritesCubit>().toggleFavorite(productsEntity);
      },
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          bool isFavorited = false;

          if (state is FavoritesSuccess) {
            isFavorited = state.favorites.any(
              (product) => product.id == productsEntity.id,
            );
          }

          return Container(
            height: MediaQuery.sizeOf(context).height * 0.032,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.red : Colors.grey,
              size: 20,
            ),
          );
        },
      ),
    );
  }
}
