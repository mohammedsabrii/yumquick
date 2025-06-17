import 'package:flutter/material.dart';
import 'package:yumquick/feactures/home/data/offers_list.dart';
import 'package:yumquick/feactures/home/presentation/view/widget/custom_offers_widget.dart';
import 'package:yumquick/feactures/onPording/presentation/views/widget/custom_dot_indicator_list.dart';

class OffersPageView extends StatefulWidget {
  const OffersPageView({super.key});

  @override
  State<OffersPageView> createState() => _OffersPageViewState();
}

class _OffersPageViewState extends State<OffersPageView> {
  late PageController pageController;
  int pageIndex = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      pageIndex = pageController.page!.round();
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.175,
      child: PageView.builder(
        itemCount: offersList.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CustomOffersWidget(model: offersList[index]),
              const SizedBox(height: 5),
              CustomDotIdctorList(cruntPageIndex: pageIndex),
            ],
          );
        },
      ),
    );
  }
}
