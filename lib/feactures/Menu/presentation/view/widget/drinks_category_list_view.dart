import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/feactures/Menu/presentation/view/manger/catgory_item_model.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/catgory_prodact.dart';

class DrinksCategoryListView extends StatelessWidget {
  const DrinksCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CatgoryProdact(
          catgoryItemModel: CatgoryItemModel(
            image: AppAssets.kSnaksImageTest,
            title: 'Mojito',
            price: '15',
            subTitle:
                'Made with white rum, fresh mint leaves, lime juice, simple syrup, and a splash of soda water.',
          ),
        );
      },
    );
  }
}
