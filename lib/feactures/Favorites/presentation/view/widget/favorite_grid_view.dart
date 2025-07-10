import 'package:flutter/material.dart';
import 'package:yumquick/feactures/Favorites/presentation/view/widget/favorite_view_item.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 7,
        mainAxisSpacing: 35,
      ),
      itemBuilder: (context, index) {
        return const FavoriteViewItem();
      },
    );
  }
}
