import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/Menu/presentation/view/manger/catgory_item_model.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/catgory_item.dart';

class SnacksCategoryListView extends StatelessWidget {
  const SnacksCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CatgoryItem(
          catgoryItemModel: CatgoryItemModel(
            image: AppAssets.kSnaksImageTest,
            title: 'Mexican appetizer',
            price: '15',
            subTitle: 'Tortilla Chips With Toppins',
          ),
        );
      },
    );
  }
}
