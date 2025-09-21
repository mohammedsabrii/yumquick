import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/feactures/search/presentation/view/widget/search_sliver_gride.dart';

class SearchResultDetails extends StatelessWidget {
  const SearchResultDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Categories',
                    textAlign: TextAlign.center,
                    style: AppStyles.styleLeagueSpartanMediem20(
                      context,
                    ).copyWith(color: AppColor.kDarkRed),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            // const SearchSliverGride(),
          ],
        ),
      ),
    );
  }
}
