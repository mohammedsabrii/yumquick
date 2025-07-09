import 'package:flutter/widgets.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/catgory_header.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/snacks_category_list_view.dart';

class SnacksDetails extends StatelessWidget {
  const SnacksDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.82,
        decoration: const BoxDecoration(
          color: AppColor.kCultured,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.089,
          ),

          child: const Column(
            children: [
              CatgoryHeader(),
              Expanded(child: SnacksCategoryListView()),
            ],
          ),
        ),
      ),
    );
  }
}
