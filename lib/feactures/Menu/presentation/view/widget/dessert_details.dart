import 'package:flutter/widgets.dart';
import 'package:yumquick/core/widget/custom_container.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/catgory_header.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/dessert_category_list_view.dart';

class DessertDetails extends StatelessWidget {
  const DessertDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: const Column(
          children: [
            CatgoryHeader(),
            Expanded(child: DessertCategoryListView()),
          ],
        ),
      ),
    );
  }
}
