import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/Menu/presentation/view/manger/catgory_item_model.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/category_prodact.dart';

class ViganCategoryListView extends StatelessWidget {
  const ViganCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CategoryProdact(
          categoryItemModel: CategoryItemModel(
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
