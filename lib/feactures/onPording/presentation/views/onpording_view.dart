import 'package:flutter/material.dart';
import 'package:yumquick/feactures/onPording/presentation/views/widget/onpording_view_body.dart';

class OnpordingView extends StatefulWidget {
  const OnpordingView({super.key});

  @override
  State<OnpordingView> createState() => _OnpordingViewState();
}

class _OnpordingViewState extends State<OnpordingView> {
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
    return SafeArea(
      child: Scaffold(
        body: OnpordingViewBody(
          pageController: pageController,
          cruntPageIndex: pageIndex,
        ),
      ),
    );
  }
}
