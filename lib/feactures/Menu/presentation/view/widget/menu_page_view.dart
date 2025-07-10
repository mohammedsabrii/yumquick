import 'package:flutter/widgets.dart';
import 'package:yumquick/feactures/Menu/presentation/data/menu_data.dart';

class MenuPageView extends StatefulWidget {
  const MenuPageView({super.key, this.pageController});

  final PageController? pageController;

  @override
  State<MenuPageView> createState() => _MenuPageViewState();
}

class _MenuPageViewState extends State<MenuPageView> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      controller: widget.pageController,
      itemCount: menuList.length,
      itemBuilder: (context, index) => menuList[index],
    );
  }
}
