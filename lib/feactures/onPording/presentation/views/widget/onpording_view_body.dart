import 'package:flutter/material.dart';
import 'package:yumquick/feactures/onPording/data/onpording_list.dart';
import 'package:yumquick/feactures/onPording/presentation/views/widget/custom_onpording_header.dart';
import 'package:yumquick/feactures/onPording/presentation/views/widget/onpording_background_image.dart';
import 'package:yumquick/feactures/onPording/presentation/views/widget/onpording_details.dart';

class OnpordingViewBody extends StatefulWidget {
  const OnpordingViewBody({super.key});

  @override
  State<OnpordingViewBody> createState() => _OnpordingViewBodyState();
}

class _OnpordingViewBodyState extends State<OnpordingViewBody> {
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
    return PageView.builder(
      controller: pageController,
      itemCount: onpordingList.length,
      itemBuilder:
          (context, index) => Stack(
            children: [
              OnProdingBackGroundImage(image: onpordingList[index].image),

              Positioned(
                bottom: 0,
                child: OnpordingDetails(
                  onTap: () {
                    pageController.jumpToPage(pageIndex + 1);
                  },
                  cruntPageIndex: pageIndex,
                  title: onpordingList[index].title,
                  supTitle: onpordingList[index].subtitle,
                  icon: onpordingList[index].icon,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child:
                    pageIndex < 2 ? const CustomOnpordingHeader() : Container(),
              ),
            ],
          ),
    );
  }
}
