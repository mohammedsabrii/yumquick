import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Favorites/presentation/view/manger/cubit/cubit/favorite_cubit.dart';
import 'package:yumquick/feactures/Favorites/presentation/view/widget/favorite_view_item.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kMainColor),
          );
        } else if (state is FavoritesEmpty) {
          return const Center(
            child: Text(
              'No favorites yet!',
              style: TextStyle(color: AppColor.kMainColor),
            ),
          );
        } else if (state is FavoritesSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: state.favorites.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 7,
              mainAxisSpacing: 35,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return FavoriteViewItem(productsEntity: state.favorites[index]);
            },
          );
        } else if (state is FavoritesFailure) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
