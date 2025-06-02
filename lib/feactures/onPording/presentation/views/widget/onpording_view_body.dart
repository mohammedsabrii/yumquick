import 'package:flutter/material.dart';
import 'package:yumquick/feactures/onPording/presentation/views/data/onpording_list.dart';
import 'package:yumquick/feactures/onPording/presentation/views/widget/custom_onpording_header.dart';
import 'package:yumquick/feactures/onPording/presentation/views/widget/onpording_details.dart';

class OnpordingViewBody extends StatelessWidget {
  const OnpordingViewBody({
    super.key,
    required this.pageController,
    required this.cruntPageIndex,
  });
  final PageController pageController;
  final int cruntPageIndex;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: onpordingList.length,
      itemBuilder:
          (context, index) => Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(onpordingList[index].image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                child: OnpordingDetails(
                  onTap: () {
                    pageController.jumpToPage(cruntPageIndex + 1);
                  },
                  cruntPageIndex: cruntPageIndex,
                  title: onpordingList[index].title,
                  supTitle: onpordingList[index].subtitle,
                  icon: onpordingList[index].icon,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child:
                    cruntPageIndex < 2
                        ? const CustomOnpordingHeader()
                        : Container(),
              ),
            ],
          ),
    );
  }
}
