import 'package:flutter/material.dart';
import 'package:yumquick/core/widget/custom_Container.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/catgory_header.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/vigan_catgory_list_view.dart';

class ViganDetails extends StatelessWidget {
  const ViganDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.089,
        ),
        child: const Column(
          children: [CatgoryHeader(), Expanded(child: ViganCatgoryListView())],
        ),
      ),
    );
  }
}
