import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';
import 'package:yumquick/feactures/Favorites/presentation/view/manger/cubit/cubit/favorite_cubit.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        bool isFavorited = false;

        if (state is FavoritesSuccess) {
          isFavorited = state.favorites.any(
            (product) => product.id == productsEntity.id,
          );
        }

        return GestureDetector(
          onTap: () {
            if (isFavorited) {
              context.read<FavoritesCubit>().removeFavorite(productsEntity);
              customShowSnackBar(context, title: 'Removed from favorites');
            } else {
              context.read<FavoritesCubit>().addFavorite(productsEntity);
              customShowSnackBar(context, title: 'Added to favorites');
            }
          },
          child: Container(
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
          ),
        );
      },
    );
  }
}
