import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/Menu/presentation/view/manger/catgory_item_model.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/catgory_item.dart';

class MealCategoryListView extends StatelessWidget {
  const MealCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CatgoryItem(
          catgoryItemModel: CatgoryItemModel(
            image: AppAssets.kMaleImageTest,
            title: 'Fresh Prawn Ceviche',
            price: '15',
            subTitle:
                'Shrimp marinated in zesty lime juice, mixed with crisp onions, tomatoes, and cilantro',
          ),
        );
      },
    );
  }
}
