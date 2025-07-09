import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/Menu/presentation/view/manger/catgory_item_model.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/catgory_item.dart';

class ViganCatgoryListView extends StatelessWidget {
  const ViganCatgoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CatgoryItem(
          catgoryItemModel: CatgoryItemModel(
            image: AppAssets.kVeganImageTest,
            title: 'mushroom risotto',
            price: '15',
            subTitle:
                'Creamy mushroom risotto, cooked to perfection with arborio rice, wild mushrooms, Parmesan cheese, and white wine.',
          ),
        );
      },
    );
  }
}
