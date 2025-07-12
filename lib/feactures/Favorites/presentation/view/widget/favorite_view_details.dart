import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Favorites/presentation/view/widget/favorite_grid_view.dart';

class FavoriteViewDetails extends StatelessWidget {
  const FavoriteViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.82,
        decoration: const BoxDecoration(
          color: AppColor.kCultured,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.041,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.0399),
                Text(
                  'It`s time to buy your favorite dish.',
                  textAlign: TextAlign.center,
                  style: AppStyles.styleLeagueSpartanMediem20(
                    context,
                  ).copyWith(color: AppColor.kMainColor),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
                const FavoriteGridView(),
                const SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
