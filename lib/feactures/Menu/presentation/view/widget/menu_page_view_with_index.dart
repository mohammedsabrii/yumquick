import 'package:flutter/widgets.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/category_coutainer.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/category_page_view_list.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/menu_page_view.dart';

class MenuPageViewWithIndex extends StatefulWidget {
  const MenuPageViewWithIndex({super.key});

  @override
  State<MenuPageViewWithIndex> createState() => _MenuPageViewWithIndexState();
}

class _MenuPageViewWithIndexState extends State<MenuPageViewWithIndex> {
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
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CategoryContiner(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.0234),
          CategoryPageViewList(
            cruntPageIndex: pageIndex,
            pageController: pageController,
          ),
          Expanded(child: MenuPageView(pageController: pageController)),
        ],
      ),
    );
  }
}
