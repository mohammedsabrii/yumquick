import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_page_header.dart';
import 'package:yumquick/feactures/Favorites/presentation/view/widget/favorite_view_details.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.048),
        CustomPageHeader(
          title: 'Favorites',
          space: MediaQuery.sizeOf(context).width * 0.244,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
        const FavoriteViewDetails(),
      ],
    );
  }
}
