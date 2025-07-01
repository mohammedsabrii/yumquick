import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/grid_view_item.dart';

class SearchSliverGride extends StatelessWidget {
  const SearchSliverGride({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return const GridViewItem();
      }, childCount: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
      ),
    );
  }
}
