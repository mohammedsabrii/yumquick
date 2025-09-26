import 'package:flutter/material.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/home/entity/search_entity.dart';

class SearchResultsListTile extends StatelessWidget {
  const SearchResultsListTile({super.key, required this.searchEntity});
  final SearchEntity searchEntity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: MediaQuery.sizeOf(context).width * 0.096,
        height: MediaQuery.sizeOf(context).height * 0.048,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(searchEntity.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        searchEntity.name,
        style: AppStyles.styleLeagueSpartanMediem14(
          context,
        ).copyWith(color: AppColor.kDarkRed),
      ),
      trailing: Text(
        "\$${searchEntity.price}",
        style: AppStyles.styleLeagueSpartanMediem14(
          context,
        ).copyWith(color: AppColor.kMainColor),
      ),
    );
  }
}
