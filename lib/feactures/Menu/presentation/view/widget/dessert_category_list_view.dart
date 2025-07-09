import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/Menu/presentation/view/manger/catgory_item_model.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/catgory_prodact.dart';

class DessertCategoryListView extends StatelessWidget {
  const DessertCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CatgoryProdact(
          catgoryItemModel: CatgoryItemModel(
            image: AppAssets.kDessertImageTest,
            title: 'chocolate brownie',
            price: '15',
            subTitle:
                'premium cocoa, melted chocolate, and a hint of vanilla, creating a moist, fudgy center with a crisp, crackly top.',
          ),
        );
      },
    );
  }
}
